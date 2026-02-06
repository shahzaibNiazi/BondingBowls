import 'package:freezed_annotation/freezed_annotation.dart';

part 'voucher_detail_model.freezed.dart';
part 'voucher_detail_model.g.dart';

@freezed
class VoucherDetailModel with _$VoucherDetailModel {
  const factory VoucherDetailModel({
    @JsonKey(name: '_id') String? id,
    String? voucherCode,
    String? title,
    String? description,
    String? discountType,
    num? discountValue,
    String? voucherType,
    DateTime? startDate,
    DateTime? expiryDate,
    String? status,
    String? badge,
    String? terms,
    int? maxRedemptionsPerUser,
    int? totalUsageLimit,
    int? currentUsageCount,
    num? minPurchaseAmount,
    num? maxDiscountAmount,
    String? icon,
    String? brandLogo,
    int? displayOrder,
    bool? isStaticAd,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    bool? isRedeemed,
    int? usedCount,
    Conditions? conditions,
    OutletInfo? outletInfo,
    Images? images,
    PromotionalDetails? promotionalDetails,
    DisplayInfo? displayInfo,
    List<String>? detailedTerms,
  }) = _VoucherDetailModel;

  factory VoucherDetailModel.fromJson(Map<String, dynamic> json) =>
      _$VoucherDetailModelFromJson(json);
}

@freezed
class Conditions with _$Conditions {
  const factory Conditions({
    TimeRestrictions? timeRestrictions,
    String? applicableItems,
    List<String>? excludedOutlets,
    int? userLimitPerOutlet,
    List<String>? serviceTypes,
    List<String>? additionalRestrictions,
  }) = _Conditions;

  factory Conditions.fromJson(Map<String, dynamic> json) =>
      _$ConditionsFromJson(json);
}

@freezed
class TimeRestrictions with _$TimeRestrictions {
  const factory TimeRestrictions({
    String? startTime,
    String? endTime,
    List<String>? days,
  }) = _TimeRestrictions;

  factory TimeRestrictions.fromJson(Map<String, dynamic> json) =>
      _$TimeRestrictionsFromJson(json);
}

@freezed
class OutletInfo with _$OutletInfo {
  const factory OutletInfo({
    Coordinates? coordinates,
    String? name,
    String? address,
    String? outletId,
  }) = _OutletInfo;

  factory OutletInfo.fromJson(Map<String, dynamic> json) =>
      _$OutletInfoFromJson(json);
}

@freezed
class Coordinates with _$Coordinates {
  const factory Coordinates({double? latitude, double? longitude}) =
      _Coordinates;

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
}

@freezed
class Images with _$Images {
  const factory Images({
    String? mainImage,
    List<String>? productImages,
    String? backgroundImage,
  }) = _Images;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}

@freezed
class PromotionalDetails with _$PromotionalDetails {
  const factory PromotionalDetails({
    String? mainOffer,
    String? subtitle,
    String? highlightText,
    String? callToAction,
  }) = _PromotionalDetails;

  factory PromotionalDetails.fromJson(Map<String, dynamic> json) =>
      _$PromotionalDetailsFromJson(json);
}

@freezed
class DisplayInfo with _$DisplayInfo {
  const factory DisplayInfo({
    String? mainOffer,
    String? subtitle,
    String? highlightText,
    String? callToAction,
    List<String>? conditionsList,
    List<String>? termsList,
    String? timeInfo,
    OutletInfo? outletDetails,
    Images? images,
    AvailabilityInfo? availabilityInfo,
  }) = _DisplayInfo;

  factory DisplayInfo.fromJson(Map<String, dynamic> json) =>
      _$DisplayInfoFromJson(json);
}

@freezed
class AvailabilityInfo with _$AvailabilityInfo {
  const factory AvailabilityInfo({
    bool? isAvailable,
    int? remainingUses,
    DateTime? expiryDate,
    bool? isExpired,
  }) = _AvailabilityInfo;

  factory AvailabilityInfo.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityInfoFromJson(json);
}
