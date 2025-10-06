// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['_id'] as String?,
      fullName: json['fullName'] as String?,
      profilePhoto: json['profilePhoto'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      role: json['role'] as String?,
      occupation: json['occupation'] as String?,
      status: json['status'] as String?,
      otp: json['otp'] as String?,
      otpCreatedAt: json['otpCreatedAt'] as String?,
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
      religion: json['religion'] as String?,
      smoking: json['smoking'] as String?,
      userStatus: json['userStatus'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'profilePhoto': instance.profilePhoto,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
      'occupation': instance.occupation,
      'status': instance.status,
      'otp': instance.otp,
      'otpCreatedAt': instance.otpCreatedAt,
      'loginType': instance.loginType,
      'appUsageType': instance.appUsageType,
      'aiAvatar': instance.aiAvatar,
      'aiAvatarStyle': instance.aiAvatarStyle,
      'profileImages': instance.profileImages,
      'datingIntentions': instance.datingIntentions,
      'pets': instance.pets,
      'voicePrompt': instance.voicePrompt,
      'greenFlags': instance.greenFlags,
      'redFlags': instance.redFlags,
      'verificationStatus': instance.verificationStatus,
      'verificationMethod': instance.verificationMethod,
      'verificationDocuments': instance.verificationDocuments,
      'profileCompleted': instance.profileCompleted,
      'profileCompletionStep': instance.profileCompletionStep,
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
      'religion': instance.religion,
      'smoking': instance.smoking,
      'userStatus': instance.userStatus,
    };
