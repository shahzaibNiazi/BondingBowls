// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AvailableModelImpl _$$AvailableModelImplFromJson(Map<String, dynamic> json) =>
    _$AvailableModelImpl(
      id: json['_id'] as String?,
      userId: json['userId'] == null
          ? null
          : UserRefModel.fromJson(json['userId'] as Map<String, dynamic>),
      cafeId: json['cafeId'] == null
          ? null
          : CafeDataModel.fromJson(json['cafeId'] as Map<String, dynamic>),
      lookingFor: (json['lookingFor'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      availableFor: (json['availableFor'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      bookingDate: json['bookingDate'] == null
          ? null
          : DateTime.parse(json['bookingDate'] as String),
      additionalNotes: json['additionalNotes'] as String?,
      status: json['status'] as String?,
      matchedUserId: json['matchedUserId'] as String?,
      matchedAt: json['matchedAt'] == null
          ? null
          : DateTime.parse(json['matchedAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      cancelledBy: json['cancelledBy'] as String?,
      cancelledAt: json['cancelledAt'] == null
          ? null
          : DateTime.parse(json['cancelledAt'] as String),
      confirmedAt: json['confirmedAt'] == null
          ? null
          : DateTime.parse(json['confirmedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      isDeleted: json['isDeleted'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num?)?.toInt(),
      isExpired: json['isExpired'] as bool?,
      hasJoinRequest: json['hasJoinRequest'] as bool?,
      joinRequestId: json['joinRequestId'] as String?,
      joinRequestStatus: json['joinRequestStatus'] as String?,
    );

Map<String, dynamic> _$$AvailableModelImplToJson(
  _$AvailableModelImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'userId': instance.userId,
  'cafeId': instance.cafeId,
  'lookingFor': instance.lookingFor,
  'availableFor': instance.availableFor,
  'bookingDate': instance.bookingDate?.toIso8601String(),
  'additionalNotes': instance.additionalNotes,
  'status': instance.status,
  'matchedUserId': instance.matchedUserId,
  'matchedAt': instance.matchedAt?.toIso8601String(),
  'expiresAt': instance.expiresAt?.toIso8601String(),
  'cancelledBy': instance.cancelledBy,
  'cancelledAt': instance.cancelledAt?.toIso8601String(),
  'confirmedAt': instance.confirmedAt?.toIso8601String(),
  'completedAt': instance.completedAt?.toIso8601String(),
  'isDeleted': instance.isDeleted,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  '__v': instance.v,
  'isExpired': instance.isExpired,
  'hasJoinRequest': instance.hasJoinRequest,
  'joinRequestId': instance.joinRequestId,
  'joinRequestStatus': instance.joinRequestStatus,
};

_$UserRefModelImpl _$$UserRefModelImplFromJson(Map<String, dynamic> json) =>
    _$UserRefModelImpl(
      id: json['_id'] as String?,
      profilePhoto: json['profilePhoto'] as String?,
      email: json['email'] as String?,
      datingIntentions: json['datingIntentions'] as String?,
      age: (json['age'] as num?)?.toInt(),
      dateOfBirth: json['dateOfBirth'] as String?,
      maritalStatus: json['maritalStatus'] as String?,
      bio: json['bio'] as String?,
      fullName: json['fullName'] as String?,
      location: json['location'] as String?,
      occupation: json['occupation'] as String?,
      preferredGender: json['preferredGender'] as String?,
    );

Map<String, dynamic> _$$UserRefModelImplToJson(_$UserRefModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'profilePhoto': instance.profilePhoto,
      'email': instance.email,
      'datingIntentions': instance.datingIntentions,
      'age': instance.age,
      'dateOfBirth': instance.dateOfBirth,
      'maritalStatus': instance.maritalStatus,
      'bio': instance.bio,
      'fullName': instance.fullName,
      'location': instance.location,
      'occupation': instance.occupation,
      'preferredGender': instance.preferredGender,
    };

_$CafeDataModelImpl _$$CafeDataModelImplFromJson(Map<String, dynamic> json) =>
    _$CafeDataModelImpl(
      id: json['_id'] as String?,
      location: json['location'] == null
          ? null
          : CafeLocationModel.fromJson(
              json['location'] as Map<String, dynamic>,
            ),
      reviews: json['reviews'] == null
          ? null
          : CafeReviewModel.fromJson(json['reviews'] as Map<String, dynamic>),
      name: json['name'] as String?,
      category: json['category'] as String?,
      averagePrice: json['averagePrice'] as num?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$CafeDataModelImplToJson(_$CafeDataModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'location': instance.location,
      'reviews': instance.reviews,
      'name': instance.name,
      'category': instance.category,
      'averagePrice': instance.averagePrice,
      'image': instance.image,
    };

_$CafeLocationModelImpl _$$CafeLocationModelImplFromJson(
  Map<String, dynamic> json,
) => _$CafeLocationModelImpl(
  exactLocation: json['exactLocation'] as String?,
  region: json['region'] as String?,
);

Map<String, dynamic> _$$CafeLocationModelImplToJson(
  _$CafeLocationModelImpl instance,
) => <String, dynamic>{
  'exactLocation': instance.exactLocation,
  'region': instance.region,
};

_$CafeReviewModelImpl _$$CafeReviewModelImplFromJson(
  Map<String, dynamic> json,
) => _$CafeReviewModelImpl(
  rating: json['rating'] as num?,
  reviewCount: (json['reviewCount'] as num?)?.toInt(),
  reviewText: json['reviewText'] as String?,
);

Map<String, dynamic> _$$CafeReviewModelImplToJson(
  _$CafeReviewModelImpl instance,
) => <String, dynamic>{
  'rating': instance.rating,
  'reviewCount': instance.reviewCount,
  'reviewText': instance.reviewText,
};
