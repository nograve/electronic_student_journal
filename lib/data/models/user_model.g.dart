// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      registeredAt: json['registeredAt'] == null
          ? null
          : DateTime.parse(json['registeredAt'] as String),
      lastAccessed: json['lastAccessed'] == null
          ? null
          : DateTime.parse(json['lastAccessed'] as String),
      name: json['name'] as String?,
      surname: json['surname'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'role': instance.role,
      'registeredAt': instance.registeredAt?.toIso8601String(),
      'lastAccessed': instance.lastAccessed?.toIso8601String(),
      'name': instance.name,
      'surname': instance.surname,
    };
