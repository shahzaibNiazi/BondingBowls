import 'package:freezed_annotation/freezed_annotation.dart';

part 'voucher_model.freezed.dart';
part 'voucher_model.g.dart';

@freezed
class VoucherModel with _$VoucherModel {
  const factory VoucherModel({
    @JsonKey(name: '_id') String? id,
    String? voucherCode,
    String? title,
    String? description,
    String? discountType,
    num? discountValue,
    String? voucherType,
    String? startDate,
    String? expiryDate,
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
    String? createdAt,
    String? updatedAt,
    int? v,
    bool? isRedeemed,
    int? usedCount,
  }) = _VoucherModel;

  factory VoucherModel.fromJson(Map<String, dynamic> json) =>
      _$VoucherModelFromJson(json);
}
