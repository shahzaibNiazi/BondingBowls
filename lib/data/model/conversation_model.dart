import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_model.freezed.dart';
part 'conversation_model.g.dart';

@freezed
class ConversationModel with _$ConversationModel {
  const factory ConversationModel({
    @JsonKey(name: '_id') String? id,
    String? type,
    OtherUserModel? otherUser,
    String? lastMessage,
    String? lastMessageAt,
    String? lastMessageBy,
    int? unreadCount,
    String? createdAt,
    String? updatedAt,
  }) = _ConversationModel;

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);
}

@freezed
class OtherUserModel with _$OtherUserModel {
  const factory OtherUserModel({
    @JsonKey(name: '_id') String? id,
    String? profilePhoto,
    String? fullName,
    String? nickname,
  }) = _OtherUserModel;

  factory OtherUserModel.fromJson(Map<String, dynamic> json) =>
      _$OtherUserModelFromJson(json);
}
