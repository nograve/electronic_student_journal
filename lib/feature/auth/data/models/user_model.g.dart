// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      registeredAt: const TimestampConverter()
          .fromJson(json['registeredAt'] as Timestamp),
      lastAccessed: const TimestampNullableConverter()
          .fromJson(json['lastAccessed'] as Timestamp?),
      name: json['name'] as String?,
      surname: json['surname'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'role': instance.role,
      'registeredAt': const TimestampConverter().toJson(instance.registeredAt),
      'lastAccessed':
          const TimestampNullableConverter().toJson(instance.lastAccessed),
      'name': instance.name,
      'surname': instance.surname,
    };
