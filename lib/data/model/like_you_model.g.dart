// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_you_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LikeYouModelImpl _$$LikeYouModelImplFromJson(Map<String, dynamic> json) =>
    _$LikeYouModelImpl(
      id: json['_id'] as String?,
      bookingId: json['bookingId'] as String?,
      requestedBy: json['requestedBy'] == null
          ? null
          : RequestedBy.fromJson(json['requestedBy'] as Map<String, dynamic>),
      status: json['status'] as String?,
      message: json['message'] as String?,
      respondedAt: json['respondedAt'] == null
          ? null
          : DateTime.parse(json['respondedAt'] as String),
      isDeleted: json['isDeleted'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LikeYouModelImplToJson(_$LikeYouModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'bookingId': instance.bookingId,
      'requestedBy': instance.requestedBy,
      'status': instance.status,
      'message': instance.message,
      'respondedAt': instance.respondedAt?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };

_$RequestedByImpl _$$RequestedByImplFromJson(
  Map<String, dynamic> json,
) => _$RequestedByImpl(
  id: json['_id'] as String?,
  socialAccounts: json['socialAccounts'] == null
      ? null
      : SocialAccounts.fromJson(json['socialAccounts'] as Map<String, dynamic>),
  profilePhoto: json['profilePhoto'] as String?,
  email: json['email'] as String?,
  role: json['role'] as String?,
  status: json['status'] as String?,
  loginType: json['loginType'] as String?,
  appUsageType: json['appUsageType'] as String?,
  maritalStatus: json['maritalStatus'] as String?,
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
  profileSetup: json['profileSetup'] as bool?,
  profileCompleted: json['profileCompleted'] as bool?,
  profileCompletionStep: json['profileCompletionStep'] as String?,
  preferredDatingIntentions:
      (json['preferredDatingIntentions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  preferredNationality: (json['preferredNationality'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  preferredReligion: (json['preferredReligion'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  isDelete: json['isDelete'] as bool?,
  suspended: json['suspended'] as bool?,
  bowlBalance: (json['bowlBalance'] as num?)?.toInt(),
  permanentChatIncrements: (json['permanentChatIncrements'] as num?)?.toInt(),
  rejectedUsers: (json['rejectedUsers'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  receivedLikesCount: (json['receivedLikesCount'] as num?)?.toInt(),
  profileBoostActive: json['profileBoostActive'] as bool?,
  profileBoostExpiresAt: json['profileBoostExpiresAt'] == null
      ? null
      : DateTime.parse(json['profileBoostExpiresAt'] as String),
  crushBowlActive: json['crushBowlActive'] as bool?,
  crushBowlExpiresAt: json['crushBowlExpiresAt'] == null
      ? null
      : DateTime.parse(json['crushBowlExpiresAt'] as String),
  activeConversations: (json['activeConversations'] as num?)?.toInt(),
  subscriptionChatIncrements: (json['subscriptionChatIncrements'] as num?)
      ?.toInt(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  v: (json['__v'] as num?)?.toInt(),
  age: (json['age'] as num?)?.toInt(),
  beforeAnything: json['beforeAnything'] as String?,
  bio: json['bio'] as String?,
  clubbing: json['clubbing'] as String?,
  dateOfBirth: json['dateOfBirth'] == null
      ? null
      : DateTime.parse(json['dateOfBirth'] as String),
  drinking: json['drinking'] as String?,
  favoriteQuotes: json['favoriteQuotes'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  fullName: json['fullName'] as String?,
  hobbies: json['hobbies'] as String?,
  lifestyleInterests: json['lifestyleInterests'] as String?,
  location: json['location'] as String?,
  minAge: (json['minAge'] as num?)?.toInt(),
  maxAge: (json['maxAge'] as num?)?.toInt(),
  nickname: json['nickname'] as String?,
  occupation: json['occupation'] as String?,
  preferredGender: json['preferredGender'] as String?,
  religion: json['religion'] as String?,
  smoking: json['smoking'] as String?,
  userName: json['userName'] as String?,
  userStatus: json['userStatus'] as String?,
  verificationDate: json['verificationDate'] == null
      ? null
      : DateTime.parse(json['verificationDate'] as String),
);

Map<String, dynamic> _$$RequestedByImplToJson(
  _$RequestedByImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'socialAccounts': instance.socialAccounts,
  'profilePhoto': instance.profilePhoto,
  'email': instance.email,
  'role': instance.role,
  'status': instance.status,
  'loginType': instance.loginType,
  'appUsageType': instance.appUsageType,
  'maritalStatus': instance.maritalStatus,
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
  'profileSetup': instance.profileSetup,
  'profileCompleted': instance.profileCompleted,
  'profileCompletionStep': instance.profileCompletionStep,
  'preferredDatingIntentions': instance.preferredDatingIntentions,
  'preferredNationality': instance.preferredNationality,
  'preferredReligion': instance.preferredReligion,
  'isDelete': instance.isDelete,
  'suspended': instance.suspended,
  'bowlBalance': instance.bowlBalance,
  'permanentChatIncrements': instance.permanentChatIncrements,
  'rejectedUsers': instance.rejectedUsers,
  'receivedLikesCount': instance.receivedLikesCount,
  'profileBoostActive': instance.profileBoostActive,
  'profileBoostExpiresAt': instance.profileBoostExpiresAt?.toIso8601String(),
  'crushBowlActive': instance.crushBowlActive,
  'crushBowlExpiresAt': instance.crushBowlExpiresAt?.toIso8601String(),
  'activeConversations': instance.activeConversations,
  'subscriptionChatIncrements': instance.subscriptionChatIncrements,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  '__v': instance.v,
  'age': instance.age,
  'beforeAnything': instance.beforeAnything,
  'bio': instance.bio,
  'clubbing': instance.clubbing,
  'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
  'drinking': instance.drinking,
  'favoriteQuotes': instance.favoriteQuotes,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'fullName': instance.fullName,
  'hobbies': instance.hobbies,
  'lifestyleInterests': instance.lifestyleInterests,
  'location': instance.location,
  'minAge': instance.minAge,
  'maxAge': instance.maxAge,
  'nickname': instance.nickname,
  'occupation': instance.occupation,
  'preferredGender': instance.preferredGender,
  'religion': instance.religion,
  'smoking': instance.smoking,
  'userName': instance.userName,
  'userStatus': instance.userStatus,
  'verificationDate': instance.verificationDate?.toIso8601String(),
};

_$SocialAccountsImpl _$$SocialAccountsImplFromJson(Map<String, dynamic> json) =>
    _$SocialAccountsImpl(
      googleId: json['googleId'] as String?,
      appleId: json['appleId'] as String?,
      facebookId: json['facebookId'] as String?,
    );

Map<String, dynamic> _$$SocialAccountsImplToJson(
  _$SocialAccountsImpl instance,
) => <String, dynamic>{
  'googleId': instance.googleId,
  'appleId': instance.appleId,
  'facebookId': instance.facebookId,
};
