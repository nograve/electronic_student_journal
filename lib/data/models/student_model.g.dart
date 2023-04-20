// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StudentModel _$$_StudentModelFromJson(Map<String, dynamic> json) =>
    _$_StudentModel(
      id: json['id'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      lastAccessed: DateTime.parse(json['lastAccessed'] as String),
      registeredAt: DateTime.parse(json['registeredAt'] as String),
    );

Map<String, dynamic> _$$_StudentModelToJson(_$_StudentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'role': instance.role,
      'name': instance.name,
      'surname': instance.surname,
      'lastAccessed': instance.lastAccessed.toIso8601String(),
      'registeredAt': instance.registeredAt.toIso8601String(),
    };
