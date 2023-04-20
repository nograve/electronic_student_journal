// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Teacher _$$_TeacherFromJson(Map<String, dynamic> json) => _$_Teacher(
      email: json['email'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      lastAccessed: DateTime.parse(json['lastAccessed'] as String),
      registeredAt: DateTime.parse(json['registeredAt'] as String),
    );

Map<String, dynamic> _$$_TeacherToJson(_$_Teacher instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'surname': instance.surname,
      'lastAccessed': instance.lastAccessed.toIso8601String(),
      'registeredAt': instance.registeredAt.toIso8601String(),
    };
