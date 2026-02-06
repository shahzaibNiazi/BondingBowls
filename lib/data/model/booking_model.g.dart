// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingModelImpl _$$BookingModelImplFromJson(Map<String, dynamic> json) =>
    _$BookingModelImpl(
      id: json['_id'] as String?,
      userId: json['userId'] == null
          ? null
          : UserModel.fromJson(json['userId'] as Map<String, dynamic>),
      cafeId: json['cafeId'] == null
          ? null
          : CafeData.fromJson(json['cafeId'] as Map<String, dynamic>),
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
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num?)?.toInt(),
      isExpired: json['isExpired'] as bool?,
      formattedBookingDate: json['formattedBookingDate'] == null
          ? null
          : FormattedBookingDate.fromJson(
              json['formattedBookingDate'] as Map<String, dynamic>,
            ),
      timeRemaining: (json['timeRemaining'] as num?)?.toInt(),
      isConfirmed: json['isConfirmed'] as bool?,
      isPending: json['isPending'] as bool?,
    );

Map<String, dynamic> _$$BookingModelImplToJson(_$BookingModelImpl instance) =>
    <String, dynamic>{
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
      'cancelledBy': instance.cancelledBy,
      'cancelledAt': instance.cancelledAt?.toIso8601String(),
      'confirmedAt': instance.confirmedAt?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'isExpired': instance.isExpired,
      'formattedBookingDate': instance.formattedBookingDate,
      'timeRemaining': instance.timeRemaining,
      'isConfirmed': instance.isConfirmed,
      'isPending': instance.isPending,
    };

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['_id'] as String?,
      fullName: json['fullName'] as String?,
      profilePhoto: json['profilePhoto'] as String?,
      nickname: json['nickname'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'profilePhoto': instance.profilePhoto,
      'nickname': instance.nickname,
    };

_$CafeDataImpl _$$CafeDataImplFromJson(Map<String, dynamic> json) =>
    _$CafeDataImpl(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      category: json['category'] as String?,
      averagePrice: (json['averagePrice'] as num?)?.toInt(),
      image: json['image'] as String?,
      cafeId: json['cafeId'] as String?,
      locationLink: json['locationLink'] as String?,
      locationlink: json['locationlink'] as String?,
      location: json['location'] == null
          ? null
          : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      reviews: json['reviews'] == null
          ? null
          : ReviewModel.fromJson(json['reviews'] as Map<String, dynamic>),
      openingHours: (json['openingHours'] as List<dynamic>?)
          ?.map((e) => OpeningHour.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookingDayHours: json['bookingDayHours'] == null
          ? null
          : BookingDayHours.fromJson(
              json['bookingDayHours'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$CafeDataImplToJson(_$CafeDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'averagePrice': instance.averagePrice,
      'image': instance.image,
      'cafeId': instance.cafeId,
      'locationLink': instance.locationLink,
      'locationlink': instance.locationlink,
      'location': instance.location,
      'reviews': instance.reviews,
      'openingHours': instance.openingHours,
      'bookingDayHours': instance.bookingDayHours,
    };

_$LocationModelImpl _$$LocationModelImplFromJson(Map<String, dynamic> json) =>
    _$LocationModelImpl(
      exactLocation: json['exactLocation'] as String?,
      region: json['region'] as String?,
    );

Map<String, dynamic> _$$LocationModelImplToJson(_$LocationModelImpl instance) =>
    <String, dynamic>{
      'exactLocation': instance.exactLocation,
      'region': instance.region,
    };

_$ReviewModelImpl _$$ReviewModelImplFromJson(Map<String, dynamic> json) =>
    _$ReviewModelImpl(
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: (json['reviewCount'] as num?)?.toInt(),
      reviewText: json['reviewText'] as String?,
    );

Map<String, dynamic> _$$ReviewModelImplToJson(_$ReviewModelImpl instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'reviewText': instance.reviewText,
    };

_$OpeningHourImpl _$$OpeningHourImplFromJson(Map<String, dynamic> json) =>
    _$OpeningHourImpl(
      day: json['day'] as String?,
      openingTime: json['openingTime'] as String?,
      closingTime: json['closingTime'] as String?,
      isClosed: json['isClosed'] as bool?,
    );

Map<String, dynamic> _$$OpeningHourImplToJson(_$OpeningHourImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'openingTime': instance.openingTime,
      'closingTime': instance.closingTime,
      'isClosed': instance.isClosed,
    };

_$BookingDayHoursImpl _$$BookingDayHoursImplFromJson(
  Map<String, dynamic> json,
) => _$BookingDayHoursImpl(
  openingTime: json['openingTime'] as String?,
  closingTime: json['closingTime'] as String?,
  isClosed: json['isClosed'] as bool?,
  formatted: json['formatted'] as String?,
);

Map<String, dynamic> _$$BookingDayHoursImplToJson(
  _$BookingDayHoursImpl instance,
) => <String, dynamic>{
  'openingTime': instance.openingTime,
  'closingTime': instance.closingTime,
  'isClosed': instance.isClosed,
  'formatted': instance.formatted,
};

_$FormattedBookingDateImpl _$$FormattedBookingDateImplFromJson(
  Map<String, dynamic> json,
) => _$FormattedBookingDateImpl(
  date: json['date'] as String?,
  dateShort: json['dateShort'] as String?,
  time: json['time'] as String?,
  dayName: json['dayName'] as String?,
  iso: json['iso'] as String?,
);

Map<String, dynamic> _$$FormattedBookingDateImplToJson(
  _$FormattedBookingDateImpl instance,
) => <String, dynamic>{
  'date': instance.date,
  'dateShort': instance.dateShort,
  'time': instance.time,
  'dayName': instance.dayName,
  'iso': instance.iso,
};
