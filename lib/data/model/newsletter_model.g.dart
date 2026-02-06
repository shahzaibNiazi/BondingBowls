// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsletter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AveragePriceImpl _$$AveragePriceImplFromJson(Map<String, dynamic> json) =>
    _$AveragePriceImpl(
      min: (json['min'] as num?)?.toInt(),
      max: (json['max'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AveragePriceImplToJson(_$AveragePriceImpl instance) =>
    <String, dynamic>{'min': instance.min, 'max': instance.max};

_$CafeReviewImpl _$$CafeReviewImplFromJson(Map<String, dynamic> json) =>
    _$CafeReviewImpl(
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: (json['reviewCount'] as num?)?.toInt(),
      reviewText: json['reviewText'] as String?,
    );

Map<String, dynamic> _$$CafeReviewImplToJson(_$CafeReviewImpl instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'reviewText': instance.reviewText,
    };

_$CafeDetailsImpl _$$CafeDetailsImplFromJson(Map<String, dynamic> json) =>
    _$CafeDetailsImpl(
      cafeReviews: json['cafeReviews'] == null
          ? null
          : CafeReview.fromJson(json['cafeReviews'] as Map<String, dynamic>),
      cafeName: json['cafeName'] as String?,
      cafeDescription: json['cafeDescription'] as String?,
    );

Map<String, dynamic> _$$CafeDetailsImplToJson(_$CafeDetailsImpl instance) =>
    <String, dynamic>{
      'cafeReviews': instance.cafeReviews,
      'cafeName': instance.cafeName,
      'cafeDescription': instance.cafeDescription,
    };

_$OperatingHourImpl _$$OperatingHourImplFromJson(Map<String, dynamic> json) =>
    _$OperatingHourImpl(
      day: json['day'] as String?,
      opening: json['opening'] as String?,
      closing: json['closing'] as String?,
      isClosed: json['isClosed'] as bool? ?? false,
    );

Map<String, dynamic> _$$OperatingHourImplToJson(_$OperatingHourImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'opening': instance.opening,
      'closing': instance.closing,
      'isClosed': instance.isClosed,
    };

_$MediaAdditionImpl _$$MediaAdditionImplFromJson(Map<String, dynamic> json) =>
    _$MediaAdditionImpl(
      type: json['type'] as String?,
      content: json['content'] as String?,
      order: (json['order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MediaAdditionImplToJson(_$MediaAdditionImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'content': instance.content,
      'order': instance.order,
    };

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
  id: json['_id'] as String?,
  title: json['title'] as String?,
  secondaryText1: json['secondaryText1'] as String?,
  locationLink: json['locationLink'] as String?,
  displayImage: json['displayImage'] as String?,
  category: json['category'] as String?,
  averagePrice: json['averagePrice'] == null
      ? null
      : AveragePrice.fromJson(json['averagePrice'] as Map<String, dynamic>),
  voucherDetails: json['voucherDetails'] == null
      ? null
      : VoucherDetailModel.fromJson(
          json['voucherDetails'] as Map<String, dynamic>,
        ),
  cafeDetails: json['cafeDetails'] == null
      ? null
      : CafeDetails.fromJson(json['cafeDetails'] as Map<String, dynamic>),
  status: json['status'] as String? ?? 'Enabled',
  disableViewCount: json['disableViewCount'] as bool? ?? false,
  viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
  location: json['location'] as String?,
  operatingHours:
      (json['operatingHours'] as List<dynamic>?)
          ?.map((e) => OperatingHour.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  isDeleted: json['isDeleted'] as bool? ?? false,
  mediaAdditions:
      (json['mediaAdditions'] as List<dynamic>?)
          ?.map((e) => MediaAddition.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  v: (json['__v'] as num?)?.toInt() ?? 0,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'secondaryText1': instance.secondaryText1,
      'locationLink': instance.locationLink,
      'displayImage': instance.displayImage,
      'category': instance.category,
      'averagePrice': instance.averagePrice,
      'voucherDetails': instance.voucherDetails,
      'cafeDetails': instance.cafeDetails,
      'status': instance.status,
      'disableViewCount': instance.disableViewCount,
      'viewCount': instance.viewCount,
      'location': instance.location,
      'operatingHours': instance.operatingHours,
      'tags': instance.tags,
      'isDeleted': instance.isDeleted,
      'mediaAdditions': instance.mediaAdditions,
      '__v': instance.v,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$CategoryDataImpl _$$CategoryDataImplFromJson(Map<String, dynamic> json) =>
    _$CategoryDataImpl(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalCount: (json['totalCount'] as num?)?.toInt(),
      hasMore: json['hasMore'] as bool?,
    );

Map<String, dynamic> _$$CategoryDataImplToJson(_$CategoryDataImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'totalCount': instance.totalCount,
      'hasMore': instance.hasMore,
    };

_$CategoriesImpl _$$CategoriesImplFromJson(Map<String, dynamic> json) =>
    _$CategoriesImpl(
      food: json['Food'] == null
          ? null
          : CategoryData.fromJson(json['Food'] as Map<String, dynamic>),
      beverages: json['Beverages'] == null
          ? null
          : CategoryData.fromJson(json['Beverages'] as Map<String, dynamic>),
      events: json['Events'] == null
          ? null
          : CategoryData.fromJson(json['Events'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CategoriesImplToJson(_$CategoriesImpl instance) =>
    <String, dynamic>{
      'Food': instance.food,
      'Beverages': instance.beverages,
      'Events': instance.events,
    };

_$ApiResponseImpl _$$ApiResponseImplFromJson(Map<String, dynamic> json) =>
    _$ApiResponseImpl(
      categories: json['categories'] == null
          ? null
          : Categories.fromJson(json['categories'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ApiResponseImplToJson(_$ApiResponseImpl instance) =>
    <String, dynamic>{'categories': instance.categories};
