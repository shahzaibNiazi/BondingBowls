// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoucherModelImpl _$$VoucherModelImplFromJson(Map<String, dynamic> json) =>
    _$VoucherModelImpl(
      id: json['_id'] as String?,
      voucherCode: json['voucherCode'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      discountType: json['discountType'] as String?,
      discountValue: json['discountValue'] as num?,
      voucherType: json['voucherType'] as String?,
      startDate: json['startDate'] as String?,
      expiryDate: json['expiryDate'] as String?,
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
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: (json['v'] as num?)?.toInt(),
      isRedeemed: json['isRedeemed'] as bool?,
      usedCount: (json['usedCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$VoucherModelImplToJson(_$VoucherModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'voucherCode': instance.voucherCode,
      'title': instance.title,
      'description': instance.description,
      'discountType': instance.discountType,
      'discountValue': instance.discountValue,
      'voucherType': instance.voucherType,
      'startDate': instance.startDate,
      'expiryDate': instance.expiryDate,
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
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
      'isRedeemed': instance.isRedeemed,
      'usedCount': instance.usedCount,
    };
