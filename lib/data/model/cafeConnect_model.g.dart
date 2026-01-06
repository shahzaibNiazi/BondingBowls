// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafeConnect_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CafeModelImpl _$$CafeModelImplFromJson(Map<String, dynamic> json) =>
    _$CafeModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      category: json['category'] as String?,
      averagePrice: (json['averagePrice'] as num?)?.toInt(),
      discountCode: json['discountCode'] as String?,
      discountPercentage: (json['discountPercentage'] as num?)?.toInt(),
      discountsGivenOut: (json['discountsGivenOut'] as num?)?.toInt(),
      allowedSuccessfulMatches: (json['allowedSuccessfulMatches'] as num?)
          ?.toInt(),
      allowDiscountConfiguration: json['allowDiscountConfiguration'] as bool?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      reviews: json['reviews'] == null
          ? null
          : Reviews.fromJson(json['reviews'] as Map<String, dynamic>),
      openingHours: (json['openingHours'] as List<dynamic>?)
          ?.map((e) => OperatingHour.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      viewCount: (json['viewCount'] as num?)?.toInt(),
      isDeleted: json['isDeleted'] as bool?,
      dateAdded: json['dateAdded'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      cafeId: json['cafeId'] as String?,
      v: (json['v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CafeModelImplToJson(_$CafeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'category': instance.category,
      'averagePrice': instance.averagePrice,
      'discountCode': instance.discountCode,
      'discountPercentage': instance.discountPercentage,
      'discountsGivenOut': instance.discountsGivenOut,
      'allowedSuccessfulMatches': instance.allowedSuccessfulMatches,
      'allowDiscountConfiguration': instance.allowDiscountConfiguration,
      'image': instance.image,
      'description': instance.description,
      'location': instance.location,
      'reviews': instance.reviews,
      'openingHours': instance.openingHours,
      'status': instance.status,
      'viewCount': instance.viewCount,
      'isDeleted': instance.isDeleted,
      'dateAdded': instance.dateAdded,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'cafeId': instance.cafeId,
      'v': instance.v,
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      exactLocation: json['exactLocation'] as String?,
      region: json['region'] as String?,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'exactLocation': instance.exactLocation,
      'region': instance.region,
    };

_$ReviewsImpl _$$ReviewsImplFromJson(Map<String, dynamic> json) =>
    _$ReviewsImpl(
      rating: (json['rating'] as num?)?.toInt(),
      reviewCount: (json['reviewCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ReviewsImplToJson(_$ReviewsImpl instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
    };
