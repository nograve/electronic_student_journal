part of 'user_changes_bloc.dart';

@freezed
class UserChangesEvent with _$UserChangesEvent {
  const factory UserChangesEvent.started() = _Started;
  const factory UserChangesEvent.observe() = _Observe;
  const factory UserChangesEvent.pauseObserve() = _PauseObserve;
  const factory UserChangesEvent.resumeObserve() = _ResumeObserve;
  const factory UserChangesEvent.userStateChange(User? user) = _UserStateChange;
}
