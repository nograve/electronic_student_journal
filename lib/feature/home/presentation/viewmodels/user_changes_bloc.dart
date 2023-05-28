import 'dart:async';

import 'package:electronic_student_journal/core/app/di/injector.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/get_user_changes_stream_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'user_changes_bloc.freezed.dart';
part 'user_changes_event.dart';
part 'user_changes_state.dart';

class UserChangesBloc extends Bloc<UserChangesEvent, UserChangesState> {
  UserChangesBloc({
    required GetUserChangesStreamUseCase getUserChangesStreamUseCase,
  })  : _getUserChangesStreamUseCase = getUserChangesStreamUseCase,
        super(const _Initial()) {
    _stream = _getUserChangesStreamUseCase.call();

    on<_Started>(_started);
    on<_Observe>(_observe);
    on<_PauseObserve>(_pauseObserve);
    on<_ResumeObserve>(_resumeObserve);
    on<_UserStateChange>(_userStateChange);

    on<UserChangesEvent>(_logEvent);

    add(const _Started());
  }

  final GetUserChangesStreamUseCase _getUserChangesStreamUseCase;
  late Stream<User?> _stream;
  StreamSubscription<User?>? _subscription;
  final logger = injector<Logger>();

  void _logEvent(UserChangesEvent event, Emitter<UserChangesState> emit) {
    logger.i(event);
  }

  void _started(_Started event, Emitter<UserChangesState> emit) {}

  void _observe(_Observe event, Emitter<UserChangesState> emit) {
    logger.i(event);
    _subscription ??= _stream.listen((event) {
      add(_UserStateChange(event));
    });
  }

  void _pauseObserve(_PauseObserve event, Emitter<UserChangesState> emit) {
    if (_subscription != null) {
      _subscription!.pause();
    }
  }

  void _resumeObserve(_ResumeObserve event, Emitter<UserChangesState> emit) {
    if (_subscription != null) {
      _subscription!.resume();
    }
  }

  void _userStateChange(
    _UserStateChange event,
    Emitter<UserChangesState> emit,
  ) {
    if (event.user != null) {
      emit(_UserSignsIn(event.user!));
    } else {
      emit(const _UserSignsOut());
    }
  }

  @override
  Future<void> close() {
    if (_subscription != null) {
      _subscription!.cancel();
    }
    return super.close();
  }
}
