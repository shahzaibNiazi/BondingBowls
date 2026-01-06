// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cafeConnect_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CafeModel _$CafeModelFromJson(Map<String, dynamic> json) {
  return _CafeModel.fromJson(json);
}

/// @nodoc
mixin _$CafeModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  int? get averagePrice => throw _privateConstructorUsedError;
  String? get discountCode => throw _privateConstructorUsedError;
  int? get discountPercentage => throw _privateConstructorUsedError;
  int? get discountsGivenOut => throw _privateConstructorUsedError;
  int? get allowedSuccessfulMatches => throw _privateConstructorUsedError;
  bool? get allowDiscountConfiguration => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Location? get location => throw _privateConstructorUsedError;
  Reviews? get reviews => throw _privateConstructorUsedError;
  List<OperatingHour>? get openingHours => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  int? get viewCount => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  String? get dateAdded => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get cafeId => throw _privateConstructorUsedError;
  int? get v => throw _privateConstructorUsedError;

  /// Serializes this CafeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CafeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CafeModelCopyWith<CafeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CafeModelCopyWith<$Res> {
  factory $CafeModelCopyWith(CafeModel value, $Res Function(CafeModel) then) =
      _$CafeModelCopyWithImpl<$Res, CafeModel>;
  @useResult
  $Res call({
    String? id,
    String? name,
    String? email,
    String? category,
    int? averagePrice,
    String? discountCode,
    int? discountPercentage,
    int? discountsGivenOut,
    int? allowedSuccessfulMatches,
    bool? allowDiscountConfiguration,
    String? image,
    String? description,
    Location? location,
    Reviews? reviews,
    List<OperatingHour>? openingHours,
    String? status,
    int? viewCount,
    bool? isDeleted,
    String? dateAdded,
    String? createdAt,
    String? updatedAt,
    String? cafeId,
    int? v,
  });

  $LocationCopyWith<$Res>? get location;
  $ReviewsCopyWith<$Res>? get reviews;
}

