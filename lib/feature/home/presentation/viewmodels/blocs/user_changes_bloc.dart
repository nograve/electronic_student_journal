import 'dart:async';

import 'package:electronic_student_journal/core/app/di/injector.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_params.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/get_user_changes_stream_usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/update_access_time_usecase.dart';
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
    required UpdateAccessTimeUseCase updateAccessTimeUseCase,
  })  : _updateAccessTimeUseCase = updateAccessTimeUseCase,
        super(const _Initial()) {
    getUserChangesStreamUseCase.call(NoParams()).fold(
          (failure) => logger.e(failure.message),
          (stream) => _stream = stream,
        );

    on<_Started>(_started);
    on<_Observe>(_observe);
    on<_PauseObserve>(_pauseObserve);
    on<_ResumeObserve>(_resumeObserve);
    on<_UserStateChange>(_userStateChange);

    on<UserChangesEvent>(_logEvent);

    add(const _Started());
  }

  final UpdateAccessTimeUseCase _updateAccessTimeUseCase;

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
      _updateAccessTimeUseCase.call(UserParams(uid: event.user!.uid));
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
