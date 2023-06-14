import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'locale_params.freezed.dart';

@freezed
class LocaleParams with _$LocaleParams {
  const factory LocaleParams({
    required String locale,
  }) = _LocaleParams;
}
