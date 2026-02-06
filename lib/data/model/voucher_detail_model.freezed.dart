// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voucher_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VoucherDetailModel _$VoucherDetailModelFromJson(Map<String, dynamic> json) {
  return _VoucherDetailModel.fromJson(json);
}

/// @nodoc
mixin _$VoucherDetailModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get voucherCode => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get discountType => throw _privateConstructorUsedError;
  num? get discountValue => throw _privateConstructorUsedError;
  String? get voucherType => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get expiryDate => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get badge => throw _privateConstructorUsedError;
  String? get terms => throw _privateConstructorUsedError;
  int? get maxRedemptionsPerUser => throw _privateConstructorUsedError;
  int? get totalUsageLimit => throw _privateConstructorUsedError;
  int? get currentUsageCount => throw _privateConstructorUsedError;
  num? get minPurchaseAmount => throw _privateConstructorUsedError;
  num? get maxDiscountAmount => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get brandLogo => throw _privateConstructorUsedError;
  int? get displayOrder => throw _privateConstructorUsedError;
  bool? get isStaticAd => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  int? get v => throw _privateConstructorUsedError;
  bool? get isRedeemed => throw _privateConstructorUsedError;
  int? get usedCount => throw _privateConstructorUsedError;
  Conditions? get conditions => throw _privateConstructorUsedError;
  OutletInfo? get outletInfo => throw _privateConstructorUsedError;
  Images? get images => throw _privateConstructorUsedError;
  PromotionalDetails? get promotionalDetails =>
      throw _privateConstructorUsedError;
  DisplayInfo? get displayInfo => throw _privateConstructorUsedError;
  List<String>? get detailedTerms => throw _privateConstructorUsedError;

  /// Serializes this VoucherDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VoucherDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoucherDetailModelCopyWith<VoucherDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoucherDetailModelCopyWith<$Res> {
  factory $VoucherDetailModelCopyWith(
    VoucherDetailModel value,
    $Res Function(VoucherDetailModel) then,
  ) = _$VoucherDetailModelCopyWithImpl<$Res, VoucherDetailModel>;
  @useResult
  $Res call({
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
  });

  $ConditionsCopyWith<$Res>? get conditions;
  $OutletInfoCopyWith<$Res>? get outletInfo;
  $ImagesCopyWith<$Res>? get images;
  $PromotionalDetailsCopyWith<$Res>? get promotionalDetails;
  $DisplayInfoCopyWith<$Res>? get displayInfo;
}