/// @nodoc
class _$CafeModelCopyWithImpl<$Res, $Val extends CafeModel>
    implements $CafeModelCopyWith<$Res> {
  _$CafeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CafeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? category = freezed,
    Object? averagePrice = freezed,
    Object? discountCode = freezed,
    Object? discountPercentage = freezed,
    Object? discountsGivenOut = freezed,
    Object? allowedSuccessfulMatches = freezed,
    Object? allowDiscountConfiguration = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? location = freezed,
    Object? reviews = freezed,
    Object? openingHours = freezed,
    Object? status = freezed,
    Object? viewCount = freezed,
    Object? isDeleted = freezed,
    Object? dateAdded = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? cafeId = freezed,
    Object? v = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
            averagePrice: freezed == averagePrice
                ? _value.averagePrice
                : averagePrice // ignore: cast_nullable_to_non_nullable
                      as int?,
            discountCode: freezed == discountCode
                ? _value.discountCode
                : discountCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            discountPercentage: freezed == discountPercentage
                ? _value.discountPercentage
                : discountPercentage // ignore: cast_nullable_to_non_nullable
                      as int?,
            discountsGivenOut: freezed == discountsGivenOut
                ? _value.discountsGivenOut
                : discountsGivenOut // ignore: cast_nullable_to_non_nullable
                      as int?,
            allowedSuccessfulMatches: freezed == allowedSuccessfulMatches
                ? _value.allowedSuccessfulMatches
                : allowedSuccessfulMatches // ignore: cast_nullable_to_non_nullable
                      as int?,
            allowDiscountConfiguration: freezed == allowDiscountConfiguration
                ? _value.allowDiscountConfiguration
                : allowDiscountConfiguration // ignore: cast_nullable_to_non_nullable
                      as bool?,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as Location?,
            reviews: freezed == reviews
                ? _value.reviews
                : reviews // ignore: cast_nullable_to_non_nullable
                      as Reviews?,
            openingHours: freezed == openingHours
                ? _value.openingHours
                : openingHours // ignore: cast_nullable_to_non_nullable
                      as List<OperatingHour>?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            viewCount: freezed == viewCount
                ? _value.viewCount
                : viewCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            isDeleted: freezed == isDeleted
                ? _value.isDeleted
                : isDeleted // ignore: cast_nullable_to_non_nullable
                      as bool?,
            dateAdded: freezed == dateAdded
                ? _value.dateAdded
                : dateAdded // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            cafeId: freezed == cafeId
                ? _value.cafeId
                : cafeId // ignore: cast_nullable_to_non_nullable
                      as String?,
            v: freezed == v
                ? _value.v
                : v // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }

  /// Create a copy of CafeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  /// Create a copy of CafeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewsCopyWith<$Res>? get reviews {
    if (_value.reviews == null) {
      return null;
    }

    return $ReviewsCopyWith<$Res>(_value.reviews!, (value) {
      return _then(_value.copyWith(reviews: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CafeModelImplCopyWith<$Res>
    implements $CafeModelCopyWith<$Res> {
  factory _$$CafeModelImplCopyWith(
    _$CafeModelImpl value,
    $Res Function(_$CafeModelImpl) then,
  ) = __$$CafeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? name,
    String? email,
    String? category,
    int? averagePrice,
    String? discountCode,
    int? discountPercentage,
    int? discountsGivenOut,
    int? allowedSuccessfulMatches,
    bool? allowDiscountConfiguration,
    String? image,
    String? description,
    Location? location,
    Reviews? reviews,
    List<OperatingHour>? openingHours,
    String? status,
    int? viewCount,
    bool? isDeleted,
    String? dateAdded,
    String? createdAt,
    String? updatedAt,
    String? cafeId,
    int? v,
  });

  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $ReviewsCopyWith<$Res>? get reviews;
}

/// @nodoc
class __$$CafeModelImplCopyWithImpl<$Res>
    extends _$CafeModelCopyWithImpl<$Res, _$CafeModelImpl>
    implements _$$CafeModelImplCopyWith<$Res> {
  __$$CafeModelImplCopyWithImpl(
    _$CafeModelImpl _value,
    $Res Function(_$CafeModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CafeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? category = freezed,
    Object? averagePrice = freezed,
    Object? discountCode = freezed,
    Object? discountPercentage = freezed,
    Object? discountsGivenOut = freezed,
    Object? allowedSuccessfulMatches = freezed,
    Object? allowDiscountConfiguration = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? location = freezed,
    Object? reviews = freezed,
    Object? openingHours = freezed,
    Object? status = freezed,
    Object? viewCount = freezed,
    Object? isDeleted = freezed,
    Object? dateAdded = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? cafeId = freezed,
    Object? v = freezed,
  }) {
    return _then(
      _$CafeModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
        averagePrice: freezed == averagePrice
            ? _value.averagePrice
            : averagePrice // ignore: cast_nullable_to_non_nullable
                  as int?,
        discountCode: freezed == discountCode
            ? _value.discountCode
            : discountCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        discountPercentage: freezed == discountPercentage
            ? _value.discountPercentage
            : discountPercentage // ignore: cast_nullable_to_non_nullable
                  as int?,
        discountsGivenOut: freezed == discountsGivenOut
            ? _value.discountsGivenOut
            : discountsGivenOut // ignore: cast_nullable_to_non_nullable
                  as int?,
        allowedSuccessfulMatches: freezed == allowedSuccessfulMatches
            ? _value.allowedSuccessfulMatches
            : allowedSuccessfulMatches // ignore: cast_nullable_to_non_nullable
                  as int?,
        allowDiscountConfiguration: freezed == allowDiscountConfiguration
            ? _value.allowDiscountConfiguration
            : allowDiscountConfiguration // ignore: cast_nullable_to_non_nullable
                  as bool?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as Location?,
        reviews: freezed == reviews
            ? _value.reviews
            : reviews // ignore: cast_nullable_to_non_nullable
                  as Reviews?,
        openingHours: freezed == openingHours
            ? _value._openingHours
            : openingHours // ignore: cast_nullable_to_non_nullable
                  as List<OperatingHour>?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        viewCount: freezed == viewCount
            ? _value.viewCount
            : viewCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        isDeleted: freezed == isDeleted
            ? _value.isDeleted
            : isDeleted // ignore: cast_nullable_to_non_nullable
                  as bool?,
        dateAdded: freezed == dateAdded
            ? _value.dateAdded
            : dateAdded // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        cafeId: freezed == cafeId
            ? _value.cafeId
            : cafeId // ignore: cast_nullable_to_non_nullable
                  as String?,
        v: freezed == v
            ? _value.v
            : v // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CafeModelImpl implements _CafeModel {
  const _$CafeModelImpl({
    this.id,
    this.name,
    this.email,
    this.category,
    this.averagePrice,
    this.discountCode,
    this.discountPercentage,
    this.discountsGivenOut,
    this.allowedSuccessfulMatches,
    this.allowDiscountConfiguration,
    this.image,
    this.description,
    this.location,
    this.reviews,
    final List<OperatingHour>? openingHours,
    this.status,
    this.viewCount,
    this.isDeleted,
    this.dateAdded,
    this.createdAt,
    this.updatedAt,
    this.cafeId,
    this.v,
  }) : _openingHours = openingHours;

  factory _$CafeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CafeModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? category;
  @override
  final int? averagePrice;
  @override
  final String? discountCode;
  @override
  final int? discountPercentage;
  @override
  final int? discountsGivenOut;
  @override
  final int? allowedSuccessfulMatches;
  @override
  final bool? allowDiscountConfiguration;
  @override
  final String? image;
  @override
  final String? description;
  @override
  final Location? location;
  @override
  final Reviews? reviews;
  final List<OperatingHour>? _openingHours;
  @override
  List<OperatingHour>? get openingHours {
    final value = _openingHours;
    if (value == null) return null;
    if (_openingHours is EqualUnmodifiableListView) return _openingHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? status;
  @override
  final int? viewCount;
  @override
  final bool? isDeleted;
  @override
  final String? dateAdded;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final String? cafeId;
  @override
  final int? v;

  @override
  String toString() {
    return 'CafeModel(id: $id, name: $name, email: $email, category: $category, averagePrice: $averagePrice, discountCode: $discountCode, discountPercentage: $discountPercentage, discountsGivenOut: $discountsGivenOut, allowedSuccessfulMatches: $allowedSuccessfulMatches, allowDiscountConfiguration: $allowDiscountConfiguration, image: $image, description: $description, location: $location, reviews: $reviews, openingHours: $openingHours, status: $status, viewCount: $viewCount, isDeleted: $isDeleted, dateAdded: $dateAdded, createdAt: $createdAt, updatedAt: $updatedAt, cafeId: $cafeId, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CafeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.averagePrice, averagePrice) ||
                other.averagePrice == averagePrice) &&
            (identical(other.discountCode, discountCode) ||
                other.discountCode == discountCode) &&
            (identical(other.discountPercentage, discountPercentage) ||
                other.discountPercentage == discountPercentage) &&
            (identical(other.discountsGivenOut, discountsGivenOut) ||
                other.discountsGivenOut == discountsGivenOut) &&
            (identical(
                  other.allowedSuccessfulMatches,
                  allowedSuccessfulMatches,
                ) ||
                other.allowedSuccessfulMatches == allowedSuccessfulMatches) &&
            (identical(
                  other.allowDiscountConfiguration,
                  allowDiscountConfiguration,
                ) ||
                other.allowDiscountConfiguration ==
                    allowDiscountConfiguration) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.reviews, reviews) || other.reviews == reviews) &&
            const DeepCollectionEquality().equals(
              other._openingHours,
              _openingHours,
            ) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.dateAdded, dateAdded) ||
                other.dateAdded == dateAdded) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.cafeId, cafeId) || other.cafeId == cafeId) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    name,
    email,
    category,
    averagePrice,
    discountCode,
    discountPercentage,
    discountsGivenOut,
    allowedSuccessfulMatches,
    allowDiscountConfiguration,
    image,
    description,
    location,
    reviews,
    const DeepCollectionEquality().hash(_openingHours),
    status,
    viewCount,
    isDeleted,
    dateAdded,
    createdAt,
    updatedAt,
    cafeId,
    v,
  ]);

  /// Create a copy of CafeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CafeModelImplCopyWith<_$CafeModelImpl> get copyWith =>
      __$$CafeModelImplCopyWithImpl<_$CafeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CafeModelImplToJson(this);
  }
}

