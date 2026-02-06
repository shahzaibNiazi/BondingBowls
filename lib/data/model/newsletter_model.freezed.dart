// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'newsletter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AveragePrice _$AveragePriceFromJson(Map<String, dynamic> json) {
  return _AveragePrice.fromJson(json);
}

/// @nodoc
mixin _$AveragePrice {
  int? get min => throw _privateConstructorUsedError;
  int? get max => throw _privateConstructorUsedError;

  /// Serializes this AveragePrice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AveragePrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AveragePriceCopyWith<AveragePrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AveragePriceCopyWith<$Res> {
  factory $AveragePriceCopyWith(
    AveragePrice value,
    $Res Function(AveragePrice) then,
  ) = _$AveragePriceCopyWithImpl<$Res, AveragePrice>;
  @useResult
  $Res call({int? min, int? max});
}

/// @nodoc
class _$AveragePriceCopyWithImpl<$Res, $Val extends AveragePrice>
    implements $AveragePriceCopyWith<$Res> {
  _$AveragePriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AveragePrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? min = freezed, Object? max = freezed}) {
    return _then(
      _value.copyWith(
            min: freezed == min
                ? _value.min
                : min // ignore: cast_nullable_to_non_nullable
                      as int?,
            max: freezed == max
                ? _value.max
                : max // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AveragePriceImplCopyWith<$Res>
    implements $AveragePriceCopyWith<$Res> {
  factory _$$AveragePriceImplCopyWith(
    _$AveragePriceImpl value,
    $Res Function(_$AveragePriceImpl) then,
  ) = __$$AveragePriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? min, int? max});
}

/// @nodoc
class __$$AveragePriceImplCopyWithImpl<$Res>
    extends _$AveragePriceCopyWithImpl<$Res, _$AveragePriceImpl>
    implements _$$AveragePriceImplCopyWith<$Res> {
  __$$AveragePriceImplCopyWithImpl(
    _$AveragePriceImpl _value,
    $Res Function(_$AveragePriceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AveragePrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? min = freezed, Object? max = freezed}) {
    return _then(
      _$AveragePriceImpl(
        min: freezed == min
            ? _value.min
            : min // ignore: cast_nullable_to_non_nullable
                  as int?,
        max: freezed == max
            ? _value.max
            : max // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AveragePriceImpl implements _AveragePrice {
  const _$AveragePriceImpl({this.min, this.max});

  factory _$AveragePriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AveragePriceImplFromJson(json);

  @override
  final int? min;
  @override
  final int? max;

  @override
  String toString() {
    return 'AveragePrice(min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AveragePriceImpl &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, min, max);

  /// Create a copy of AveragePrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AveragePriceImplCopyWith<_$AveragePriceImpl> get copyWith =>
      __$$AveragePriceImplCopyWithImpl<_$AveragePriceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AveragePriceImplToJson(this);
  }
}

abstract class _AveragePrice implements AveragePrice {
  const factory _AveragePrice({final int? min, final int? max}) =
      _$AveragePriceImpl;

  factory _AveragePrice.fromJson(Map<String, dynamic> json) =
      _$AveragePriceImpl.fromJson;

  @override
  int? get min;
  @override
  int? get max;

  /// Create a copy of AveragePrice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AveragePriceImplCopyWith<_$AveragePriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CafeReview _$CafeReviewFromJson(Map<String, dynamic> json) {
  return _CafeReview.fromJson(json);
}

/// @nodoc
mixin _$CafeReview {
  double? get rating => throw _privateConstructorUsedError;
  int? get reviewCount => throw _privateConstructorUsedError;
  String? get reviewText => throw _privateConstructorUsedError;

  /// Serializes this CafeReview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CafeReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CafeReviewCopyWith<CafeReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CafeReviewCopyWith<$Res> {
  factory $CafeReviewCopyWith(
    CafeReview value,
    $Res Function(CafeReview) then,
  ) = _$CafeReviewCopyWithImpl<$Res, CafeReview>;
  @useResult
  $Res call({double? rating, int? reviewCount, String? reviewText});
}

/// @nodoc
class _$CafeReviewCopyWithImpl<$Res, $Val extends CafeReview>
    implements $CafeReviewCopyWith<$Res> {
  _$CafeReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CafeReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = freezed,
    Object? reviewCount = freezed,
    Object? reviewText = freezed,
  }) {
    return _then(
      _value.copyWith(
            rating: freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double?,
            reviewCount: freezed == reviewCount
                ? _value.reviewCount
                : reviewCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            reviewText: freezed == reviewText
                ? _value.reviewText
                : reviewText // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CafeReviewImplCopyWith<$Res>
    implements $CafeReviewCopyWith<$Res> {
  factory _$$CafeReviewImplCopyWith(
    _$CafeReviewImpl value,
    $Res Function(_$CafeReviewImpl) then,
  ) = __$$CafeReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? rating, int? reviewCount, String? reviewText});
}

/// @nodoc
class __$$CafeReviewImplCopyWithImpl<$Res>
    extends _$CafeReviewCopyWithImpl<$Res, _$CafeReviewImpl>
    implements _$$CafeReviewImplCopyWith<$Res> {
  __$$CafeReviewImplCopyWithImpl(
    _$CafeReviewImpl _value,
    $Res Function(_$CafeReviewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CafeReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = freezed,
    Object? reviewCount = freezed,
    Object? reviewText = freezed,
  }) {
    return _then(
      _$CafeReviewImpl(
        rating: freezed == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double?,
        reviewCount: freezed == reviewCount
            ? _value.reviewCount
            : reviewCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        reviewText: freezed == reviewText
            ? _value.reviewText
            : reviewText // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CafeReviewImpl implements _CafeReview {
  const _$CafeReviewImpl({this.rating, this.reviewCount, this.reviewText});

  factory _$CafeReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$CafeReviewImplFromJson(json);

  @override
  final double? rating;
  @override
  final int? reviewCount;
  @override
  final String? reviewText;

  @override
  String toString() {
    return 'CafeReview(rating: $rating, reviewCount: $reviewCount, reviewText: $reviewText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CafeReviewImpl &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.reviewText, reviewText) ||
                other.reviewText == reviewText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rating, reviewCount, reviewText);

  /// Create a copy of CafeReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CafeReviewImplCopyWith<_$CafeReviewImpl> get copyWith =>
      __$$CafeReviewImplCopyWithImpl<_$CafeReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CafeReviewImplToJson(this);
  }
}

abstract class _CafeReview implements CafeReview {
  const factory _CafeReview({
    final double? rating,
    final int? reviewCount,
    final String? reviewText,
  }) = _$CafeReviewImpl;

  factory _CafeReview.fromJson(Map<String, dynamic> json) =
      _$CafeReviewImpl.fromJson;

  @override
  double? get rating;
  @override
  int? get reviewCount;
  @override
  String? get reviewText;

  /// Create a copy of CafeReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CafeReviewImplCopyWith<_$CafeReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CafeDetails _$CafeDetailsFromJson(Map<String, dynamic> json) {
  return _CafeDetails.fromJson(json);
}

/// @nodoc
mixin _$CafeDetails {
  CafeReview? get cafeReviews => throw _privateConstructorUsedError;
  String? get cafeName => throw _privateConstructorUsedError;
  String? get cafeDescription => throw _privateConstructorUsedError;

  /// Serializes this CafeDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CafeDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CafeDetailsCopyWith<CafeDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CafeDetailsCopyWith<$Res> {
  factory $CafeDetailsCopyWith(
    CafeDetails value,
    $Res Function(CafeDetails) then,
  ) = _$CafeDetailsCopyWithImpl<$Res, CafeDetails>;
  @useResult
  $Res call({
    CafeReview? cafeReviews,
    String? cafeName,
    String? cafeDescription,
  });

  $CafeReviewCopyWith<$Res>? get cafeReviews;
}

/// @nodoc
class _$CafeDetailsCopyWithImpl<$Res, $Val extends CafeDetails>
    implements $CafeDetailsCopyWith<$Res> {
  _$CafeDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CafeDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cafeReviews = freezed,
    Object? cafeName = freezed,
    Object? cafeDescription = freezed,
  }) {
    return _then(
      _value.copyWith(
            cafeReviews: freezed == cafeReviews
                ? _value.cafeReviews
                : cafeReviews // ignore: cast_nullable_to_non_nullable
                      as CafeReview?,
            cafeName: freezed == cafeName
                ? _value.cafeName
                : cafeName // ignore: cast_nullable_to_non_nullable
                      as String?,
            cafeDescription: freezed == cafeDescription
                ? _value.cafeDescription
                : cafeDescription // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of CafeDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CafeReviewCopyWith<$Res>? get cafeReviews {
    if (_value.cafeReviews == null) {
      return null;
    }

    return $CafeReviewCopyWith<$Res>(_value.cafeReviews!, (value) {
      return _then(_value.copyWith(cafeReviews: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CafeDetailsImplCopyWith<$Res>
    implements $CafeDetailsCopyWith<$Res> {
  factory _$$CafeDetailsImplCopyWith(
    _$CafeDetailsImpl value,
    $Res Function(_$CafeDetailsImpl) then,
  ) = __$$CafeDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CafeReview? cafeReviews,
    String? cafeName,
    String? cafeDescription,
  });

  @override
  $CafeReviewCopyWith<$Res>? get cafeReviews;
}

/// @nodoc
class __$$CafeDetailsImplCopyWithImpl<$Res>
    extends _$CafeDetailsCopyWithImpl<$Res, _$CafeDetailsImpl>
    implements _$$CafeDetailsImplCopyWith<$Res> {
  __$$CafeDetailsImplCopyWithImpl(
    _$CafeDetailsImpl _value,
    $Res Function(_$CafeDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CafeDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cafeReviews = freezed,
    Object? cafeName = freezed,
    Object? cafeDescription = freezed,
  }) {
    return _then(
      _$CafeDetailsImpl(
        cafeReviews: freezed == cafeReviews
            ? _value.cafeReviews
            : cafeReviews // ignore: cast_nullable_to_non_nullable
                  as CafeReview?,
        cafeName: freezed == cafeName
            ? _value.cafeName
            : cafeName // ignore: cast_nullable_to_non_nullable
                  as String?,
        cafeDescription: freezed == cafeDescription
            ? _value.cafeDescription
            : cafeDescription // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CafeDetailsImpl implements _CafeDetails {
  const _$CafeDetailsImpl({
    this.cafeReviews,
    this.cafeName,
    this.cafeDescription,
  });

  factory _$CafeDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CafeDetailsImplFromJson(json);

  @override
  final CafeReview? cafeReviews;
  @override
  final String? cafeName;
  @override
  final String? cafeDescription;

  @override
  String toString() {
    return 'CafeDetails(cafeReviews: $cafeReviews, cafeName: $cafeName, cafeDescription: $cafeDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CafeDetailsImpl &&
            (identical(other.cafeReviews, cafeReviews) ||
                other.cafeReviews == cafeReviews) &&
            (identical(other.cafeName, cafeName) ||
                other.cafeName == cafeName) &&
            (identical(other.cafeDescription, cafeDescription) ||
                other.cafeDescription == cafeDescription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, cafeReviews, cafeName, cafeDescription);

  /// Create a copy of CafeDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CafeDetailsImplCopyWith<_$CafeDetailsImpl> get copyWith =>
      __$$CafeDetailsImplCopyWithImpl<_$CafeDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CafeDetailsImplToJson(this);
  }
}

abstract class _CafeDetails implements CafeDetails {
  const factory _CafeDetails({
    final CafeReview? cafeReviews,
    final String? cafeName,
    final String? cafeDescription,
  }) = _$CafeDetailsImpl;

  factory _CafeDetails.fromJson(Map<String, dynamic> json) =
      _$CafeDetailsImpl.fromJson;

  @override
  CafeReview? get cafeReviews;
  @override
  String? get cafeName;
  @override
  String? get cafeDescription;

  /// Create a copy of CafeDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CafeDetailsImplCopyWith<_$CafeDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OperatingHour _$OperatingHourFromJson(Map<String, dynamic> json) {
  return _OperatingHour.fromJson(json);
}

/// @nodoc
mixin _$OperatingHour {
  String? get day => throw _privateConstructorUsedError;
  String? get opening => throw _privateConstructorUsedError;
  String? get closing => throw _privateConstructorUsedError;
  bool get isClosed => throw _privateConstructorUsedError;

  /// Serializes this OperatingHour to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OperatingHour
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OperatingHourCopyWith<OperatingHour> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperatingHourCopyWith<$Res> {
  factory $OperatingHourCopyWith(
    OperatingHour value,
    $Res Function(OperatingHour) then,
  ) = _$OperatingHourCopyWithImpl<$Res, OperatingHour>;
  @useResult
  $Res call({String? day, String? opening, String? closing, bool isClosed});
}

/// @nodoc
class _$OperatingHourCopyWithImpl<$Res, $Val extends OperatingHour>
    implements $OperatingHourCopyWith<$Res> {
  _$OperatingHourCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OperatingHour
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? opening = freezed,
    Object? closing = freezed,
    Object? isClosed = null,
  }) {
    return _then(
      _value.copyWith(
            day: freezed == day
                ? _value.day
                : day // ignore: cast_nullable_to_non_nullable
                      as String?,
            opening: freezed == opening
                ? _value.opening
                : opening // ignore: cast_nullable_to_non_nullable
                      as String?,
            closing: freezed == closing
                ? _value.closing
                : closing // ignore: cast_nullable_to_non_nullable
                      as String?,
            isClosed: null == isClosed
                ? _value.isClosed
                : isClosed // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OperatingHourImplCopyWith<$Res>
    implements $OperatingHourCopyWith<$Res> {
  factory _$$OperatingHourImplCopyWith(
    _$OperatingHourImpl value,
    $Res Function(_$OperatingHourImpl) then,
  ) = __$$OperatingHourImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? day, String? opening, String? closing, bool isClosed});
}

/// @nodoc
class __$$OperatingHourImplCopyWithImpl<$Res>
    extends _$OperatingHourCopyWithImpl<$Res, _$OperatingHourImpl>
    implements _$$OperatingHourImplCopyWith<$Res> {
  __$$OperatingHourImplCopyWithImpl(
    _$OperatingHourImpl _value,
    $Res Function(_$OperatingHourImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OperatingHour
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? opening = freezed,
    Object? closing = freezed,
    Object? isClosed = null,
  }) {
    return _then(
      _$OperatingHourImpl(
        day: freezed == day
            ? _value.day
            : day // ignore: cast_nullable_to_non_nullable
                  as String?,
        opening: freezed == opening
            ? _value.opening
            : opening // ignore: cast_nullable_to_non_nullable
                  as String?,
        closing: freezed == closing
            ? _value.closing
            : closing // ignore: cast_nullable_to_non_nullable
                  as String?,
        isClosed: null == isClosed
            ? _value.isClosed
            : isClosed // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OperatingHourImpl implements _OperatingHour {
  const _$OperatingHourImpl({
    this.day,
    this.opening,
    this.closing,
    this.isClosed = false,
  });

  factory _$OperatingHourImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperatingHourImplFromJson(json);

  @override
  final String? day;
  @override
  final String? opening;
  @override
  final String? closing;
  @override
  @JsonKey()
  final bool isClosed;

  @override
  String toString() {
    return 'OperatingHour(day: $day, opening: $opening, closing: $closing, isClosed: $isClosed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperatingHourImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.opening, opening) || other.opening == opening) &&
            (identical(other.closing, closing) || other.closing == closing) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, day, opening, closing, isClosed);

  /// Create a copy of OperatingHour
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OperatingHourImplCopyWith<_$OperatingHourImpl> get copyWith =>
      __$$OperatingHourImplCopyWithImpl<_$OperatingHourImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OperatingHourImplToJson(this);
  }
}

abstract class _OperatingHour implements OperatingHour {
  const factory _OperatingHour({
    final String? day,
    final String? opening,
    final String? closing,
    final bool isClosed,
  }) = _$OperatingHourImpl;

  factory _OperatingHour.fromJson(Map<String, dynamic> json) =
      _$OperatingHourImpl.fromJson;

  @override
  String? get day;
  @override
  String? get opening;
  @override
  String? get closing;
  @override
  bool get isClosed;

  /// Create a copy of OperatingHour
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OperatingHourImplCopyWith<_$OperatingHourImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MediaAddition _$MediaAdditionFromJson(Map<String, dynamic> json) {
  return _MediaAddition.fromJson(json);
}

/// @nodoc
mixin _$MediaAddition {
  String? get type => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;

  /// Serializes this MediaAddition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaAddition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaAdditionCopyWith<MediaAddition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaAdditionCopyWith<$Res> {
  factory $MediaAdditionCopyWith(
    MediaAddition value,
    $Res Function(MediaAddition) then,
  ) = _$MediaAdditionCopyWithImpl<$Res, MediaAddition>;
  @useResult
  $Res call({String? type, String? content, int? order});
}

/// @nodoc
class _$MediaAdditionCopyWithImpl<$Res, $Val extends MediaAddition>
    implements $MediaAdditionCopyWith<$Res> {
  _$MediaAdditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaAddition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? content = freezed,
    Object? order = freezed,
  }) {
    return _then(
      _value.copyWith(
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            content: freezed == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String?,
            order: freezed == order
                ? _value.order
                : order // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MediaAdditionImplCopyWith<$Res>
    implements $MediaAdditionCopyWith<$Res> {
  factory _$$MediaAdditionImplCopyWith(
    _$MediaAdditionImpl value,
    $Res Function(_$MediaAdditionImpl) then,
  ) = __$$MediaAdditionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? type, String? content, int? order});
}

/// @nodoc
class __$$MediaAdditionImplCopyWithImpl<$Res>
    extends _$MediaAdditionCopyWithImpl<$Res, _$MediaAdditionImpl>
    implements _$$MediaAdditionImplCopyWith<$Res> {
  __$$MediaAdditionImplCopyWithImpl(
    _$MediaAdditionImpl _value,
    $Res Function(_$MediaAdditionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MediaAddition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? content = freezed,
    Object? order = freezed,
  }) {
    return _then(
      _$MediaAdditionImpl(
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        content: freezed == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String?,
        order: freezed == order
            ? _value.order
            : order // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaAdditionImpl implements _MediaAddition {
  const _$MediaAdditionImpl({this.type, this.content, this.order});

  factory _$MediaAdditionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaAdditionImplFromJson(json);

  @override
  final String? type;
  @override
  final String? content;
  @override
  final int? order;

  @override
  String toString() {
    return 'MediaAddition(type: $type, content: $content, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaAdditionImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, content, order);

  /// Create a copy of MediaAddition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaAdditionImplCopyWith<_$MediaAdditionImpl> get copyWith =>
      __$$MediaAdditionImplCopyWithImpl<_$MediaAdditionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaAdditionImplToJson(this);
  }
}

abstract class _MediaAddition implements MediaAddition {
  const factory _MediaAddition({
    final String? type,
    final String? content,
    final int? order,
  }) = _$MediaAdditionImpl;

  factory _MediaAddition.fromJson(Map<String, dynamic> json) =
      _$MediaAdditionImpl.fromJson;

  @override
  String? get type;
  @override
  String? get content;
  @override
  int? get order;

  /// Create a copy of MediaAddition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaAdditionImplCopyWith<_$MediaAdditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get secondaryText1 => throw _privateConstructorUsedError;
  String? get locationLink => throw _privateConstructorUsedError;
  String? get displayImage => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  AveragePrice? get averagePrice => throw _privateConstructorUsedError;
  VoucherDetailModel? get voucherDetails => throw _privateConstructorUsedError;
  CafeDetails? get cafeDetails => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  bool get disableViewCount => throw _privateConstructorUsedError;
  int get viewCount => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  List<OperatingHour> get operatingHours => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  List<MediaAddition> get mediaAdditions => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int get v => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Item to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? title,
    String? secondaryText1,
    String? locationLink,
    String? displayImage,
    String? category,
    AveragePrice? averagePrice,
    VoucherDetailModel? voucherDetails,
    CafeDetails? cafeDetails,
    String status,
    bool disableViewCount,
    int viewCount,
    String? location,
    List<OperatingHour> operatingHours,
    List<String> tags,
    bool isDeleted,
    List<MediaAddition> mediaAdditions,
    @JsonKey(name: '__v') int v,
    DateTime? createdAt,
    DateTime? updatedAt,
  });

  $AveragePriceCopyWith<$Res>? get averagePrice;
  $VoucherDetailModelCopyWith<$Res>? get voucherDetails;
  $CafeDetailsCopyWith<$Res>? get cafeDetails;
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? secondaryText1 = freezed,
    Object? locationLink = freezed,
    Object? displayImage = freezed,
    Object? category = freezed,
    Object? averagePrice = freezed,
    Object? voucherDetails = freezed,
    Object? cafeDetails = freezed,
    Object? status = null,
    Object? disableViewCount = null,
    Object? viewCount = null,
    Object? location = freezed,
    Object? operatingHours = null,
    Object? tags = null,
    Object? isDeleted = null,
    Object? mediaAdditions = null,
    Object? v = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            secondaryText1: freezed == secondaryText1
                ? _value.secondaryText1
                : secondaryText1 // ignore: cast_nullable_to_non_nullable
                      as String?,
            locationLink: freezed == locationLink
                ? _value.locationLink
                : locationLink // ignore: cast_nullable_to_non_nullable
                      as String?,
            displayImage: freezed == displayImage
                ? _value.displayImage
                : displayImage // ignore: cast_nullable_to_non_nullable
                      as String?,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
            averagePrice: freezed == averagePrice
                ? _value.averagePrice
                : averagePrice // ignore: cast_nullable_to_non_nullable
                      as AveragePrice?,
            voucherDetails: freezed == voucherDetails
                ? _value.voucherDetails
                : voucherDetails // ignore: cast_nullable_to_non_nullable
                      as VoucherDetailModel?,
            cafeDetails: freezed == cafeDetails
                ? _value.cafeDetails
                : cafeDetails // ignore: cast_nullable_to_non_nullable
                      as CafeDetails?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            disableViewCount: null == disableViewCount
                ? _value.disableViewCount
                : disableViewCount // ignore: cast_nullable_to_non_nullable
                      as bool,
            viewCount: null == viewCount
                ? _value.viewCount
                : viewCount // ignore: cast_nullable_to_non_nullable
                      as int,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            operatingHours: null == operatingHours
                ? _value.operatingHours
                : operatingHours // ignore: cast_nullable_to_non_nullable
                      as List<OperatingHour>,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            isDeleted: null == isDeleted
                ? _value.isDeleted
                : isDeleted // ignore: cast_nullable_to_non_nullable
                      as bool,
            mediaAdditions: null == mediaAdditions
                ? _value.mediaAdditions
                : mediaAdditions // ignore: cast_nullable_to_non_nullable
                      as List<MediaAddition>,
            v: null == v
                ? _value.v
                : v // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AveragePriceCopyWith<$Res>? get averagePrice {
    if (_value.averagePrice == null) {
      return null;
    }

    return $AveragePriceCopyWith<$Res>(_value.averagePrice!, (value) {
      return _then(_value.copyWith(averagePrice: value) as $Val);
    });
  }

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VoucherDetailModelCopyWith<$Res>? get voucherDetails {
    if (_value.voucherDetails == null) {
      return null;
    }

    return $VoucherDetailModelCopyWith<$Res>(_value.voucherDetails!, (value) {
      return _then(_value.copyWith(voucherDetails: value) as $Val);
    });
  }

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CafeDetailsCopyWith<$Res>? get cafeDetails {
    if (_value.cafeDetails == null) {
      return null;
    }

    return $CafeDetailsCopyWith<$Res>(_value.cafeDetails!, (value) {
      return _then(_value.copyWith(cafeDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
    _$ItemImpl value,
    $Res Function(_$ItemImpl) then,
  ) = __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? title,
    String? secondaryText1,
    String? locationLink,
    String? displayImage,
    String? category,
    AveragePrice? averagePrice,
    VoucherDetailModel? voucherDetails,
    CafeDetails? cafeDetails,
    String status,
    bool disableViewCount,
    int viewCount,
    String? location,
    List<OperatingHour> operatingHours,
    List<String> tags,
    bool isDeleted,
    List<MediaAddition> mediaAdditions,
    @JsonKey(name: '__v') int v,
    DateTime? createdAt,
    DateTime? updatedAt,
  });

  @override
  $AveragePriceCopyWith<$Res>? get averagePrice;
  @override
  $VoucherDetailModelCopyWith<$Res>? get voucherDetails;
  @override
  $CafeDetailsCopyWith<$Res>? get cafeDetails;
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
    : super(_value, _then);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? secondaryText1 = freezed,
    Object? locationLink = freezed,
    Object? displayImage = freezed,
    Object? category = freezed,
    Object? averagePrice = freezed,
    Object? voucherDetails = freezed,
    Object? cafeDetails = freezed,
    Object? status = null,
    Object? disableViewCount = null,
    Object? viewCount = null,
    Object? location = freezed,
    Object? operatingHours = null,
    Object? tags = null,
    Object? isDeleted = null,
    Object? mediaAdditions = null,
    Object? v = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$ItemImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        secondaryText1: freezed == secondaryText1
            ? _value.secondaryText1
            : secondaryText1 // ignore: cast_nullable_to_non_nullable
                  as String?,
        locationLink: freezed == locationLink
            ? _value.locationLink
            : locationLink // ignore: cast_nullable_to_non_nullable
                  as String?,
        displayImage: freezed == displayImage
            ? _value.displayImage
            : displayImage // ignore: cast_nullable_to_non_nullable
                  as String?,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
        averagePrice: freezed == averagePrice
            ? _value.averagePrice
            : averagePrice // ignore: cast_nullable_to_non_nullable
                  as AveragePrice?,
        voucherDetails: freezed == voucherDetails
            ? _value.voucherDetails
            : voucherDetails // ignore: cast_nullable_to_non_nullable
                  as VoucherDetailModel?,
        cafeDetails: freezed == cafeDetails
            ? _value.cafeDetails
            : cafeDetails // ignore: cast_nullable_to_non_nullable
                  as CafeDetails?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        disableViewCount: null == disableViewCount
            ? _value.disableViewCount
            : disableViewCount // ignore: cast_nullable_to_non_nullable
                  as bool,
        viewCount: null == viewCount
            ? _value.viewCount
            : viewCount // ignore: cast_nullable_to_non_nullable
                  as int,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        operatingHours: null == operatingHours
            ? _value._operatingHours
            : operatingHours // ignore: cast_nullable_to_non_nullable
                  as List<OperatingHour>,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        isDeleted: null == isDeleted
            ? _value.isDeleted
            : isDeleted // ignore: cast_nullable_to_non_nullable
                  as bool,
        mediaAdditions: null == mediaAdditions
            ? _value._mediaAdditions
            : mediaAdditions // ignore: cast_nullable_to_non_nullable
                  as List<MediaAddition>,
        v: null == v
            ? _value.v
            : v // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl implements _Item {
  const _$ItemImpl({
    @JsonKey(name: '_id') this.id,
    this.title,
    this.secondaryText1,
    this.locationLink,
    this.displayImage,
    this.category,
    this.averagePrice,
    this.voucherDetails,
    this.cafeDetails,
    this.status = 'Enabled',
    this.disableViewCount = false,
    this.viewCount = 0,
    this.location,
    final List<OperatingHour> operatingHours = const [],
    final List<String> tags = const [],
    this.isDeleted = false,
    final List<MediaAddition> mediaAdditions = const [],
    @JsonKey(name: '__v') this.v = 0,
    this.createdAt,
    this.updatedAt,
  }) : _operatingHours = operatingHours,
       _tags = tags,
       _mediaAdditions = mediaAdditions;

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? title;
  @override
  final String? secondaryText1;
  @override
  final String? locationLink;
  @override
  final String? displayImage;
  @override
  final String? category;
  @override
  final AveragePrice? averagePrice;
  @override
  final VoucherDetailModel? voucherDetails;
  @override
  final CafeDetails? cafeDetails;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final bool disableViewCount;
  @override
  @JsonKey()
  final int viewCount;
  @override
  final String? location;
  final List<OperatingHour> _operatingHours;
  @override
  @JsonKey()
  List<OperatingHour> get operatingHours {
    if (_operatingHours is EqualUnmodifiableListView) return _operatingHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_operatingHours);
  }

  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  final bool isDeleted;
  final List<MediaAddition> _mediaAdditions;
  @override
  @JsonKey()
  List<MediaAddition> get mediaAdditions {
    if (_mediaAdditions is EqualUnmodifiableListView) return _mediaAdditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaAdditions);
  }

  @override
  @JsonKey(name: '__v')
  final int v;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Item(id: $id, title: $title, secondaryText1: $secondaryText1, locationLink: $locationLink, displayImage: $displayImage, category: $category, averagePrice: $averagePrice, voucherDetails: $voucherDetails, cafeDetails: $cafeDetails, status: $status, disableViewCount: $disableViewCount, viewCount: $viewCount, location: $location, operatingHours: $operatingHours, tags: $tags, isDeleted: $isDeleted, mediaAdditions: $mediaAdditions, v: $v, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.secondaryText1, secondaryText1) ||
                other.secondaryText1 == secondaryText1) &&
            (identical(other.locationLink, locationLink) ||
                other.locationLink == locationLink) &&
            (identical(other.displayImage, displayImage) ||
                other.displayImage == displayImage) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.averagePrice, averagePrice) ||
                other.averagePrice == averagePrice) &&
            (identical(other.voucherDetails, voucherDetails) ||
                other.voucherDetails == voucherDetails) &&
            (identical(other.cafeDetails, cafeDetails) ||
                other.cafeDetails == cafeDetails) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.disableViewCount, disableViewCount) ||
                other.disableViewCount == disableViewCount) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(
              other._operatingHours,
              _operatingHours,
            ) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            const DeepCollectionEquality().equals(
              other._mediaAdditions,
              _mediaAdditions,
            ) &&
            (identical(other.v, v) || other.v == v) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    title,
    secondaryText1,
    locationLink,
    displayImage,
    category,
    averagePrice,
    voucherDetails,
    cafeDetails,
    status,
    disableViewCount,
    viewCount,
    location,
    const DeepCollectionEquality().hash(_operatingHours),
    const DeepCollectionEquality().hash(_tags),
    isDeleted,
    const DeepCollectionEquality().hash(_mediaAdditions),
    v,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(this);
  }
}

abstract class _Item implements Item {
  const factory _Item({
    @JsonKey(name: '_id') final String? id,
    final String? title,
    final String? secondaryText1,
    final String? locationLink,
    final String? displayImage,
    final String? category,
    final AveragePrice? averagePrice,
    final VoucherDetailModel? voucherDetails,
    final CafeDetails? cafeDetails,
    final String status,
    final bool disableViewCount,
    final int viewCount,
    final String? location,
    final List<OperatingHour> operatingHours,
    final List<String> tags,
    final bool isDeleted,
    final List<MediaAddition> mediaAdditions,
    @JsonKey(name: '__v') final int v,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get title;
  @override
  String? get secondaryText1;
  @override
  String? get locationLink;
  @override
  String? get displayImage;
  @override
  String? get category;
  @override
  AveragePrice? get averagePrice;
  @override
  VoucherDetailModel? get voucherDetails;
  @override
  CafeDetails? get cafeDetails;
  @override
  String get status;
  @override
  bool get disableViewCount;
  @override
  int get viewCount;
  @override
  String? get location;
  @override
  List<OperatingHour> get operatingHours;
  @override
  List<String> get tags;
  @override
  bool get isDeleted;
  @override
  List<MediaAddition> get mediaAdditions;
  @override
  @JsonKey(name: '__v')
  int get v;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) {
  return _CategoryData.fromJson(json);
}

/// @nodoc
mixin _$CategoryData {
  List<Item> get items => throw _privateConstructorUsedError;
  int? get totalCount => throw _privateConstructorUsedError;
  bool? get hasMore => throw _privateConstructorUsedError;

  /// Serializes this CategoryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryDataCopyWith<CategoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDataCopyWith<$Res> {
  factory $CategoryDataCopyWith(
    CategoryData value,
    $Res Function(CategoryData) then,
  ) = _$CategoryDataCopyWithImpl<$Res, CategoryData>;
  @useResult
  $Res call({List<Item> items, int? totalCount, bool? hasMore});
}

/// @nodoc
class _$CategoryDataCopyWithImpl<$Res, $Val extends CategoryData>
    implements $CategoryDataCopyWith<$Res> {
  _$CategoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalCount = freezed,
    Object? hasMore = freezed,
  }) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<Item>,
            totalCount: freezed == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            hasMore: freezed == hasMore
                ? _value.hasMore
                : hasMore // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryDataImplCopyWith<$Res>
    implements $CategoryDataCopyWith<$Res> {
  factory _$$CategoryDataImplCopyWith(
    _$CategoryDataImpl value,
    $Res Function(_$CategoryDataImpl) then,
  ) = __$$CategoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Item> items, int? totalCount, bool? hasMore});
}

/// @nodoc
class __$$CategoryDataImplCopyWithImpl<$Res>
    extends _$CategoryDataCopyWithImpl<$Res, _$CategoryDataImpl>
    implements _$$CategoryDataImplCopyWith<$Res> {
  __$$CategoryDataImplCopyWithImpl(
    _$CategoryDataImpl _value,
    $Res Function(_$CategoryDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalCount = freezed,
    Object? hasMore = freezed,
  }) {
    return _then(
      _$CategoryDataImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<Item>,
        totalCount: freezed == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        hasMore: freezed == hasMore
            ? _value.hasMore
            : hasMore // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryDataImpl implements _CategoryData {
  const _$CategoryDataImpl({
    final List<Item> items = const [],
    this.totalCount,
    this.hasMore,
  }) : _items = items;

  factory _$CategoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryDataImplFromJson(json);

  final List<Item> _items;
  @override
  @JsonKey()
  List<Item> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int? totalCount;
  @override
  final bool? hasMore;

  @override
  String toString() {
    return 'CategoryData(items: $items, totalCount: $totalCount, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryDataImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    totalCount,
    hasMore,
  );

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryDataImplCopyWith<_$CategoryDataImpl> get copyWith =>
      __$$CategoryDataImplCopyWithImpl<_$CategoryDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryDataImplToJson(this);
  }
}

abstract class _CategoryData implements CategoryData {
  const factory _CategoryData({
    final List<Item> items,
    final int? totalCount,
    final bool? hasMore,
  }) = _$CategoryDataImpl;

  factory _CategoryData.fromJson(Map<String, dynamic> json) =
      _$CategoryDataImpl.fromJson;

  @override
  List<Item> get items;
  @override
  int? get totalCount;
  @override
  bool? get hasMore;

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryDataImplCopyWith<_$CategoryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Categories _$CategoriesFromJson(Map<String, dynamic> json) {
  return _Categories.fromJson(json);
}

/// @nodoc
mixin _$Categories {
  @JsonKey(name: 'Food')
  CategoryData? get food => throw _privateConstructorUsedError;
  @JsonKey(name: 'Beverages')
  CategoryData? get beverages => throw _privateConstructorUsedError;
  @JsonKey(name: 'Events')
  CategoryData? get events => throw _privateConstructorUsedError;

  /// Serializes this Categories to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Categories
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoriesCopyWith<Categories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesCopyWith<$Res> {
  factory $CategoriesCopyWith(
    Categories value,
    $Res Function(Categories) then,
  ) = _$CategoriesCopyWithImpl<$Res, Categories>;
  @useResult
  $Res call({
    @JsonKey(name: 'Food') CategoryData? food,
    @JsonKey(name: 'Beverages') CategoryData? beverages,
    @JsonKey(name: 'Events') CategoryData? events,
  });

  $CategoryDataCopyWith<$Res>? get food;
  $CategoryDataCopyWith<$Res>? get beverages;
  $CategoryDataCopyWith<$Res>? get events;
}

/// @nodoc
class _$CategoriesCopyWithImpl<$Res, $Val extends Categories>
    implements $CategoriesCopyWith<$Res> {
  _$CategoriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Categories
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = freezed,
    Object? beverages = freezed,
    Object? events = freezed,
  }) {
    return _then(
      _value.copyWith(
            food: freezed == food
                ? _value.food
                : food // ignore: cast_nullable_to_non_nullable
                      as CategoryData?,
            beverages: freezed == beverages
                ? _value.beverages
                : beverages // ignore: cast_nullable_to_non_nullable
                      as CategoryData?,
            events: freezed == events
                ? _value.events
                : events // ignore: cast_nullable_to_non_nullable
                      as CategoryData?,
          )
          as $Val,
    );
  }

  /// Create a copy of Categories
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryDataCopyWith<$Res>? get food {
    if (_value.food == null) {
      return null;
    }

    return $CategoryDataCopyWith<$Res>(_value.food!, (value) {
      return _then(_value.copyWith(food: value) as $Val);
    });
  }

  /// Create a copy of Categories
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryDataCopyWith<$Res>? get beverages {
    if (_value.beverages == null) {
      return null;
    }

    return $CategoryDataCopyWith<$Res>(_value.beverages!, (value) {
      return _then(_value.copyWith(beverages: value) as $Val);
    });
  }

  /// Create a copy of Categories
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryDataCopyWith<$Res>? get events {
    if (_value.events == null) {
      return null;
    }

    return $CategoryDataCopyWith<$Res>(_value.events!, (value) {
      return _then(_value.copyWith(events: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoriesImplCopyWith<$Res>
    implements $CategoriesCopyWith<$Res> {
  factory _$$CategoriesImplCopyWith(
    _$CategoriesImpl value,
    $Res Function(_$CategoriesImpl) then,
  ) = __$$CategoriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'Food') CategoryData? food,
    @JsonKey(name: 'Beverages') CategoryData? beverages,
    @JsonKey(name: 'Events') CategoryData? events,
  });

  @override
  $CategoryDataCopyWith<$Res>? get food;
  @override
  $CategoryDataCopyWith<$Res>? get beverages;
  @override
  $CategoryDataCopyWith<$Res>? get events;
}

/// @nodoc
class __$$CategoriesImplCopyWithImpl<$Res>
    extends _$CategoriesCopyWithImpl<$Res, _$CategoriesImpl>
    implements _$$CategoriesImplCopyWith<$Res> {
  __$$CategoriesImplCopyWithImpl(
    _$CategoriesImpl _value,
    $Res Function(_$CategoriesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Categories
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = freezed,
    Object? beverages = freezed,
    Object? events = freezed,
  }) {
    return _then(
      _$CategoriesImpl(
        food: freezed == food
            ? _value.food
            : food // ignore: cast_nullable_to_non_nullable
                  as CategoryData?,
        beverages: freezed == beverages
            ? _value.beverages
            : beverages // ignore: cast_nullable_to_non_nullable
                  as CategoryData?,
        events: freezed == events
            ? _value.events
            : events // ignore: cast_nullable_to_non_nullable
                  as CategoryData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoriesImpl implements _Categories {
  const _$CategoriesImpl({
    @JsonKey(name: 'Food') this.food,
    @JsonKey(name: 'Beverages') this.beverages,
    @JsonKey(name: 'Events') this.events,
  });

  factory _$CategoriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoriesImplFromJson(json);

  @override
  @JsonKey(name: 'Food')
  final CategoryData? food;
  @override
  @JsonKey(name: 'Beverages')
  final CategoryData? beverages;
  @override
  @JsonKey(name: 'Events')
  final CategoryData? events;

  @override
  String toString() {
    return 'Categories(food: $food, beverages: $beverages, events: $events)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesImpl &&
            (identical(other.food, food) || other.food == food) &&
            (identical(other.beverages, beverages) ||
                other.beverages == beverages) &&
            (identical(other.events, events) || other.events == events));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, food, beverages, events);

  /// Create a copy of Categories
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesImplCopyWith<_$CategoriesImpl> get copyWith =>
      __$$CategoriesImplCopyWithImpl<_$CategoriesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoriesImplToJson(this);
  }
}

abstract class _Categories implements Categories {
  const factory _Categories({
    @JsonKey(name: 'Food') final CategoryData? food,
    @JsonKey(name: 'Beverages') final CategoryData? beverages,
    @JsonKey(name: 'Events') final CategoryData? events,
  }) = _$CategoriesImpl;

  factory _Categories.fromJson(Map<String, dynamic> json) =
      _$CategoriesImpl.fromJson;

  @override
  @JsonKey(name: 'Food')
  CategoryData? get food;
  @override
  @JsonKey(name: 'Beverages')
  CategoryData? get beverages;
  @override
  @JsonKey(name: 'Events')
  CategoryData? get events;

  /// Create a copy of Categories
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoriesImplCopyWith<_$CategoriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) {
  return _ApiResponse.fromJson(json);
}

/// @nodoc
mixin _$ApiResponse {
  Categories? get categories => throw _privateConstructorUsedError;

  /// Serializes this ApiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiResponseCopyWith<ApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<$Res> {
  factory $ApiResponseCopyWith(
    ApiResponse value,
    $Res Function(ApiResponse) then,
  ) = _$ApiResponseCopyWithImpl<$Res, ApiResponse>;
  @useResult
  $Res call({Categories? categories});

  $CategoriesCopyWith<$Res>? get categories;
}

/// @nodoc
class _$ApiResponseCopyWithImpl<$Res, $Val extends ApiResponse>
    implements $ApiResponseCopyWith<$Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categories = freezed}) {
    return _then(
      _value.copyWith(
            categories: freezed == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as Categories?,
          )
          as $Val,
    );
  }

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoriesCopyWith<$Res>? get categories {
    if (_value.categories == null) {
      return null;
    }

    return $CategoriesCopyWith<$Res>(_value.categories!, (value) {
      return _then(_value.copyWith(categories: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApiResponseImplCopyWith<$Res>
    implements $ApiResponseCopyWith<$Res> {
  factory _$$ApiResponseImplCopyWith(
    _$ApiResponseImpl value,
    $Res Function(_$ApiResponseImpl) then,
  ) = __$$ApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Categories? categories});

  @override
  $CategoriesCopyWith<$Res>? get categories;
}

/// @nodoc
class __$$ApiResponseImplCopyWithImpl<$Res>
    extends _$ApiResponseCopyWithImpl<$Res, _$ApiResponseImpl>
    implements _$$ApiResponseImplCopyWith<$Res> {
  __$$ApiResponseImplCopyWithImpl(
    _$ApiResponseImpl _value,
    $Res Function(_$ApiResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categories = freezed}) {
    return _then(
      _$ApiResponseImpl(
        categories: freezed == categories
            ? _value.categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as Categories?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiResponseImpl implements _ApiResponse {
  const _$ApiResponseImpl({this.categories});

  factory _$ApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiResponseImplFromJson(json);

  @override
  final Categories? categories;

  @override
  String toString() {
    return 'ApiResponse(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseImpl &&
            (identical(other.categories, categories) ||
                other.categories == categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, categories);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseImplCopyWith<_$ApiResponseImpl> get copyWith =>
      __$$ApiResponseImplCopyWithImpl<_$ApiResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiResponseImplToJson(this);
  }
}

abstract class _ApiResponse implements ApiResponse {
  const factory _ApiResponse({final Categories? categories}) =
      _$ApiResponseImpl;

  factory _ApiResponse.fromJson(Map<String, dynamic> json) =
      _$ApiResponseImpl.fromJson;

  @override
  Categories? get categories;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiResponseImplCopyWith<_$ApiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