/// @nodoc
class _$VoucherDetailModelCopyWithImpl<$Res, $Val extends VoucherDetailModel>
    implements $VoucherDetailModelCopyWith<$Res> {
  _$VoucherDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoucherDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? voucherCode = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? discountType = freezed,
    Object? discountValue = freezed,
    Object? voucherType = freezed,
    Object? startDate = freezed,
    Object? expiryDate = freezed,
    Object? status = freezed,
    Object? badge = freezed,
    Object? terms = freezed,
    Object? maxRedemptionsPerUser = freezed,
    Object? totalUsageLimit = freezed,
    Object? currentUsageCount = freezed,
    Object? minPurchaseAmount = freezed,
    Object? maxDiscountAmount = freezed,
    Object? icon = freezed,
    Object? brandLogo = freezed,
    Object? displayOrder = freezed,
    Object? isStaticAd = freezed,
    Object? isDeleted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
    Object? isRedeemed = freezed,
    Object? usedCount = freezed,
    Object? conditions = freezed,
    Object? outletInfo = freezed,
    Object? images = freezed,
    Object? promotionalDetails = freezed,
    Object? displayInfo = freezed,
    Object? detailedTerms = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            voucherCode: freezed == voucherCode
                ? _value.voucherCode
                : voucherCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            discountType: freezed == discountType
                ? _value.discountType
                : discountType // ignore: cast_nullable_to_non_nullable
                      as String?,
            discountValue: freezed == discountValue
                ? _value.discountValue
                : discountValue // ignore: cast_nullable_to_non_nullable
                      as num?,
            voucherType: freezed == voucherType
                ? _value.voucherType
                : voucherType // ignore: cast_nullable_to_non_nullable
                      as String?,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            expiryDate: freezed == expiryDate
                ? _value.expiryDate
                : expiryDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            badge: freezed == badge
                ? _value.badge
                : badge // ignore: cast_nullable_to_non_nullable
                      as String?,
            terms: freezed == terms
                ? _value.terms
                : terms // ignore: cast_nullable_to_non_nullable
                      as String?,
            maxRedemptionsPerUser: freezed == maxRedemptionsPerUser
                ? _value.maxRedemptionsPerUser
                : maxRedemptionsPerUser // ignore: cast_nullable_to_non_nullable
                      as int?,
            totalUsageLimit: freezed == totalUsageLimit
                ? _value.totalUsageLimit
                : totalUsageLimit // ignore: cast_nullable_to_non_nullable
                      as int?,
            currentUsageCount: freezed == currentUsageCount
                ? _value.currentUsageCount
                : currentUsageCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            minPurchaseAmount: freezed == minPurchaseAmount
                ? _value.minPurchaseAmount
                : minPurchaseAmount // ignore: cast_nullable_to_non_nullable
                      as num?,
            maxDiscountAmount: freezed == maxDiscountAmount
                ? _value.maxDiscountAmount
                : maxDiscountAmount // ignore: cast_nullable_to_non_nullable
                      as num?,
            icon: freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as String?,
            brandLogo: freezed == brandLogo
                ? _value.brandLogo
                : brandLogo // ignore: cast_nullable_to_non_nullable
                      as String?,
            displayOrder: freezed == displayOrder
                ? _value.displayOrder
                : displayOrder // ignore: cast_nullable_to_non_nullable
                      as int?,
            isStaticAd: freezed == isStaticAd
                ? _value.isStaticAd
                : isStaticAd // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isDeleted: freezed == isDeleted
                ? _value.isDeleted
                : isDeleted // ignore: cast_nullable_to_non_nullable
                      as bool?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            v: freezed == v
                ? _value.v
                : v // ignore: cast_nullable_to_non_nullable
                      as int?,
            isRedeemed: freezed == isRedeemed
                ? _value.isRedeemed
                : isRedeemed // ignore: cast_nullable_to_non_nullable
                      as bool?,
            usedCount: freezed == usedCount
                ? _value.usedCount
                : usedCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            conditions: freezed == conditions
                ? _value.conditions
                : conditions // ignore: cast_nullable_to_non_nullable
                      as Conditions?,
            outletInfo: freezed == outletInfo
                ? _value.outletInfo
                : outletInfo // ignore: cast_nullable_to_non_nullable
                      as OutletInfo?,
            images: freezed == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                      as Images?,
            promotionalDetails: freezed == promotionalDetails
                ? _value.promotionalDetails
                : promotionalDetails // ignore: cast_nullable_to_non_nullable
                      as PromotionalDetails?,
            displayInfo: freezed == displayInfo
                ? _value.displayInfo
                : displayInfo // ignore: cast_nullable_to_non_nullable
                      as DisplayInfo?,
            detailedTerms: freezed == detailedTerms
                ? _value.detailedTerms
                : detailedTerms // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }

  /// Create a copy of VoucherDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConditionsCopyWith<$Res>? get conditions {
    if (_value.conditions == null) {
      return null;
    }

    return $ConditionsCopyWith<$Res>(_value.conditions!, (value) {
      return _then(_value.copyWith(conditions: value) as $Val);
    });
  }

  /// Create a copy of VoucherDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutletInfoCopyWith<$Res>? get outletInfo {
    if (_value.outletInfo == null) {
      return null;
    }

    return $OutletInfoCopyWith<$Res>(_value.outletInfo!, (value) {
      return _then(_value.copyWith(outletInfo: value) as $Val);
    });
  }

  /// Create a copy of VoucherDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImagesCopyWith<$Res>? get images {
    if (_value.images == null) {
      return null;
    }

    return $ImagesCopyWith<$Res>(_value.images!, (value) {
      return _then(_value.copyWith(images: value) as $Val);
    });
  }

  /// Create a copy of VoucherDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PromotionalDetailsCopyWith<$Res>? get promotionalDetails {
    if (_value.promotionalDetails == null) {
      return null;
    }

    return $PromotionalDetailsCopyWith<$Res>(_value.promotionalDetails!, (
      value,
    ) {
      return _then(_value.copyWith(promotionalDetails: value) as $Val);
    });
  }

  /// Create a copy of VoucherDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DisplayInfoCopyWith<$Res>? get displayInfo {
    if (_value.displayInfo == null) {
      return null;
    }

    return $DisplayInfoCopyWith<$Res>(_value.displayInfo!, (value) {
      return _then(_value.copyWith(displayInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VoucherDetailModelImplCopyWith<$Res>
    implements $VoucherDetailModelCopyWith<$Res> {
  factory _$$VoucherDetailModelImplCopyWith(
    _$VoucherDetailModelImpl value,
    $Res Function(_$VoucherDetailModelImpl) then,
  ) = __$$VoucherDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
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
  });

  @override
  $ConditionsCopyWith<$Res>? get conditions;
  @override
  $OutletInfoCopyWith<$Res>? get outletInfo;
  @override
  $ImagesCopyWith<$Res>? get images;
  @override
  $PromotionalDetailsCopyWith<$Res>? get promotionalDetails;
  @override
  $DisplayInfoCopyWith<$Res>? get displayInfo;
}

/// @nodoc
class __$$VoucherDetailModelImplCopyWithImpl<$Res>
    extends _$VoucherDetailModelCopyWithImpl<$Res, _$VoucherDetailModelImpl>
    implements _$$VoucherDetailModelImplCopyWith<$Res> {
  __$$VoucherDetailModelImplCopyWithImpl(
    _$VoucherDetailModelImpl _value,
    $Res Function(_$VoucherDetailModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VoucherDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? voucherCode = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? discountType = freezed,
    Object? discountValue = freezed,
    Object? voucherType = freezed,
    Object? startDate = freezed,
    Object? expiryDate = freezed,
    Object? status = freezed,
    Object? badge = freezed,
    Object? terms = freezed,
    Object? maxRedemptionsPerUser = freezed,
    Object? totalUsageLimit = freezed,
    Object? currentUsageCount = freezed,
    Object? minPurchaseAmount = freezed,
    Object? maxDiscountAmount = freezed,
    Object? icon = freezed,
    Object? brandLogo = freezed,
    Object? displayOrder = freezed,
    Object? isStaticAd = freezed,
    Object? isDeleted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
    Object? isRedeemed = freezed,
    Object? usedCount = freezed,
    Object? conditions = freezed,
    Object? outletInfo = freezed,
    Object? images = freezed,
    Object? promotionalDetails = freezed,
    Object? displayInfo = freezed,
    Object? detailedTerms = freezed,
  }) {
    return _then(
      _$VoucherDetailModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        voucherCode: freezed == voucherCode
            ? _value.voucherCode
            : voucherCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        discountType: freezed == discountType
            ? _value.discountType
            : discountType // ignore: cast_nullable_to_non_nullable
                  as String?,
        discountValue: freezed == discountValue
            ? _value.discountValue
            : discountValue // ignore: cast_nullable_to_non_nullable
                  as num?,
        voucherType: freezed == voucherType
            ? _value.voucherType
            : voucherType // ignore: cast_nullable_to_non_nullable
                  as String?,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        expiryDate: freezed == expiryDate
            ? _value.expiryDate
            : expiryDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        badge: freezed == badge
            ? _value.badge
            : badge // ignore: cast_nullable_to_non_nullable
                  as String?,
        terms: freezed == terms
            ? _value.terms
            : terms // ignore: cast_nullable_to_non_nullable
                  as String?,
        maxRedemptionsPerUser: freezed == maxRedemptionsPerUser
            ? _value.maxRedemptionsPerUser
            : maxRedemptionsPerUser // ignore: cast_nullable_to_non_nullable
                  as int?,
        totalUsageLimit: freezed == totalUsageLimit
            ? _value.totalUsageLimit
            : totalUsageLimit // ignore: cast_nullable_to_non_nullable
                  as int?,
        currentUsageCount: freezed == currentUsageCount
            ? _value.currentUsageCount
            : currentUsageCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        minPurchaseAmount: freezed == minPurchaseAmount
            ? _value.minPurchaseAmount
            : minPurchaseAmount // ignore: cast_nullable_to_non_nullable
                  as num?,
        maxDiscountAmount: freezed == maxDiscountAmount
            ? _value.maxDiscountAmount
            : maxDiscountAmount // ignore: cast_nullable_to_non_nullable
                  as num?,
        icon: freezed == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String?,
        brandLogo: freezed == brandLogo
            ? _value.brandLogo
            : brandLogo // ignore: cast_nullable_to_non_nullable
                  as String?,
        displayOrder: freezed == displayOrder
            ? _value.displayOrder
            : displayOrder // ignore: cast_nullable_to_non_nullable
                  as int?,
        isStaticAd: freezed == isStaticAd
            ? _value.isStaticAd
            : isStaticAd // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isDeleted: freezed == isDeleted
            ? _value.isDeleted
            : isDeleted // ignore: cast_nullable_to_non_nullable
                  as bool?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        v: freezed == v
            ? _value.v
            : v // ignore: cast_nullable_to_non_nullable
                  as int?,
        isRedeemed: freezed == isRedeemed
            ? _value.isRedeemed
            : isRedeemed // ignore: cast_nullable_to_non_nullable
                  as bool?,
        usedCount: freezed == usedCount
            ? _value.usedCount
            : usedCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        conditions: freezed == conditions
            ? _value.conditions
            : conditions // ignore: cast_nullable_to_non_nullable
                  as Conditions?,
        outletInfo: freezed == outletInfo
            ? _value.outletInfo
            : outletInfo // ignore: cast_nullable_to_non_nullable
                  as OutletInfo?,
        images: freezed == images
            ? _value.images
            : images // ignore: cast_nullable_to_non_nullable
                  as Images?,
        promotionalDetails: freezed == promotionalDetails
            ? _value.promotionalDetails
            : promotionalDetails // ignore: cast_nullable_to_non_nullable
                  as PromotionalDetails?,
        displayInfo: freezed == displayInfo
            ? _value.displayInfo
            : displayInfo // ignore: cast_nullable_to_non_nullable
                  as DisplayInfo?,
        detailedTerms: freezed == detailedTerms
            ? _value._detailedTerms
            : detailedTerms // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VoucherDetailModelImpl implements _VoucherDetailModel {
  const _$VoucherDetailModelImpl({
    @JsonKey(name: '_id') this.id,
    this.voucherCode,
    this.title,
    this.description,
    this.discountType,
    this.discountValue,
    this.voucherType,
    this.startDate,
    this.expiryDate,
    this.status,
    this.badge,
    this.terms,
    this.maxRedemptionsPerUser,
    this.totalUsageLimit,
    this.currentUsageCount,
    this.minPurchaseAmount,
    this.maxDiscountAmount,
    this.icon,
    this.brandLogo,
    this.displayOrder,
    this.isStaticAd,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.isRedeemed,
    this.usedCount,
    this.conditions,
    this.outletInfo,
    this.images,
    this.promotionalDetails,
    this.displayInfo,
    final List<String>? detailedTerms,
  }) : _detailedTerms = detailedTerms;

  factory _$VoucherDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoucherDetailModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? voucherCode;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? discountType;
  @override
  final num? discountValue;
  @override
  final String? voucherType;
  @override
  final DateTime? startDate;
  @override
  final DateTime? expiryDate;
  @override
  final String? status;
  @override
  final String? badge;
  @override
  final String? terms;
  @override
  final int? maxRedemptionsPerUser;
  @override
  final int? totalUsageLimit;
  @override
  final int? currentUsageCount;
  @override
  final num? minPurchaseAmount;
  @override
  final num? maxDiscountAmount;
  @override
  final String? icon;
  @override
  final String? brandLogo;
  @override
  final int? displayOrder;
  @override
  final bool? isStaticAd;
  @override
  final bool? isDeleted;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final int? v;
  @override
  final bool? isRedeemed;
  @override
  final int? usedCount;
  @override
  final Conditions? conditions;
  @override
  final OutletInfo? outletInfo;
  @override
  final Images? images;
  @override
  final PromotionalDetails? promotionalDetails;
  @override
  final DisplayInfo? displayInfo;
  final List<String>? _detailedTerms;
  @override
  List<String>? get detailedTerms {
    final value = _detailedTerms;
    if (value == null) return null;
    if (_detailedTerms is EqualUnmodifiableListView) return _detailedTerms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'VoucherDetailModel(id: $id, voucherCode: $voucherCode, title: $title, description: $description, discountType: $discountType, discountValue: $discountValue, voucherType: $voucherType, startDate: $startDate, expiryDate: $expiryDate, status: $status, badge: $badge, terms: $terms, maxRedemptionsPerUser: $maxRedemptionsPerUser, totalUsageLimit: $totalUsageLimit, currentUsageCount: $currentUsageCount, minPurchaseAmount: $minPurchaseAmount, maxDiscountAmount: $maxDiscountAmount, icon: $icon, brandLogo: $brandLogo, displayOrder: $displayOrder, isStaticAd: $isStaticAd, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, isRedeemed: $isRedeemed, usedCount: $usedCount, conditions: $conditions, outletInfo: $outletInfo, images: $images, promotionalDetails: $promotionalDetails, displayInfo: $displayInfo, detailedTerms: $detailedTerms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoucherDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.voucherCode, voucherCode) ||
                other.voucherCode == voucherCode) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.voucherType, voucherType) ||
                other.voucherType == voucherType) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.badge, badge) || other.badge == badge) &&
            (identical(other.terms, terms) || other.terms == terms) &&
            (identical(other.maxRedemptionsPerUser, maxRedemptionsPerUser) ||
                other.maxRedemptionsPerUser == maxRedemptionsPerUser) &&
            (identical(other.totalUsageLimit, totalUsageLimit) ||
                other.totalUsageLimit == totalUsageLimit) &&
            (identical(other.currentUsageCount, currentUsageCount) ||
                other.currentUsageCount == currentUsageCount) &&
            (identical(other.minPurchaseAmount, minPurchaseAmount) ||
                other.minPurchaseAmount == minPurchaseAmount) &&
            (identical(other.maxDiscountAmount, maxDiscountAmount) ||
                other.maxDiscountAmount == maxDiscountAmount) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.brandLogo, brandLogo) ||
                other.brandLogo == brandLogo) &&
            (identical(other.displayOrder, displayOrder) ||
                other.displayOrder == displayOrder) &&
            (identical(other.isStaticAd, isStaticAd) ||
                other.isStaticAd == isStaticAd) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v) &&
            (identical(other.isRedeemed, isRedeemed) ||
                other.isRedeemed == isRedeemed) &&
            (identical(other.usedCount, usedCount) ||
                other.usedCount == usedCount) &&
            (identical(other.conditions, conditions) ||
                other.conditions == conditions) &&
            (identical(other.outletInfo, outletInfo) ||
                other.outletInfo == outletInfo) &&
            (identical(other.images, images) || other.images == images) &&
            (identical(other.promotionalDetails, promotionalDetails) ||
                other.promotionalDetails == promotionalDetails) &&
            (identical(other.displayInfo, displayInfo) ||
                other.displayInfo == displayInfo) &&
            const DeepCollectionEquality().equals(
              other._detailedTerms,
              _detailedTerms,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    voucherCode,
    title,
    description,
    discountType,
    discountValue,
    voucherType,
    startDate,
    expiryDate,
    status,
    badge,
    terms,
    maxRedemptionsPerUser,
    totalUsageLimit,
    currentUsageCount,
    minPurchaseAmount,
    maxDiscountAmount,
    icon,
    brandLogo,
    displayOrder,
    isStaticAd,
    isDeleted,
    createdAt,
    updatedAt,
    v,
    isRedeemed,
    usedCount,
    conditions,
    outletInfo,
    images,
    promotionalDetails,
    displayInfo,
    const DeepCollectionEquality().hash(_detailedTerms),
  ]);

  /// Create a copy of VoucherDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoucherDetailModelImplCopyWith<_$VoucherDetailModelImpl> get copyWith =>
      __$$VoucherDetailModelImplCopyWithImpl<_$VoucherDetailModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VoucherDetailModelImplToJson(this);
  }
}

