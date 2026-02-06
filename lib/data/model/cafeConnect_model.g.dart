// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafeConnect_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CafeModelImpl _$$CafeModelImplFromJson(Map<String, dynamic> json) =>
    _$CafeModelImpl(
      id: json['_id'] as String?,
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
      locationLink: json['locationLink'] as String?,
      viewCount: (json['viewCount'] as num?)?.toInt(),
      isDeleted: json['isDeleted'] as bool?,
      dateAdded: json['dateAdded'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      cafeId: json['cafeId'] as String?,
      v: (json['__v'] as num?)?.toInt(),
      popularityScore: (json['popularityScore'] as num?)?.toInt(),
      activeBookings: (json['activeBookings'] as num?)?.toInt(),
      bookingStats: json['bookingStats'] == null
          ? null
          : BookingStats.fromJson(json['bookingStats'] as Map<String, dynamic>),
      userBooking: json['userBooking'] == null
          ? null
          : UserBooking.fromJson(json['userBooking'] as Map<String, dynamic>),
      likedUsersAtCafe: json['likedUsersAtCafe'] as List<dynamic>?,
      hasBooking: json['hasBooking'] as bool?,
      isAlreadyBooked: json['isAlreadyBooked'] as bool?,
      hasLikedUsersAtCafe: json['hasLikedUsersAtCafe'] as bool?,
    );

Map<String, dynamic> _$$CafeModelImplToJson(_$CafeModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
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
      'locationLink': instance.locationLink,
      'viewCount': instance.viewCount,
      'isDeleted': instance.isDeleted,
      'dateAdded': instance.dateAdded,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'cafeId': instance.cafeId,
      '__v': instance.v,
      'popularityScore': instance.popularityScore,
      'activeBookings': instance.activeBookings,
      'bookingStats': instance.bookingStats,
      'userBooking': instance.userBooking,
      'likedUsersAtCafe': instance.likedUsersAtCafe,
      'hasBooking': instance.hasBooking,
      'isAlreadyBooked': instance.isAlreadyBooked,
      'hasLikedUsersAtCafe': instance.hasLikedUsersAtCafe,
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
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: (json['reviewCount'] as num?)?.toInt(),
      reviewText: json['reviewText'] as String?,
    );

Map<String, dynamic> _$$ReviewsImplToJson(_$ReviewsImpl instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'reviewText': instance.reviewText,
    };

_$BookingStatsImpl _$$BookingStatsImplFromJson(Map<String, dynamic> json) =>
    _$BookingStatsImpl(
      maleBookings: (json['maleBookings'] as num?)?.toInt(),
      femaleBookings: (json['femaleBookings'] as num?)?.toInt(),
      totalBookings: (json['totalBookings'] as num?)?.toInt(),
      mutualLikes: (json['mutualLikes'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BookingStatsImplToJson(_$BookingStatsImpl instance) =>
    <String, dynamic>{
      'maleBookings': instance.maleBookings,
      'femaleBookings': instance.femaleBookings,
      'totalBookings': instance.totalBookings,
      'mutualLikes': instance.mutualLikes,
    };

_$UserBookingImpl _$$UserBookingImplFromJson(Map<String, dynamic> json) =>
    _$UserBookingImpl(
      id: json['_id'] as String?,
      lookingFor: (json['lookingFor'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      availableFor: (json['availableFor'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      bookingDate: json['bookingDate'] as String?,
      additionalNotes: json['additionalNotes'] as String?,
      status: json['status'] as String?,
      isExpired: json['isExpired'] as bool?,
    );

Map<String, dynamic> _$$UserBookingImplToJson(_$UserBookingImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'lookingFor': instance.lookingFor,
      'availableFor': instance.availableFor,
      'bookingDate': instance.bookingDate,
      'additionalNotes': instance.additionalNotes,
      'status': instance.status,
      'isExpired': instance.isExpired,
    };

_$OperatingHourImpl _$$OperatingHourImplFromJson(Map<String, dynamic> json) =>
    _$OperatingHourImpl(
      day: json['day'] as String?,
      openingTime: json['openingTime'] as String?,
      closingTime: json['closingTime'] as String?,
      isClosed: json['isClosed'] as bool? ?? false,
    );

Map<String, dynamic> _$$OperatingHourImplToJson(_$OperatingHourImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'openingTime': instance.openingTime,
      'closingTime': instance.closingTime,
      'isClosed': instance.isClosed,
    };
