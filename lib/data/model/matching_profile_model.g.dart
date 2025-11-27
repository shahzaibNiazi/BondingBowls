// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matching_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchingProfileModelImpl _$$MatchingProfileModelImplFromJson(
  Map<String, dynamic> json,
) => _$MatchingProfileModelImpl(
  id: json['_id'] as String?,
  fullName: json['fullName'] as String?,
  profilePhoto: json['profilePhoto'] as String?,
  email: json['email'] as String?,
  role: json['role'] as String?,
  status: json['status'] as String?,
  loginType: json['loginType'] as String?,
  appUsageType: json['appUsageType'] as String?,
  aiAvatar: json['aiAvatar'] as String?,
  aiAvatarStyle: json['aiAvatarStyle'] as String?,
  profileImages: (json['profileImages'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  datingIntentions: json['datingIntentions'] as String?,
  pets: json['pets'] as bool?,
  voicePrompt: json['voicePrompt'] as String?,
  video: json['video'] as String?,
  greenFlags: (json['greenFlags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  redFlags: (json['redFlags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  verificationStatus: json['verificationStatus'] as String?,
  verificationMethod: json['verificationMethod'] as String?,
  verificationDocuments: (json['verificationDocuments'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  profileCompleted: json['profileCompleted'] as bool?,
  profileCompletionStep: json['profileCompletionStep'] as String?,
  isDelete: json['isDelete'] as bool?,
  suspended: json['suspended'] as bool?,
  bowlBalance: (json['bowlBalance'] as num?)?.toInt(),
  permanentChatIncrements: (json['permanentChatIncrements'] as num?)?.toInt(),
  rejectedUsers: (json['rejectedUsers'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  receivedLikesCount: (json['receivedLikesCount'] as num?)?.toInt(),
  profileBoostActive: json['profileBoostActive'] as bool?,
  profileBoostExpiresAt: json['profileBoostExpiresAt'] as String?,
  crushBowlActive: json['crushBowlActive'] as bool?,
  crushBowlExpiresAt: json['crushBowlExpiresAt'] as String?,
  activeConversations: (json['activeConversations'] as num?)?.toInt(),
  subscriptionChatIncrements: (json['subscriptionChatIncrements'] as num?)
      ?.toInt(),
  fcmToken: json['fcmToken'] as String?,
  fcmTokens: (json['fcmTokens'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  v: (json['__v'] as num?)?.toInt(),
  bio: json['bio'] as String?,
  clubbing: json['clubbing'] as String?,
  drinking: json['drinking'] as String?,
  hobbies: json['hobbies'] as String?,
  lifestyleInterests: json['lifestyleInterests'] as String?,
  location: json['location'] as String?,
  nickname: json['nickname'] as String?,
  occupation: json['occupation'] as String?,
  religion: json['religion'] as String?,
  smoking: json['smoking'] as String?,
  userStatus: json['userStatus'] as String?,
  isRandomProfile: json['isRandomProfile'] as bool?,
);

Map<String, dynamic> _$$MatchingProfileModelImplToJson(
  _$MatchingProfileModelImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'fullName': instance.fullName,
  'profilePhoto': instance.profilePhoto,
  'email': instance.email,
  'role': instance.role,
  'status': instance.status,
  'loginType': instance.loginType,
  'appUsageType': instance.appUsageType,
  'aiAvatar': instance.aiAvatar,
  'aiAvatarStyle': instance.aiAvatarStyle,
  'profileImages': instance.profileImages,
  'datingIntentions': instance.datingIntentions,
  'pets': instance.pets,
  'voicePrompt': instance.voicePrompt,
  'video': instance.video,
  'greenFlags': instance.greenFlags,
  'redFlags': instance.redFlags,
  'verificationStatus': instance.verificationStatus,
  'verificationMethod': instance.verificationMethod,
  'verificationDocuments': instance.verificationDocuments,
  'profileCompleted': instance.profileCompleted,
  'profileCompletionStep': instance.profileCompletionStep,
  'isDelete': instance.isDelete,
  'suspended': instance.suspended,
  'bowlBalance': instance.bowlBalance,
  'permanentChatIncrements': instance.permanentChatIncrements,
  'rejectedUsers': instance.rejectedUsers,
  'receivedLikesCount': instance.receivedLikesCount,
  'profileBoostActive': instance.profileBoostActive,
  'profileBoostExpiresAt': instance.profileBoostExpiresAt,
  'crushBowlActive': instance.crushBowlActive,
  'crushBowlExpiresAt': instance.crushBowlExpiresAt,
  'activeConversations': instance.activeConversations,
  'subscriptionChatIncrements': instance.subscriptionChatIncrements,
  'fcmToken': instance.fcmToken,
  'fcmTokens': instance.fcmTokens,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  '__v': instance.v,
  'bio': instance.bio,
  'clubbing': instance.clubbing,
  'drinking': instance.drinking,
  'hobbies': instance.hobbies,
  'lifestyleInterests': instance.lifestyleInterests,
  'location': instance.location,
  'nickname': instance.nickname,
  'occupation': instance.occupation,
  'religion': instance.religion,
  'smoking': instance.smoking,
  'userStatus': instance.userStatus,
  'isRandomProfile': instance.isRandomProfile,
};