abstract class _VoucherDetailModel implements VoucherDetailModel {
  const factory _VoucherDetailModel({
    @JsonKey(name: '_id') final String? id,
    final String? voucherCode,
    final String? title,
    final String? description,
    final String? discountType,
    final num? discountValue,
    final String? voucherType,
    final DateTime? startDate,
    final DateTime? expiryDate,
    final String? status,
    final String? badge,
    final String? terms,
    final int? maxRedemptionsPerUser,
    final int? totalUsageLimit,
    final int? currentUsageCount,
    final num? minPurchaseAmount,
    final num? maxDiscountAmount,
    final String? icon,
    final String? brandLogo,
    final int? displayOrder,
    final bool? isStaticAd,
    final bool? isDeleted,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final int? v,
    final bool? isRedeemed,
    final int? usedCount,
    final Conditions? conditions,
    final OutletInfo? outletInfo,
    final Images? images,
    final PromotionalDetails? promotionalDetails,
    final DisplayInfo? displayInfo,
    final List<String>? detailedTerms,
  }) = _$VoucherDetailModelImpl;

  factory _VoucherDetailModel.fromJson(Map<String, dynamic> json) =
      _$VoucherDetailModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get voucherCode;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get discountType;
  @override
  num? get discountValue;
  @override
  String? get voucherType;
  @override
  DateTime? get startDate;
  @override
  DateTime? get expiryDate;
  @override
  String? get status;
  @override
  String? get badge;
  @override
  String? get terms;
  @override
  int? get maxRedemptionsPerUser;
  @override
  int? get totalUsageLimit;
  @override
  int? get currentUsageCount;
  @override
  num? get minPurchaseAmount;
  @override
  num? get maxDiscountAmount;
  @override
  String? get icon;
  @override
  String? get brandLogo;
  @override
  int? get displayOrder;
  @override
  bool? get isStaticAd;
  @override
  bool? get isDeleted;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  int? get v;
  @override
  bool? get isRedeemed;
  @override
  int? get usedCount;
  @override
  Conditions? get conditions;
  @override
  OutletInfo? get outletInfo;
  @override
  Images? get images;
  @override
  PromotionalDetails? get promotionalDetails;
  @override
  DisplayInfo? get displayInfo;
  @override
  List<String>? get detailedTerms;

  /// Create a copy of VoucherDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoucherDetailModelImplCopyWith<_$VoucherDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Conditions _$ConditionsFromJson(Map<String, dynamic> json) {
  return _Conditions.fromJson(json);
}

/// @nodoc
mixin _$Conditions {
  TimeRestrictions? get timeRestrictions => throw _privateConstructorUsedError;
  String? get applicableItems => throw _privateConstructorUsedError;
  List<String>? get excludedOutlets => throw _privateConstructorUsedError;
  int? get userLimitPerOutlet => throw _privateConstructorUsedError;
  List<String>? get serviceTypes => throw _privateConstructorUsedError;
  List<String>? get additionalRestrictions =>
      throw _privateConstructorUsedError;

  /// Serializes this Conditions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Conditions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConditionsCopyWith<Conditions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionsCopyWith<$Res> {
  factory $ConditionsCopyWith(
    Conditions value,
    $Res Function(Conditions) then,
  ) = _$ConditionsCopyWithImpl<$Res, Conditions>;
  @useResult
  $Res call({
    TimeRestrictions? timeRestrictions,
    String? applicableItems,
    List<String>? excludedOutlets,
    int? userLimitPerOutlet,
    List<String>? serviceTypes,
    List<String>? additionalRestrictions,
  });

  $TimeRestrictionsCopyWith<$Res>? get timeRestrictions;
}

