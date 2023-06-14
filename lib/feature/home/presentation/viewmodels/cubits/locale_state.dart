part of 'locale_cubit.dart';

@freezed
class LocaleState with _$LocaleState {
  const factory LocaleState.initial() = _Initial;
  const factory LocaleState.loading() = _Loading;
  const factory LocaleState.loaded(String locale) = _Loaded;
  const factory LocaleState.saved(String locale) = _Saved;
  const factory LocaleState.failure(String message) = _Failure;
}
