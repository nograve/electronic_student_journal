part of 'user_changes_bloc.dart';

@freezed
class UserChangesState with _$UserChangesState {
  const factory UserChangesState.initial() = _Initial;
  const factory UserChangesState.userSignsIn(User user) = _UserSignsIn;
  const factory UserChangesState.userSingsOut() = _UserSignsOut;
}
