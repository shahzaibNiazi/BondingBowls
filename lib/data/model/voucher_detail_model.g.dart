// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoucherDetailModelImpl _$$VoucherDetailModelImplFromJson(
  Map<String, dynamic> json,
) => _$VoucherDetailModelImpl(
  id: json['_id'] as String?,
  voucherCode: json['voucherCode'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  discountType: json['discountType'] as String?,
  discountValue: json['discountValue'] as num?,
  voucherType: json['voucherType'] as String?,
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  expiryDate: json['expiryDate'] == null
      ? null
      : DateTime.parse(json['expiryDate'] as String),
  status: json['status'] as String?,
  badge: json['badge'] as String?,
  terms: json['terms'] as String?,
  maxRedemptionsPerUser: (json['maxRedemptionsPerUser'] as num?)?.toInt(),
  totalUsageLimit: (json['totalUsageLimit'] as num?)?.toInt(),
  currentUsageCount: (json['currentUsageCount'] as num?)?.toInt(),
  minPurchaseAmount: json['minPurchaseAmount'] as num?,
  maxDiscountAmount: json['maxDiscountAmount'] as num?,
  icon: json['icon'] as String?,
  brandLogo: json['brandLogo'] as String?,
  displayOrder: (json['displayOrder'] as num?)?.toInt(),
  isStaticAd: json['isStaticAd'] as bool?,
  isDeleted: json['isDeleted'] as bool?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  v: (json['v'] as num?)?.toInt(),
  isRedeemed: json['isRedeemed'] as bool?,
  usedCount: (json['usedCount'] as num?)?.toInt(),
  conditions: json['conditions'] == null
      ? null
      : Conditions.fromJson(json['conditions'] as Map<String, dynamic>),
  outletInfo: json['outletInfo'] == null
      ? null
      : OutletInfo.fromJson(json['outletInfo'] as Map<String, dynamic>),
  images: json['images'] == null
      ? null
      : Images.fromJson(json['images'] as Map<String, dynamic>),
  promotionalDetails: json['promotionalDetails'] == null
      ? null
      : PromotionalDetails.fromJson(
          json['promotionalDetails'] as Map<String, dynamic>,
        ),
  displayInfo: json['displayInfo'] == null
      ? null
      : DisplayInfo.fromJson(json['displayInfo'] as Map<String, dynamic>),
  detailedTerms: (json['detailedTerms'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$VoucherDetailModelImplToJson(
  _$VoucherDetailModelImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'voucherCode': instance.voucherCode,
  'title': instance.title,
  'description': instance.description,
  'discountType': instance.discountType,
  'discountValue': instance.discountValue,
  'voucherType': instance.voucherType,
  'startDate': instance.startDate?.toIso8601String(),
  'expiryDate': instance.expiryDate?.toIso8601String(),
  'status': instance.status,
  'badge': instance.badge,
  'terms': instance.terms,
  'maxRedemptionsPerUser': instance.maxRedemptionsPerUser,
  'totalUsageLimit': instance.totalUsageLimit,
  'currentUsageCount': instance.currentUsageCount,
  'minPurchaseAmount': instance.minPurchaseAmount,
  'maxDiscountAmount': instance.maxDiscountAmount,
  'icon': instance.icon,
  'brandLogo': instance.brandLogo,
  'displayOrder': instance.displayOrder,
  'isStaticAd': instance.isStaticAd,
  'isDeleted': instance.isDeleted,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'v': instance.v,
  'isRedeemed': instance.isRedeemed,
  'usedCount': instance.usedCount,
  'conditions': instance.conditions,
  'outletInfo': instance.outletInfo,
  'images': instance.images,
  'promotionalDetails': instance.promotionalDetails,
  'displayInfo': instance.displayInfo,
  'detailedTerms': instance.detailedTerms,
};

_$ConditionsImpl _$$ConditionsImplFromJson(Map<String, dynamic> json) =>
    _$ConditionsImpl(
      timeRestrictions: json['timeRestrictions'] == null
          ? null
          : TimeRestrictions.fromJson(
              json['timeRestrictions'] as Map<String, dynamic>,
            ),
      applicableItems: json['applicableItems'] as String?,
      excludedOutlets: (json['excludedOutlets'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      userLimitPerOutlet: (json['userLimitPerOutlet'] as num?)?.toInt(),
      serviceTypes: (json['serviceTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      additionalRestrictions: (json['additionalRestrictions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ConditionsImplToJson(_$ConditionsImpl instance) =>
    <String, dynamic>{
      'timeRestrictions': instance.timeRestrictions,
      'applicableItems': instance.applicableItems,
      'excludedOutlets': instance.excludedOutlets,
      'userLimitPerOutlet': instance.userLimitPerOutlet,
      'serviceTypes': instance.serviceTypes,
      'additionalRestrictions': instance.additionalRestrictions,
    };

_$TimeRestrictionsImpl _$$TimeRestrictionsImplFromJson(
  Map<String, dynamic> json,
) => _$TimeRestrictionsImpl(
  startTime: json['startTime'] as String?,
  endTime: json['endTime'] as String?,
  days: (json['days'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$$TimeRestrictionsImplToJson(
  _$TimeRestrictionsImpl instance,
) => <String, dynamic>{
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'days': instance.days,
};

_$OutletInfoImpl _$$OutletInfoImplFromJson(Map<String, dynamic> json) =>
    _$OutletInfoImpl(
      coordinates: json['coordinates'] == null
          ? null
          : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      name: json['name'] as String?,
      address: json['address'] as String?,
      outletId: json['outletId'] as String?,
    );

Map<String, dynamic> _$$OutletInfoImplToJson(_$OutletInfoImpl instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
      'name': instance.name,
      'address': instance.address,
      'outletId': instance.outletId,
    };

_$CoordinatesImpl _$$CoordinatesImplFromJson(Map<String, dynamic> json) =>
    _$CoordinatesImpl(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CoordinatesImplToJson(_$CoordinatesImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$ImagesImpl _$$ImagesImplFromJson(Map<String, dynamic> json) => _$ImagesImpl(
  mainImage: json['mainImage'] as String?,
  productImages: (json['productImages'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  backgroundImage: json['backgroundImage'] as String?,
);

Map<String, dynamic> _$$ImagesImplToJson(_$ImagesImpl instance) =>
    <String, dynamic>{
      'mainImage': instance.mainImage,
      'productImages': instance.productImages,
      'backgroundImage': instance.backgroundImage,
    };

_$PromotionalDetailsImpl _$$PromotionalDetailsImplFromJson(
  Map<String, dynamic> json,
) => _$PromotionalDetailsImpl(
  mainOffer: json['mainOffer'] as String?,
  subtitle: json['subtitle'] as String?,
  highlightText: json['highlightText'] as String?,
  callToAction: json['callToAction'] as String?,
);

Map<String, dynamic> _$$PromotionalDetailsImplToJson(
  _$PromotionalDetailsImpl instance,
) => <String, dynamic>{
  'mainOffer': instance.mainOffer,
  'subtitle': instance.subtitle,
  'highlightText': instance.highlightText,
  'callToAction': instance.callToAction,
};

_$DisplayInfoImpl _$$DisplayInfoImplFromJson(Map<String, dynamic> json) =>
    _$DisplayInfoImpl(
      mainOffer: json['mainOffer'] as String?,
      subtitle: json['subtitle'] as String?,
      highlightText: json['highlightText'] as String?,
      callToAction: json['callToAction'] as String?,
      conditionsList: (json['conditionsList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      termsList: (json['termsList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      timeInfo: json['timeInfo'] as String?,
      outletDetails: json['outletDetails'] == null
          ? null
          : OutletInfo.fromJson(json['outletDetails'] as Map<String, dynamic>),
      images: json['images'] == null
          ? null
          : Images.fromJson(json['images'] as Map<String, dynamic>),
      availabilityInfo: json['availabilityInfo'] == null
          ? null
          : AvailabilityInfo.fromJson(
              json['availabilityInfo'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$DisplayInfoImplToJson(_$DisplayInfoImpl instance) =>
    <String, dynamic>{
      'mainOffer': instance.mainOffer,
      'subtitle': instance.subtitle,
      'highlightText': instance.highlightText,
      'callToAction': instance.callToAction,
      'conditionsList': instance.conditionsList,
      'termsList': instance.termsList,
      'timeInfo': instance.timeInfo,
      'outletDetails': instance.outletDetails,
      'images': instance.images,
      'availabilityInfo': instance.availabilityInfo,
    };

_$AvailabilityInfoImpl _$$AvailabilityInfoImplFromJson(
  Map<String, dynamic> json,
) => _$AvailabilityInfoImpl(
  isAvailable: json['isAvailable'] as bool?,
  remainingUses: (json['remainingUses'] as num?)?.toInt(),
  expiryDate: json['expiryDate'] == null
      ? null
      : DateTime.parse(json['expiryDate'] as String),
  isExpired: json['isExpired'] as bool?,
);

Map<String, dynamic> _$$AvailabilityInfoImplToJson(
  _$AvailabilityInfoImpl instance,
) => <String, dynamic>{
  'isAvailable': instance.isAvailable,
  'remainingUses': instance.remainingUses,
  'expiryDate': instance.expiryDate?.toIso8601String(),
  'isExpired': instance.isExpired,
};
