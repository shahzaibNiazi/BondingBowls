import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: "_id") String? id,
    String? fullName,
    String? profilePhoto,
    String? email,
    String? password,
    String? role,
    String? occupation,
    String? status,
    String? otp,
    String? otpCreatedAt,
    String? loginType,
    String? appUsageType,
    String? aiAvatar,
    String? aiAvatarStyle,
    List<String>? profileImages,
    String? datingIntentions,
    bool? pets,
    String? voicePrompt,
    List<String>? greenFlags,
    List<String>? redFlags,
    String? verificationStatus,
    String? verificationMethod,
    List<String>? verificationDocuments,
    bool? profileCompleted,
    String? profileCompletionStep,
    String? createdAt,
    String? updatedAt,
    @JsonKey(name: "__v") int? v,

    // ✅ Extra fields you had in JSON but missing in model
    String? bio,
    String? clubbing,
    String? drinking,
    String? hobbies,
    String? lifestyleInterests,
    String? location,
    String? nickname,
    String? religion,
    String? smoking,
    String? userStatus,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
