// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Admin _$$_AdminFromJson(Map<String, dynamic> json) => _$_Admin(
      email: json['email'] as String,
      lastAccessed: DateTime.parse(json['lastAccessed'] as String),
      registeredAt: DateTime.parse(json['registeredAt'] as String),
    );

Map<String, dynamic> _$$_AdminToJson(_$_Admin instance) => <String, dynamic>{
      'email': instance.email,
      'lastAccessed': instance.lastAccessed.toIso8601String(),
      'registeredAt': instance.registeredAt.toIso8601String(),
    };