/// @nodoc
class _$ConditionsCopyWithImpl<$Res, $Val extends Conditions>
    implements $ConditionsCopyWith<$Res> {
  _$ConditionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Conditions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeRestrictions = freezed,
    Object? applicableItems = freezed,
    Object? excludedOutlets = freezed,
    Object? userLimitPerOutlet = freezed,
    Object? serviceTypes = freezed,
    Object? additionalRestrictions = freezed,
  }) {
    return _then(
      _value.copyWith(
            timeRestrictions: freezed == timeRestrictions
                ? _value.timeRestrictions
                : timeRestrictions // ignore: cast_nullable_to_non_nullable
                      as TimeRestrictions?,
            applicableItems: freezed == applicableItems
                ? _value.applicableItems
                : applicableItems // ignore: cast_nullable_to_non_nullable
                      as String?,
            excludedOutlets: freezed == excludedOutlets
                ? _value.excludedOutlets
                : excludedOutlets // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            userLimitPerOutlet: freezed == userLimitPerOutlet
                ? _value.userLimitPerOutlet
                : userLimitPerOutlet // ignore: cast_nullable_to_non_nullable
                      as int?,
            serviceTypes: freezed == serviceTypes
                ? _value.serviceTypes
                : serviceTypes // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            additionalRestrictions: freezed == additionalRestrictions
                ? _value.additionalRestrictions
                : additionalRestrictions // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }

  /// Create a copy of Conditions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimeRestrictionsCopyWith<$Res>? get timeRestrictions {
    if (_value.timeRestrictions == null) {
      return null;
    }

    return $TimeRestrictionsCopyWith<$Res>(_value.timeRestrictions!, (value) {
      return _then(_value.copyWith(timeRestrictions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConditionsImplCopyWith<$Res>
    implements $ConditionsCopyWith<$Res> {
  factory _$$ConditionsImplCopyWith(
    _$ConditionsImpl value,
    $Res Function(_$ConditionsImpl) then,
  ) = __$$ConditionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TimeRestrictions? timeRestrictions,
    String? applicableItems,
    List<String>? excludedOutlets,
    int? userLimitPerOutlet,
    List<String>? serviceTypes,
    List<String>? additionalRestrictions,
  });

  @override
  $TimeRestrictionsCopyWith<$Res>? get timeRestrictions;
}

/// @nodoc
class __$$ConditionsImplCopyWithImpl<$Res>
    extends _$ConditionsCopyWithImpl<$Res, _$ConditionsImpl>
    implements _$$ConditionsImplCopyWith<$Res> {
  __$$ConditionsImplCopyWithImpl(
    _$ConditionsImpl _value,
    $Res Function(_$ConditionsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Conditions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeRestrictions = freezed,
    Object? applicableItems = freezed,
    Object? excludedOutlets = freezed,
    Object? userLimitPerOutlet = freezed,
    Object? serviceTypes = freezed,
    Object? additionalRestrictions = freezed,
  }) {
    return _then(
      _$ConditionsImpl(
        timeRestrictions: freezed == timeRestrictions
            ? _value.timeRestrictions
            : timeRestrictions // ignore: cast_nullable_to_non_nullable
                  as TimeRestrictions?,
        applicableItems: freezed == applicableItems
            ? _value.applicableItems
            : applicableItems // ignore: cast_nullable_to_non_nullable
                  as String?,
        excludedOutlets: freezed == excludedOutlets
            ? _value._excludedOutlets
            : excludedOutlets // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        userLimitPerOutlet: freezed == userLimitPerOutlet
            ? _value.userLimitPerOutlet
            : userLimitPerOutlet // ignore: cast_nullable_to_non_nullable
                  as int?,
        serviceTypes: freezed == serviceTypes
            ? _value._serviceTypes
            : serviceTypes // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        additionalRestrictions: freezed == additionalRestrictions
            ? _value._additionalRestrictions
            : additionalRestrictions // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConditionsImpl implements _Conditions {
  const _$ConditionsImpl({
    this.timeRestrictions,
    this.applicableItems,
    final List<String>? excludedOutlets,
    this.userLimitPerOutlet,
    final List<String>? serviceTypes,
    final List<String>? additionalRestrictions,
  }) : _excludedOutlets = excludedOutlets,
       _serviceTypes = serviceTypes,
       _additionalRestrictions = additionalRestrictions;

  factory _$ConditionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConditionsImplFromJson(json);

  @override
  final TimeRestrictions? timeRestrictions;
  @override
  final String? applicableItems;
  final List<String>? _excludedOutlets;
  @override
  List<String>? get excludedOutlets {
    final value = _excludedOutlets;
    if (value == null) return null;
    if (_excludedOutlets is EqualUnmodifiableListView) return _excludedOutlets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? userLimitPerOutlet;
  final List<String>? _serviceTypes;
  @override
  List<String>? get serviceTypes {
    final value = _serviceTypes;
    if (value == null) return null;
    if (_serviceTypes is EqualUnmodifiableListView) return _serviceTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _additionalRestrictions;
  @override
  List<String>? get additionalRestrictions {
    final value = _additionalRestrictions;
    if (value == null) return null;
    if (_additionalRestrictions is EqualUnmodifiableListView)
      return _additionalRestrictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Conditions(timeRestrictions: $timeRestrictions, applicableItems: $applicableItems, excludedOutlets: $excludedOutlets, userLimitPerOutlet: $userLimitPerOutlet, serviceTypes: $serviceTypes, additionalRestrictions: $additionalRestrictions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionsImpl &&
            (identical(other.timeRestrictions, timeRestrictions) ||
                other.timeRestrictions == timeRestrictions) &&
            (identical(other.applicableItems, applicableItems) ||
                other.applicableItems == applicableItems) &&
            const DeepCollectionEquality().equals(
              other._excludedOutlets,
              _excludedOutlets,
            ) &&
            (identical(other.userLimitPerOutlet, userLimitPerOutlet) ||
                other.userLimitPerOutlet == userLimitPerOutlet) &&
            const DeepCollectionEquality().equals(
              other._serviceTypes,
              _serviceTypes,
            ) &&
            const DeepCollectionEquality().equals(
              other._additionalRestrictions,
              _additionalRestrictions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    timeRestrictions,
    applicableItems,
    const DeepCollectionEquality().hash(_excludedOutlets),
    userLimitPerOutlet,
    const DeepCollectionEquality().hash(_serviceTypes),
    const DeepCollectionEquality().hash(_additionalRestrictions),
  );

  /// Create a copy of Conditions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionsImplCopyWith<_$ConditionsImpl> get copyWith =>
      __$$ConditionsImplCopyWithImpl<_$ConditionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionsImplToJson(this);
  }
}

abstract class _Conditions implements Conditions {
  const factory _Conditions({
    final TimeRestrictions? timeRestrictions,
    final String? applicableItems,
    final List<String>? excludedOutlets,
    final int? userLimitPerOutlet,
    final List<String>? serviceTypes,
    final List<String>? additionalRestrictions,
  }) = _$ConditionsImpl;

  factory _Conditions.fromJson(Map<String, dynamic> json) =
      _$ConditionsImpl.fromJson;

  @override
  TimeRestrictions? get timeRestrictions;
  @override
  String? get applicableItems;
  @override
  List<String>? get excludedOutlets;
  @override
  int? get userLimitPerOutlet;
  @override
  List<String>? get serviceTypes;
  @override
  List<String>? get additionalRestrictions;

  /// Create a copy of Conditions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConditionsImplCopyWith<_$ConditionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeRestrictions _$TimeRestrictionsFromJson(Map<String, dynamic> json) {
  return _TimeRestrictions.fromJson(json);
}

/// @nodoc
mixin _$TimeRestrictions {
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  List<String>? get days => throw _privateConstructorUsedError;

  /// Serializes this TimeRestrictions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeRestrictions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeRestrictionsCopyWith<TimeRestrictions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeRestrictionsCopyWith<$Res> {
  factory $TimeRestrictionsCopyWith(
    TimeRestrictions value,
    $Res Function(TimeRestrictions) then,
  ) = _$TimeRestrictionsCopyWithImpl<$Res, TimeRestrictions>;
  @useResult
  $Res call({String? startTime, String? endTime, List<String>? days});
}

/// @nodoc
class _$TimeRestrictionsCopyWithImpl<$Res, $Val extends TimeRestrictions>
    implements $TimeRestrictionsCopyWith<$Res> {
  _$TimeRestrictionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeRestrictions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? days = freezed,
  }) {
    return _then(
      _value.copyWith(
            startTime: freezed == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            endTime: freezed == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            days: freezed == days
                ? _value.days
                : days // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TimeRestrictionsImplCopyWith<$Res>
    implements $TimeRestrictionsCopyWith<$Res> {
  factory _$$TimeRestrictionsImplCopyWith(
    _$TimeRestrictionsImpl value,
    $Res Function(_$TimeRestrictionsImpl) then,
  ) = __$$TimeRestrictionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? startTime, String? endTime, List<String>? days});
}

/// @nodoc
class __$$TimeRestrictionsImplCopyWithImpl<$Res>
    extends _$TimeRestrictionsCopyWithImpl<$Res, _$TimeRestrictionsImpl>
    implements _$$TimeRestrictionsImplCopyWith<$Res> {
  __$$TimeRestrictionsImplCopyWithImpl(
    _$TimeRestrictionsImpl _value,
    $Res Function(_$TimeRestrictionsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TimeRestrictions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? days = freezed,
  }) {
    return _then(
      _$TimeRestrictionsImpl(
        startTime: freezed == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        endTime: freezed == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        days: freezed == days
            ? _value._days
            : days // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeRestrictionsImpl implements _TimeRestrictions {
  const _$TimeRestrictionsImpl({
    this.startTime,
    this.endTime,
    final List<String>? days,
  }) : _days = days;

  factory _$TimeRestrictionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeRestrictionsImplFromJson(json);

  @override
  final String? startTime;
  @override
  final String? endTime;
  final List<String>? _days;
  @override
  List<String>? get days {
    final value = _days;
    if (value == null) return null;
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TimeRestrictions(startTime: $startTime, endTime: $endTime, days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeRestrictionsImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    startTime,
    endTime,
    const DeepCollectionEquality().hash(_days),
  );

  /// Create a copy of TimeRestrictions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeRestrictionsImplCopyWith<_$TimeRestrictionsImpl> get copyWith =>
      __$$TimeRestrictionsImplCopyWithImpl<_$TimeRestrictionsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeRestrictionsImplToJson(this);
  }
}

abstract class _TimeRestrictions implements TimeRestrictions {
  const factory _TimeRestrictions({
    final String? startTime,
    final String? endTime,
    final List<String>? days,
  }) = _$TimeRestrictionsImpl;

  factory _TimeRestrictions.fromJson(Map<String, dynamic> json) =
      _$TimeRestrictionsImpl.fromJson;

  @override
  String? get startTime;
  @override
  String? get endTime;
  @override
  List<String>? get days;

  /// Create a copy of TimeRestrictions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeRestrictionsImplCopyWith<_$TimeRestrictionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OutletInfo _$OutletInfoFromJson(Map<String, dynamic> json) {
  return _OutletInfo.fromJson(json);
}

/// @nodoc
mixin _$OutletInfo {
  Coordinates? get coordinates => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get outletId => throw _privateConstructorUsedError;

  /// Serializes this OutletInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OutletInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutletInfoCopyWith<OutletInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutletInfoCopyWith<$Res> {
  factory $OutletInfoCopyWith(
    OutletInfo value,
    $Res Function(OutletInfo) then,
  ) = _$OutletInfoCopyWithImpl<$Res, OutletInfo>;
  @useResult
  $Res call({
    Coordinates? coordinates,
    String? name,
    String? address,
    String? outletId,
  });

  $CoordinatesCopyWith<$Res>? get coordinates;
}

/// @nodoc
class _$OutletInfoCopyWithImpl<$Res, $Val extends OutletInfo>
    implements $OutletInfoCopyWith<$Res> {
  _$OutletInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutletInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? outletId = freezed,
  }) {
    return _then(
      _value.copyWith(
            coordinates: freezed == coordinates
                ? _value.coordinates
                : coordinates // ignore: cast_nullable_to_non_nullable
                      as Coordinates?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            outletId: freezed == outletId
                ? _value.outletId
                : outletId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of OutletInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoordinatesCopyWith<$Res>? get coordinates {
    if (_value.coordinates == null) {
      return null;
    }

    return $CoordinatesCopyWith<$Res>(_value.coordinates!, (value) {
      return _then(_value.copyWith(coordinates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OutletInfoImplCopyWith<$Res>
    implements $OutletInfoCopyWith<$Res> {
  factory _$$OutletInfoImplCopyWith(
    _$OutletInfoImpl value,
    $Res Function(_$OutletInfoImpl) then,
  ) = __$$OutletInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Coordinates? coordinates,
    String? name,
    String? address,
    String? outletId,
  });

  @override
  $CoordinatesCopyWith<$Res>? get coordinates;
}

/// @nodoc
class __$$OutletInfoImplCopyWithImpl<$Res>
    extends _$OutletInfoCopyWithImpl<$Res, _$OutletInfoImpl>
    implements _$$OutletInfoImplCopyWith<$Res> {
  __$$OutletInfoImplCopyWithImpl(
    _$OutletInfoImpl _value,
    $Res Function(_$OutletInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OutletInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? outletId = freezed,
  }) {
    return _then(
      _$OutletInfoImpl(
        coordinates: freezed == coordinates
            ? _value.coordinates
            : coordinates // ignore: cast_nullable_to_non_nullable
                  as Coordinates?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        outletId: freezed == outletId
            ? _value.outletId
            : outletId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OutletInfoImpl implements _OutletInfo {
  const _$OutletInfoImpl({
    this.coordinates,
    this.name,
    this.address,
    this.outletId,
  });

  factory _$OutletInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutletInfoImplFromJson(json);

  @override
  final Coordinates? coordinates;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final String? outletId;

  @override
  String toString() {
    return 'OutletInfo(coordinates: $coordinates, name: $name, address: $address, outletId: $outletId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutletInfoImpl &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, coordinates, name, address, outletId);

  /// Create a copy of OutletInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutletInfoImplCopyWith<_$OutletInfoImpl> get copyWith =>
      __$$OutletInfoImplCopyWithImpl<_$OutletInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutletInfoImplToJson(this);
  }
}

abstract class _OutletInfo implements OutletInfo {
  const factory _OutletInfo({
    final Coordinates? coordinates,
    final String? name,
    final String? address,
    final String? outletId,
  }) = _$OutletInfoImpl;

  factory _OutletInfo.fromJson(Map<String, dynamic> json) =
      _$OutletInfoImpl.fromJson;

  @override
  Coordinates? get coordinates;
  @override
  String? get name;
  @override
  String? get address;
  @override
  String? get outletId;

  /// Create a copy of OutletInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutletInfoImplCopyWith<_$OutletInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) {
  return _Coordinates.fromJson(json);
}

/// @nodoc
mixin _$Coordinates {
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;

  /// Serializes this Coordinates to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Coordinates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoordinatesCopyWith<Coordinates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordinatesCopyWith<$Res> {
  factory $CoordinatesCopyWith(
    Coordinates value,
    $Res Function(Coordinates) then,
  ) = _$CoordinatesCopyWithImpl<$Res, Coordinates>;
  @useResult
  $Res call({double? latitude, double? longitude});
}

/// @nodoc
class _$CoordinatesCopyWithImpl<$Res, $Val extends Coordinates>
    implements $CoordinatesCopyWith<$Res> {
  _$CoordinatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Coordinates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? latitude = freezed, Object? longitude = freezed}) {
    return _then(
      _value.copyWith(
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CoordinatesImplCopyWith<$Res>
    implements $CoordinatesCopyWith<$Res> {
  factory _$$CoordinatesImplCopyWith(
    _$CoordinatesImpl value,
    $Res Function(_$CoordinatesImpl) then,
  ) = __$$CoordinatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? latitude, double? longitude});
}

/// @nodoc
class __$$CoordinatesImplCopyWithImpl<$Res>
    extends _$CoordinatesCopyWithImpl<$Res, _$CoordinatesImpl>
    implements _$$CoordinatesImplCopyWith<$Res> {
  __$$CoordinatesImplCopyWithImpl(
    _$CoordinatesImpl _value,
    $Res Function(_$CoordinatesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Coordinates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? latitude = freezed, Object? longitude = freezed}) {
    return _then(
      _$CoordinatesImpl(
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CoordinatesImpl implements _Coordinates {
  const _$CoordinatesImpl({this.latitude, this.longitude});

  factory _$CoordinatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoordinatesImplFromJson(json);

  @override
  final double? latitude;
  @override
  final double? longitude;

  @override
  String toString() {
    return 'Coordinates(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoordinatesImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  /// Create a copy of Coordinates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoordinatesImplCopyWith<_$CoordinatesImpl> get copyWith =>
      __$$CoordinatesImplCopyWithImpl<_$CoordinatesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoordinatesImplToJson(this);
  }
}

abstract class _Coordinates implements Coordinates {
  const factory _Coordinates({
    final double? latitude,
    final double? longitude,
  }) = _$CoordinatesImpl;

  factory _Coordinates.fromJson(Map<String, dynamic> json) =
      _$CoordinatesImpl.fromJson;

  @override
  double? get latitude;
  @override
  double? get longitude;

  /// Create a copy of Coordinates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoordinatesImplCopyWith<_$CoordinatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return _Images.fromJson(json);
}

/// @nodoc
mixin _$Images {
  String? get mainImage => throw _privateConstructorUsedError;
  List<String>? get productImages => throw _privateConstructorUsedError;
  String? get backgroundImage => throw _privateConstructorUsedError;

  /// Serializes this Images to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Images
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImagesCopyWith<Images> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagesCopyWith<$Res> {
  factory $ImagesCopyWith(Images value, $Res Function(Images) then) =
      _$ImagesCopyWithImpl<$Res, Images>;
  @useResult
  $Res call({
    String? mainImage,
    List<String>? productImages,
    String? backgroundImage,
  });
}

/// @nodoc
class _$ImagesCopyWithImpl<$Res, $Val extends Images>
    implements $ImagesCopyWith<$Res> {
  _$ImagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Images
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainImage = freezed,
    Object? productImages = freezed,
    Object? backgroundImage = freezed,
  }) {
    return _then(
      _value.copyWith(
            mainImage: freezed == mainImage
                ? _value.mainImage
                : mainImage // ignore: cast_nullable_to_non_nullable
                      as String?,
            productImages: freezed == productImages
                ? _value.productImages
                : productImages // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            backgroundImage: freezed == backgroundImage
                ? _value.backgroundImage
                : backgroundImage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ImagesImplCopyWith<$Res> implements $ImagesCopyWith<$Res> {
  factory _$$ImagesImplCopyWith(
    _$ImagesImpl value,
    $Res Function(_$ImagesImpl) then,
  ) = __$$ImagesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? mainImage,
    List<String>? productImages,
    String? backgroundImage,
  });
}

/// @nodoc
class __$$ImagesImplCopyWithImpl<$Res>
    extends _$ImagesCopyWithImpl<$Res, _$ImagesImpl>
    implements _$$ImagesImplCopyWith<$Res> {
  __$$ImagesImplCopyWithImpl(
    _$ImagesImpl _value,
    $Res Function(_$ImagesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Images
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainImage = freezed,
    Object? productImages = freezed,
    Object? backgroundImage = freezed,
  }) {
    return _then(
      _$ImagesImpl(
        mainImage: freezed == mainImage
            ? _value.mainImage
            : mainImage // ignore: cast_nullable_to_non_nullable
                  as String?,
        productImages: freezed == productImages
            ? _value._productImages
            : productImages // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        backgroundImage: freezed == backgroundImage
            ? _value.backgroundImage
            : backgroundImage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ImagesImpl implements _Images {
  const _$ImagesImpl({
    this.mainImage,
    final List<String>? productImages,
    this.backgroundImage,
  }) : _productImages = productImages;

  factory _$ImagesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImagesImplFromJson(json);

  @override
  final String? mainImage;
  final List<String>? _productImages;
  @override
  List<String>? get productImages {
    final value = _productImages;
    if (value == null) return null;
    if (_productImages is EqualUnmodifiableListView) return _productImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? backgroundImage;

  @override
  String toString() {
    return 'Images(mainImage: $mainImage, productImages: $productImages, backgroundImage: $backgroundImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagesImpl &&
            (identical(other.mainImage, mainImage) ||
                other.mainImage == mainImage) &&
            const DeepCollectionEquality().equals(
              other._productImages,
              _productImages,
            ) &&
            (identical(other.backgroundImage, backgroundImage) ||
                other.backgroundImage == backgroundImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    mainImage,
    const DeepCollectionEquality().hash(_productImages),
    backgroundImage,
  );

  /// Create a copy of Images
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagesImplCopyWith<_$ImagesImpl> get copyWith =>
      __$$ImagesImplCopyWithImpl<_$ImagesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImagesImplToJson(this);
  }
}

abstract class _Images implements Images {
  const factory _Images({
    final String? mainImage,
    final List<String>? productImages,
    final String? backgroundImage,
  }) = _$ImagesImpl;

  factory _Images.fromJson(Map<String, dynamic> json) = _$ImagesImpl.fromJson;

  @override
  String? get mainImage;
  @override
  List<String>? get productImages;
  @override
  String? get backgroundImage;

  /// Create a copy of Images
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImagesImplCopyWith<_$ImagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PromotionalDetails _$PromotionalDetailsFromJson(Map<String, dynamic> json) {
  return _PromotionalDetails.fromJson(json);
}

/// @nodoc
mixin _$PromotionalDetails {
  String? get mainOffer => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String? get highlightText => throw _privateConstructorUsedError;
  String? get callToAction => throw _privateConstructorUsedError;

  /// Serializes this PromotionalDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PromotionalDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromotionalDetailsCopyWith<PromotionalDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionalDetailsCopyWith<$Res> {
  factory $PromotionalDetailsCopyWith(
    PromotionalDetails value,
    $Res Function(PromotionalDetails) then,
  ) = _$PromotionalDetailsCopyWithImpl<$Res, PromotionalDetails>;
  @useResult
  $Res call({
    String? mainOffer,
    String? subtitle,
    String? highlightText,
    String? callToAction,
  });
}

/// @nodoc
class _$PromotionalDetailsCopyWithImpl<$Res, $Val extends PromotionalDetails>
    implements $PromotionalDetailsCopyWith<$Res> {
  _$PromotionalDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromotionalDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainOffer = freezed,
    Object? subtitle = freezed,
    Object? highlightText = freezed,
    Object? callToAction = freezed,
  }) {
    return _then(
      _value.copyWith(
            mainOffer: freezed == mainOffer
                ? _value.mainOffer
                : mainOffer // ignore: cast_nullable_to_non_nullable
                      as String?,
            subtitle: freezed == subtitle
                ? _value.subtitle
                : subtitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            highlightText: freezed == highlightText
                ? _value.highlightText
                : highlightText // ignore: cast_nullable_to_non_nullable
                      as String?,
            callToAction: freezed == callToAction
                ? _value.callToAction
                : callToAction // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PromotionalDetailsImplCopyWith<$Res>
    implements $PromotionalDetailsCopyWith<$Res> {
  factory _$$PromotionalDetailsImplCopyWith(
    _$PromotionalDetailsImpl value,
    $Res Function(_$PromotionalDetailsImpl) then,
  ) = __$$PromotionalDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? mainOffer,
    String? subtitle,
    String? highlightText,
    String? callToAction,
  });
}

/// @nodoc
class __$$PromotionalDetailsImplCopyWithImpl<$Res>
    extends _$PromotionalDetailsCopyWithImpl<$Res, _$PromotionalDetailsImpl>
    implements _$$PromotionalDetailsImplCopyWith<$Res> {
  __$$PromotionalDetailsImplCopyWithImpl(
    _$PromotionalDetailsImpl _value,
    $Res Function(_$PromotionalDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PromotionalDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainOffer = freezed,
    Object? subtitle = freezed,
    Object? highlightText = freezed,
    Object? callToAction = freezed,
  }) {
    return _then(
      _$PromotionalDetailsImpl(
        mainOffer: freezed == mainOffer
            ? _value.mainOffer
            : mainOffer // ignore: cast_nullable_to_non_nullable
                  as String?,
        subtitle: freezed == subtitle
            ? _value.subtitle
            : subtitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        highlightText: freezed == highlightText
            ? _value.highlightText
            : highlightText // ignore: cast_nullable_to_non_nullable
                  as String?,
        callToAction: freezed == callToAction
            ? _value.callToAction
            : callToAction // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PromotionalDetailsImpl implements _PromotionalDetails {
  const _$PromotionalDetailsImpl({
    this.mainOffer,
    this.subtitle,
    this.highlightText,
    this.callToAction,
  });

  factory _$PromotionalDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromotionalDetailsImplFromJson(json);

  @override
  final String? mainOffer;
  @override
  final String? subtitle;
  @override
  final String? highlightText;
  @override
  final String? callToAction;

  @override
  String toString() {
    return 'PromotionalDetails(mainOffer: $mainOffer, subtitle: $subtitle, highlightText: $highlightText, callToAction: $callToAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromotionalDetailsImpl &&
            (identical(other.mainOffer, mainOffer) ||
                other.mainOffer == mainOffer) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.highlightText, highlightText) ||
                other.highlightText == highlightText) &&
            (identical(other.callToAction, callToAction) ||
                other.callToAction == callToAction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    mainOffer,
    subtitle,
    highlightText,
    callToAction,
  );

  /// Create a copy of PromotionalDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromotionalDetailsImplCopyWith<_$PromotionalDetailsImpl> get copyWith =>
      __$$PromotionalDetailsImplCopyWithImpl<_$PromotionalDetailsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PromotionalDetailsImplToJson(this);
  }
}

abstract class _PromotionalDetails implements PromotionalDetails {
  const factory _PromotionalDetails({
    final String? mainOffer,
    final String? subtitle,
    final String? highlightText,
    final String? callToAction,
  }) = _$PromotionalDetailsImpl;

  factory _PromotionalDetails.fromJson(Map<String, dynamic> json) =
      _$PromotionalDetailsImpl.fromJson;

  @override
  String? get mainOffer;
  @override
  String? get subtitle;
  @override
  String? get highlightText;
  @override
  String? get callToAction;

  /// Create a copy of PromotionalDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromotionalDetailsImplCopyWith<_$PromotionalDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DisplayInfo _$DisplayInfoFromJson(Map<String, dynamic> json) {
  return _DisplayInfo.fromJson(json);
}

/// @nodoc
mixin _$DisplayInfo {
  String? get mainOffer => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String? get highlightText => throw _privateConstructorUsedError;
  String? get callToAction => throw _privateConstructorUsedError;
  List<String>? get conditionsList => throw _privateConstructorUsedError;
  List<String>? get termsList => throw _privateConstructorUsedError;
  String? get timeInfo => throw _privateConstructorUsedError;
  OutletInfo? get outletDetails => throw _privateConstructorUsedError;
  Images? get images => throw _privateConstructorUsedError;
  AvailabilityInfo? get availabilityInfo => throw _privateConstructorUsedError;

  /// Serializes this DisplayInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DisplayInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DisplayInfoCopyWith<DisplayInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisplayInfoCopyWith<$Res> {
  factory $DisplayInfoCopyWith(
    DisplayInfo value,
    $Res Function(DisplayInfo) then,
  ) = _$DisplayInfoCopyWithImpl<$Res, DisplayInfo>;
  @useResult
  $Res call({
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
  });

  $OutletInfoCopyWith<$Res>? get outletDetails;
  $ImagesCopyWith<$Res>? get images;
  $AvailabilityInfoCopyWith<$Res>? get availabilityInfo;
}

/// @nodoc
class _$DisplayInfoCopyWithImpl<$Res, $Val extends DisplayInfo>
    implements $DisplayInfoCopyWith<$Res> {
  _$DisplayInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DisplayInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainOffer = freezed,
    Object? subtitle = freezed,
    Object? highlightText = freezed,
    Object? callToAction = freezed,
    Object? conditionsList = freezed,
    Object? termsList = freezed,
    Object? timeInfo = freezed,
    Object? outletDetails = freezed,
    Object? images = freezed,
    Object? availabilityInfo = freezed,
  }) {
    return _then(
      _value.copyWith(
            mainOffer: freezed == mainOffer
                ? _value.mainOffer
                : mainOffer // ignore: cast_nullable_to_non_nullable
                      as String?,
            subtitle: freezed == subtitle
                ? _value.subtitle
                : subtitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            highlightText: freezed == highlightText
                ? _value.highlightText
                : highlightText // ignore: cast_nullable_to_non_nullable
                      as String?,
            callToAction: freezed == callToAction
                ? _value.callToAction
                : callToAction // ignore: cast_nullable_to_non_nullable
                      as String?,
            conditionsList: freezed == conditionsList
                ? _value.conditionsList
                : conditionsList // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            termsList: freezed == termsList
                ? _value.termsList
                : termsList // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            timeInfo: freezed == timeInfo
                ? _value.timeInfo
                : timeInfo // ignore: cast_nullable_to_non_nullable
                      as String?,
            outletDetails: freezed == outletDetails
                ? _value.outletDetails
                : outletDetails // ignore: cast_nullable_to_non_nullable
                      as OutletInfo?,
            images: freezed == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                      as Images?,
            availabilityInfo: freezed == availabilityInfo
                ? _value.availabilityInfo
                : availabilityInfo // ignore: cast_nullable_to_non_nullable
                      as AvailabilityInfo?,
          )
          as $Val,
    );
  }

  /// Create a copy of DisplayInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutletInfoCopyWith<$Res>? get outletDetails {
    if (_value.outletDetails == null) {
      return null;
    }

    return $OutletInfoCopyWith<$Res>(_value.outletDetails!, (value) {
      return _then(_value.copyWith(outletDetails: value) as $Val);
    });
  }

  /// Create a copy of DisplayInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImagesCopyWith<$Res>? get images {
    if (_value.images == null) {
      return null;
    }

    return $ImagesCopyWith<$Res>(_value.images!, (value) {
      return _then(_value.copyWith(images: value) as $Val);
    });
  }

  /// Create a copy of DisplayInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AvailabilityInfoCopyWith<$Res>? get availabilityInfo {
    if (_value.availabilityInfo == null) {
      return null;
    }

    return $AvailabilityInfoCopyWith<$Res>(_value.availabilityInfo!, (value) {
      return _then(_value.copyWith(availabilityInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DisplayInfoImplCopyWith<$Res>
    implements $DisplayInfoCopyWith<$Res> {
  factory _$$DisplayInfoImplCopyWith(
    _$DisplayInfoImpl value,
    $Res Function(_$DisplayInfoImpl) then,
  ) = __$$DisplayInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
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
  });

  @override
  $OutletInfoCopyWith<$Res>? get outletDetails;
  @override
  $ImagesCopyWith<$Res>? get images;
  @override
  $AvailabilityInfoCopyWith<$Res>? get availabilityInfo;
}

/// @nodoc
class __$$DisplayInfoImplCopyWithImpl<$Res>
    extends _$DisplayInfoCopyWithImpl<$Res, _$DisplayInfoImpl>
    implements _$$DisplayInfoImplCopyWith<$Res> {
  __$$DisplayInfoImplCopyWithImpl(
    _$DisplayInfoImpl _value,
    $Res Function(_$DisplayInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DisplayInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainOffer = freezed,
    Object? subtitle = freezed,
    Object? highlightText = freezed,
    Object? callToAction = freezed,
    Object? conditionsList = freezed,
    Object? termsList = freezed,
    Object? timeInfo = freezed,
    Object? outletDetails = freezed,
    Object? images = freezed,
    Object? availabilityInfo = freezed,
  }) {
    return _then(
      _$DisplayInfoImpl(
        mainOffer: freezed == mainOffer
            ? _value.mainOffer
            : mainOffer // ignore: cast_nullable_to_non_nullable
                  as String?,
        subtitle: freezed == subtitle
            ? _value.subtitle
            : subtitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        highlightText: freezed == highlightText
            ? _value.highlightText
            : highlightText // ignore: cast_nullable_to_non_nullable
                  as String?,
        callToAction: freezed == callToAction
            ? _value.callToAction
            : callToAction // ignore: cast_nullable_to_non_nullable
                  as String?,
        conditionsList: freezed == conditionsList
            ? _value._conditionsList
            : conditionsList // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        termsList: freezed == termsList
            ? _value._termsList
            : termsList // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        timeInfo: freezed == timeInfo
            ? _value.timeInfo
            : timeInfo // ignore: cast_nullable_to_non_nullable
                  as String?,
        outletDetails: freezed == outletDetails
            ? _value.outletDetails
            : outletDetails // ignore: cast_nullable_to_non_nullable
                  as OutletInfo?,
        images: freezed == images
            ? _value.images
            : images // ignore: cast_nullable_to_non_nullable
                  as Images?,
        availabilityInfo: freezed == availabilityInfo
            ? _value.availabilityInfo
            : availabilityInfo // ignore: cast_nullable_to_non_nullable
                  as AvailabilityInfo?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DisplayInfoImpl implements _DisplayInfo {
  const _$DisplayInfoImpl({
    this.mainOffer,
    this.subtitle,
    this.highlightText,
    this.callToAction,
    final List<String>? conditionsList,
    final List<String>? termsList,
    this.timeInfo,
    this.outletDetails,
    this.images,
    this.availabilityInfo,
  }) : _conditionsList = conditionsList,
       _termsList = termsList;

  factory _$DisplayInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DisplayInfoImplFromJson(json);

  @override
  final String? mainOffer;
  @override
  final String? subtitle;
  @override
  final String? highlightText;
  @override
  final String? callToAction;
  final List<String>? _conditionsList;
  @override
  List<String>? get conditionsList {
    final value = _conditionsList;
    if (value == null) return null;
    if (_conditionsList is EqualUnmodifiableListView) return _conditionsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _termsList;
  @override
  List<String>? get termsList {
    final value = _termsList;
    if (value == null) return null;
    if (_termsList is EqualUnmodifiableListView) return _termsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? timeInfo;
  @override
  final OutletInfo? outletDetails;
  @override
  final Images? images;
  @override
  final AvailabilityInfo? availabilityInfo;

  @override
  String toString() {
    return 'DisplayInfo(mainOffer: $mainOffer, subtitle: $subtitle, highlightText: $highlightText, callToAction: $callToAction, conditionsList: $conditionsList, termsList: $termsList, timeInfo: $timeInfo, outletDetails: $outletDetails, images: $images, availabilityInfo: $availabilityInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisplayInfoImpl &&
            (identical(other.mainOffer, mainOffer) ||
                other.mainOffer == mainOffer) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.highlightText, highlightText) ||
                other.highlightText == highlightText) &&
            (identical(other.callToAction, callToAction) ||
                other.callToAction == callToAction) &&
            const DeepCollectionEquality().equals(
              other._conditionsList,
              _conditionsList,
            ) &&
            const DeepCollectionEquality().equals(
              other._termsList,
              _termsList,
            ) &&
            (identical(other.timeInfo, timeInfo) ||
                other.timeInfo == timeInfo) &&
            (identical(other.outletDetails, outletDetails) ||
                other.outletDetails == outletDetails) &&
            (identical(other.images, images) || other.images == images) &&
            (identical(other.availabilityInfo, availabilityInfo) ||
                other.availabilityInfo == availabilityInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    mainOffer,
    subtitle,
    highlightText,
    callToAction,
    const DeepCollectionEquality().hash(_conditionsList),
    const DeepCollectionEquality().hash(_termsList),
    timeInfo,
    outletDetails,
    images,
    availabilityInfo,
  );

  /// Create a copy of DisplayInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DisplayInfoImplCopyWith<_$DisplayInfoImpl> get copyWith =>
      __$$DisplayInfoImplCopyWithImpl<_$DisplayInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DisplayInfoImplToJson(this);
  }
}

abstract class _DisplayInfo implements DisplayInfo {
  const factory _DisplayInfo({
    final String? mainOffer,
    final String? subtitle,
    final String? highlightText,
    final String? callToAction,
    final List<String>? conditionsList,
    final List<String>? termsList,
    final String? timeInfo,
    final OutletInfo? outletDetails,
    final Images? images,
    final AvailabilityInfo? availabilityInfo,
  }) = _$DisplayInfoImpl;

  factory _DisplayInfo.fromJson(Map<String, dynamic> json) =
      _$DisplayInfoImpl.fromJson;

  @override
  String? get mainOffer;
  @override
  String? get subtitle;
  @override
  String? get highlightText;
  @override
  String? get callToAction;
  @override
  List<String>? get conditionsList;
  @override
  List<String>? get termsList;
  @override
  String? get timeInfo;
  @override
  OutletInfo? get outletDetails;
  @override
  Images? get images;
  @override
  AvailabilityInfo? get availabilityInfo;

  /// Create a copy of DisplayInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DisplayInfoImplCopyWith<_$DisplayInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AvailabilityInfo _$AvailabilityInfoFromJson(Map<String, dynamic> json) {
  return _AvailabilityInfo.fromJson(json);
}

/// @nodoc
mixin _$AvailabilityInfo {
  bool? get isAvailable => throw _privateConstructorUsedError;
  int? get remainingUses => throw _privateConstructorUsedError;
  DateTime? get expiryDate => throw _privateConstructorUsedError;
  bool? get isExpired => throw _privateConstructorUsedError;

  /// Serializes this AvailabilityInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvailabilityInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailabilityInfoCopyWith<AvailabilityInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailabilityInfoCopyWith<$Res> {
  factory $AvailabilityInfoCopyWith(
    AvailabilityInfo value,
    $Res Function(AvailabilityInfo) then,
  ) = _$AvailabilityInfoCopyWithImpl<$Res, AvailabilityInfo>;
  @useResult
  $Res call({
    bool? isAvailable,
    int? remainingUses,
    DateTime? expiryDate,
    bool? isExpired,
  });
}

/// @nodoc
class _$AvailabilityInfoCopyWithImpl<$Res, $Val extends AvailabilityInfo>
    implements $AvailabilityInfoCopyWith<$Res> {
  _$AvailabilityInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailabilityInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAvailable = freezed,
    Object? remainingUses = freezed,
    Object? expiryDate = freezed,
    Object? isExpired = freezed,
  }) {
    return _then(
      _value.copyWith(
            isAvailable: freezed == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool?,
            remainingUses: freezed == remainingUses
                ? _value.remainingUses
                : remainingUses // ignore: cast_nullable_to_non_nullable
                      as int?,
            expiryDate: freezed == expiryDate
                ? _value.expiryDate
                : expiryDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            isExpired: freezed == isExpired
                ? _value.isExpired
                : isExpired // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AvailabilityInfoImplCopyWith<$Res>
    implements $AvailabilityInfoCopyWith<$Res> {
  factory _$$AvailabilityInfoImplCopyWith(
    _$AvailabilityInfoImpl value,
    $Res Function(_$AvailabilityInfoImpl) then,
  ) = __$$AvailabilityInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool? isAvailable,
    int? remainingUses,
    DateTime? expiryDate,
    bool? isExpired,
  });
}

/// @nodoc
class __$$AvailabilityInfoImplCopyWithImpl<$Res>
    extends _$AvailabilityInfoCopyWithImpl<$Res, _$AvailabilityInfoImpl>
    implements _$$AvailabilityInfoImplCopyWith<$Res> {
  __$$AvailabilityInfoImplCopyWithImpl(
    _$AvailabilityInfoImpl _value,
    $Res Function(_$AvailabilityInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AvailabilityInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAvailable = freezed,
    Object? remainingUses = freezed,
    Object? expiryDate = freezed,
    Object? isExpired = freezed,
  }) {
    return _then(
      _$AvailabilityInfoImpl(
        isAvailable: freezed == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool?,
        remainingUses: freezed == remainingUses
            ? _value.remainingUses
            : remainingUses // ignore: cast_nullable_to_non_nullable
                  as int?,
        expiryDate: freezed == expiryDate
            ? _value.expiryDate
            : expiryDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isExpired: freezed == isExpired
            ? _value.isExpired
            : isExpired // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailabilityInfoImpl implements _AvailabilityInfo {
  const _$AvailabilityInfoImpl({
    this.isAvailable,
    this.remainingUses,
    this.expiryDate,
    this.isExpired,
  });

  factory _$AvailabilityInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailabilityInfoImplFromJson(json);

  @override
  final bool? isAvailable;
  @override
  final int? remainingUses;
  @override
  final DateTime? expiryDate;
  @override
  final bool? isExpired;

  @override
  String toString() {
    return 'AvailabilityInfo(isAvailable: $isAvailable, remainingUses: $remainingUses, expiryDate: $expiryDate, isExpired: $isExpired)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailabilityInfoImpl &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.remainingUses, remainingUses) ||
                other.remainingUses == remainingUses) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.isExpired, isExpired) ||
                other.isExpired == isExpired));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    isAvailable,
    remainingUses,
    expiryDate,
    isExpired,
  );

  /// Create a copy of AvailabilityInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailabilityInfoImplCopyWith<_$AvailabilityInfoImpl> get copyWith =>
      __$$AvailabilityInfoImplCopyWithImpl<_$AvailabilityInfoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailabilityInfoImplToJson(this);
  }
}

abstract class _AvailabilityInfo implements AvailabilityInfo {
  const factory _AvailabilityInfo({
    final bool? isAvailable,
    final int? remainingUses,
    final DateTime? expiryDate,
    final bool? isExpired,
  }) = _$AvailabilityInfoImpl;

  factory _AvailabilityInfo.fromJson(Map<String, dynamic> json) =
      _$AvailabilityInfoImpl.fromJson;

  @override
  bool? get isAvailable;
  @override
  int? get remainingUses;
  @override
  DateTime? get expiryDate;
  @override
  bool? get isExpired;

  /// Create a copy of AvailabilityInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailabilityInfoImplCopyWith<_$AvailabilityInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
