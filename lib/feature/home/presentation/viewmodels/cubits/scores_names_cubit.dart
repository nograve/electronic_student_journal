import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scores_names_state.dart';
part 'scores_names_cubit.freezed.dart';

class ScoresNamesCubit extends Cubit<ScoresNamesState> {
  ScoresNamesCubit({required List<String> scoresNames})
      : super(ScoresNamesState.initial(scoresNames));

  void addScoreName(String scoreName) {
    // emit(_Loading(state.scoresNames));
    state.scoresNames.add(scoreName);

    emit(_ScoreAdded(state.scoresNames));
  }

  void removeScoreName(int index) {
    // emit(_Loading(state.scoresNames));
    state.scoresNames.removeAt(index);

    emit(_ScoreNameRemoved(state.scoresNames));
  }
}