abstract class _CafeModel implements CafeModel {
  const factory _CafeModel({
    final String? id,
    final String? name,
    final String? email,
    final String? category,
    final int? averagePrice,
    final String? discountCode,
    final int? discountPercentage,
    final int? discountsGivenOut,
    final int? allowedSuccessfulMatches,
    final bool? allowDiscountConfiguration,
    final String? image,
    final String? description,
    final Location? location,
    final Reviews? reviews,
    final List<OperatingHour>? openingHours,
    final String? status,
    final int? viewCount,
    final bool? isDeleted,
    final String? dateAdded,
    final String? createdAt,
    final String? updatedAt,
    final String? cafeId,
    final int? v,
  }) = _$CafeModelImpl;

  factory _CafeModel.fromJson(Map<String, dynamic> json) =
      _$CafeModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get category;
  @override
  int? get averagePrice;
  @override
  String? get discountCode;
  @override
  int? get discountPercentage;
  @override
  int? get discountsGivenOut;
  @override
  int? get allowedSuccessfulMatches;
  @override
  bool? get allowDiscountConfiguration;
  @override
  String? get image;
  @override
  String? get description;
  @override
  Location? get location;
  @override
  Reviews? get reviews;
  @override
  List<OperatingHour>? get openingHours;
  @override
  String? get status;
  @override
  int? get viewCount;
  @override
  bool? get isDeleted;
  @override
  String? get dateAdded;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  String? get cafeId;
  @override
  int? get v;

