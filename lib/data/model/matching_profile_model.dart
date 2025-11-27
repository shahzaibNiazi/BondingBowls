import 'package:freezed_annotation/freezed_annotation.dart';

part 'matching_profile_model.freezed.dart';
part 'matching_profile_model.g.dart';

@freezed
class MatchingProfileModel with _$MatchingProfileModel {
  const factory MatchingProfileModel({
    @JsonKey(name: '_id') String? id,

    String? fullName,
    String? profilePhoto,
    String? email,
    String? role,
    String? status,
    String? loginType,
    String? appUsageType,
    String? aiAvatar,
    String? aiAvatarStyle,
    List<String>? profileImages,
    String? datingIntentions,
    bool? pets,
    String? voicePrompt,
    String? video,
    List<String>? greenFlags,
    List<String>? redFlags,
    String? verificationStatus,
    String? verificationMethod,
    List<String>? verificationDocuments,
    bool? profileCompleted,
    String? profileCompletionStep,
    bool? isDelete,
    bool? suspended,
    int? bowlBalance,
    int? permanentChatIncrements,
    List<String>? rejectedUsers,
    int? receivedLikesCount,
    bool? profileBoostActive,
    String? profileBoostExpiresAt,
    bool? crushBowlActive,
    String? crushBowlExpiresAt,
    int? activeConversations,
    int? subscriptionChatIncrements,
    String? fcmToken,
    List<String>? fcmTokens,
    String? createdAt,
    String? updatedAt,
    @JsonKey(name: '__v') int? v,
    String? bio,
    String? clubbing,
    String? drinking,
    String? hobbies,
    String? lifestyleInterests,
    String? location,
    String? nickname,
    String? occupation,
    String? religion,
    String? smoking,
    String? userStatus,
    bool? isRandomProfile,
  }) = _MatchingProfileModel;

  factory MatchingProfileModel.fromJson(Map<String, dynamic> json) =>
      _$MatchingProfileModelFromJson(json);
}
