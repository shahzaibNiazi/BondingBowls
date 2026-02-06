// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationModelImpl _$$ConversationModelImplFromJson(
  Map<String, dynamic> json,
) => _$ConversationModelImpl(
  id: json['_id'] as String?,
  type: json['type'] as String?,
  otherUser: json['otherUser'] == null
      ? null
      : OtherUserModel.fromJson(json['otherUser'] as Map<String, dynamic>),
  lastMessage: json['lastMessage'] as String?,
  lastMessageAt: json['lastMessageAt'] as String?,
  lastMessageBy: json['lastMessageBy'] == null
      ? null
      : OtherUserModel.fromJson(json['lastMessageBy'] as Map<String, dynamic>),
  unreadCount: (json['unreadCount'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$$ConversationModelImplToJson(
  _$ConversationModelImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'type': instance.type,
  'otherUser': instance.otherUser,
  'lastMessage': instance.lastMessage,
  'lastMessageAt': instance.lastMessageAt,
  'lastMessageBy': instance.lastMessageBy,
  'unreadCount': instance.unreadCount,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};

_$OtherUserModelImpl _$$OtherUserModelImplFromJson(Map<String, dynamic> json) =>
    _$OtherUserModelImpl(
      id: json['_id'] as String?,
      profilePhoto: json['profilePhoto'] as String?,
      fullName: json['fullName'] as String?,
      nickname: json['nickname'] as String?,
    );

Map<String, dynamic> _$$OtherUserModelImplToJson(
  _$OtherUserModelImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'profilePhoto': instance.profilePhoto,
  'fullName': instance.fullName,
  'nickname': instance.nickname,
};