  /// Create a copy of CafeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CafeModelImplCopyWith<_$CafeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  String? get exactLocation => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;

  /// Serializes this Location to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call({String? exactLocation, String? region});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? exactLocation = freezed, Object? region = freezed}) {
    return _then(
      _value.copyWith(
            exactLocation: freezed == exactLocation
                ? _value.exactLocation
                : exactLocation // ignore: cast_nullable_to_non_nullable
                      as String?,
            region: freezed == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
    _$LocationImpl value,
    $Res Function(_$LocationImpl) then,
  ) = __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? exactLocation, String? region});
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
    _$LocationImpl _value,
    $Res Function(_$LocationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? exactLocation = freezed, Object? region = freezed}) {
    return _then(
      _$LocationImpl(
        exactLocation: freezed == exactLocation
            ? _value.exactLocation
            : exactLocation // ignore: cast_nullable_to_non_nullable
                  as String?,
        region: freezed == region
            ? _value.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationImpl implements _Location {
  const _$LocationImpl({this.exactLocation, this.region});

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  final String? exactLocation;
  @override
  final String? region;

  @override
  String toString() {
    return 'Location(exactLocation: $exactLocation, region: $region)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.exactLocation, exactLocation) ||
                other.exactLocation == exactLocation) &&
            (identical(other.region, region) || other.region == region));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, exactLocation, region);

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationImplToJson(this);
  }
}

abstract class _Location implements Location {
  const factory _Location({final String? exactLocation, final String? region}) =
      _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  String? get exactLocation;
  @override
  String? get region;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Reviews _$ReviewsFromJson(Map<String, dynamic> json) {
  return _Reviews.fromJson(json);
}

/// @nodoc
mixin _$Reviews {
  int? get rating => throw _privateConstructorUsedError;
  int? get reviewCount => throw _privateConstructorUsedError;

  /// Serializes this Reviews to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Reviews
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewsCopyWith<Reviews> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewsCopyWith<$Res> {
  factory $ReviewsCopyWith(Reviews value, $Res Function(Reviews) then) =
      _$ReviewsCopyWithImpl<$Res, Reviews>;
  @useResult
  $Res call({int? rating, int? reviewCount});
}

/// @nodoc
class _$ReviewsCopyWithImpl<$Res, $Val extends Reviews>
    implements $ReviewsCopyWith<$Res> {
  _$ReviewsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reviews
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rating = freezed, Object? reviewCount = freezed}) {
    return _then(
      _value.copyWith(
            rating: freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as int?,
            reviewCount: freezed == reviewCount
                ? _value.reviewCount
                : reviewCount // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReviewsImplCopyWith<$Res> implements $ReviewsCopyWith<$Res> {
  factory _$$ReviewsImplCopyWith(
    _$ReviewsImpl value,
    $Res Function(_$ReviewsImpl) then,
  ) = __$$ReviewsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? rating, int? reviewCount});
}

/// @nodoc
class __$$ReviewsImplCopyWithImpl<$Res>
    extends _$ReviewsCopyWithImpl<$Res, _$ReviewsImpl>
    implements _$$ReviewsImplCopyWith<$Res> {
  __$$ReviewsImplCopyWithImpl(
    _$ReviewsImpl _value,
    $Res Function(_$ReviewsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Reviews
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rating = freezed, Object? reviewCount = freezed}) {
    return _then(
      _$ReviewsImpl(
        rating: freezed == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as int?,
        reviewCount: freezed == reviewCount
            ? _value.reviewCount
            : reviewCount // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewsImpl implements _Reviews {
  const _$ReviewsImpl({this.rating, this.reviewCount});

  factory _$ReviewsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewsImplFromJson(json);

  @override
  final int? rating;
  @override
  final int? reviewCount;

  @override
  String toString() {
    return 'Reviews(rating: $rating, reviewCount: $reviewCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewsImpl &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rating, reviewCount);

  /// Create a copy of Reviews
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewsImplCopyWith<_$ReviewsImpl> get copyWith =>
      __$$ReviewsImplCopyWithImpl<_$ReviewsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewsImplToJson(this);
  }
}

abstract class _Reviews implements Reviews {
  const factory _Reviews({final int? rating, final int? reviewCount}) =
      _$ReviewsImpl;

  factory _Reviews.fromJson(Map<String, dynamic> json) = _$ReviewsImpl.fromJson;

  @override
  int? get rating;
  @override
  int? get reviewCount;

  /// Create a copy of Reviews
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewsImplCopyWith<_$ReviewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
