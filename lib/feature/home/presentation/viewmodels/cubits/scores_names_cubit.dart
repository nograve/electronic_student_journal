import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scores_names_state.dart';
part 'scores_names_cubit.freezed.dart';

class ScoresNamesCubit extends Cubit<ScoresNamesState> {
  ScoresNamesCubit({required List<String> scoresNames})
      : super(ScoresNamesState.initial(List.of(scoresNames)));

  void addScoreName(String scoreName) {
    // emit(_Loading(state.scoresNames));
    final scoresNames = List.of(state.scoresNames)
      ..add(scoreName)
      ..toSet().toList();

    emit(_ScoreAdded(scoresNames));
  }

  void removeScoreName(String scoreName) {
    // emit(_Loading(state.scoresNames));
    final scoresNames = List.of(state.scoresNames)..remove(scoreName);

    emit(_ScoreNameRemoved(scoresNames));
  }
}
