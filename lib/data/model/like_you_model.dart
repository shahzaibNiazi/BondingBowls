import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_you_model.freezed.dart';
part 'like_you_model.g.dart';

@freezed
class LikeYouModel with _$LikeYouModel {
  const factory LikeYouModel({
    @JsonKey(name: '_id') String? id,
    String? bookingId,
    RequestedBy? requestedBy,
    String? status,
    String? message,
    DateTime? respondedAt,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    @JsonKey(name: '__v') int? v,
  }) = _LikeYouModel;

  factory LikeYouModel.fromJson(Map<String, dynamic> json) =>
      _$LikeYouModelFromJson(json);
}

@freezed
class RequestedBy with _$RequestedBy {
  const factory RequestedBy({
    @JsonKey(name: '_id') String? id,

    SocialAccounts? socialAccounts,

    String? profilePhoto,
    String? email,
    String? role,
    String? status,
    String? loginType,
    String? appUsageType,
    String? maritalStatus,

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

    bool? profileSetup,
    bool? profileCompleted,
    String? profileCompletionStep,

    List<String>? preferredDatingIntentions,
    List<String>? preferredNationality,
    List<String>? preferredReligion,

    bool? isDelete,
    bool? suspended,

    int? bowlBalance,
    int? permanentChatIncrements,
    List<String>? rejectedUsers,
    int? receivedLikesCount,

    bool? profileBoostActive,
    DateTime? profileBoostExpiresAt,

    bool? crushBowlActive,
    DateTime? crushBowlExpiresAt,

    int? activeConversations,
    int? subscriptionChatIncrements,

    DateTime? createdAt,
    DateTime? updatedAt,
    @JsonKey(name: '__v') int? v,

    int? age,
    String? beforeAnything,
    String? bio,
    String? clubbing,
    DateTime? dateOfBirth,
    String? drinking,
    String? favoriteQuotes,
    String? firstName,
    String? lastName,
    String? fullName,
    String? hobbies,
    String? lifestyleInterests,
    String? location,
    int? minAge,
    int? maxAge,
    String? nickname,
    String? occupation,
    String? preferredGender,
    String? religion,
    String? smoking,
    String? userName,
    String? userStatus,
    DateTime? verificationDate,
  }) = _RequestedBy;

  factory RequestedBy.fromJson(Map<String, dynamic> json) =>
      _$RequestedByFromJson(json);
}

@freezed
class SocialAccounts with _$SocialAccounts {
  const factory SocialAccounts({
    String? googleId,
    String? appleId,
    String? facebookId,
  }) = _SocialAccounts;

  factory SocialAccounts.fromJson(Map<String, dynamic> json) =>
      _$SocialAccountsFromJson(json);
}
