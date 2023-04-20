// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdminModel _$$_AdminModelFromJson(Map<String, dynamic> json) =>
    _$_AdminModel(
      id: json['id'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      lastAccessed: DateTime.parse(json['lastAccessed'] as String),
      registeredAt: DateTime.parse(json['registeredAt'] as String),
    );

Map<String, dynamic> _$$_AdminModelToJson(_$_AdminModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'role': instance.role,
      'lastAccessed': instance.lastAccessed.toIso8601String(),
      'registeredAt': instance.registeredAt.toIso8601String(),
    };
