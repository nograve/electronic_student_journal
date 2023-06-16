import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scores_names_state.dart';
part 'scores_names_cubit.freezed.dart';

class ScoresNamesCubit extends Cubit<ScoresNamesState> {
  ScoresNamesCubit({List<String>? scoresNames})
      : super(ScoresNamesState.initial(scoresNames ?? []));

  void addScoreName(String scoreName) {
    final scoresNames = List.of(state.scoresNames)..add(scoreName);
    emit(_ScoreNameAdded(scoresNames));
  }

  void removeScoreName(String scoreName) {
    final scoresNames = List.of(state.scoresNames)..remove(scoreName);

    emit(_ScoreNameRemoved(scoresNames));
  }
}
