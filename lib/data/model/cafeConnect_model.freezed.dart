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
  @JsonKey(name: '_id')
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
  String? get locationLink => throw _privateConstructorUsedError;
  int? get viewCount => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  String? get dateAdded => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get cafeId => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int? get v => throw _privateConstructorUsedError;
  int? get popularityScore => throw _privateConstructorUsedError;
  int? get activeBookings => throw _privateConstructorUsedError;
  BookingStats? get bookingStats => throw _privateConstructorUsedError;
  UserBooking? get userBooking => throw _privateConstructorUsedError;
  List<dynamic>? get likedUsersAtCafe => throw _privateConstructorUsedError;
  bool? get hasBooking => throw _privateConstructorUsedError;
  bool? get isAlreadyBooked => throw _privateConstructorUsedError;
  bool? get hasLikedUsersAtCafe => throw _privateConstructorUsedError;

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
    @JsonKey(name: '_id') String? id,
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
    String? locationLink,
    int? viewCount,
    bool? isDeleted,
    String? dateAdded,
    String? createdAt,
    String? updatedAt,
    String? cafeId,
    @JsonKey(name: '__v') int? v,
    int? popularityScore,
    int? activeBookings,
    BookingStats? bookingStats,
    UserBooking? userBooking,
    List<dynamic>? likedUsersAtCafe,
    bool? hasBooking,
    bool? isAlreadyBooked,
    bool? hasLikedUsersAtCafe,
  });

  $LocationCopyWith<$Res>? get location;
  $ReviewsCopyWith<$Res>? get reviews;
  $BookingStatsCopyWith<$Res>? get bookingStats;
  $UserBookingCopyWith<$Res>? get userBooking;
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
    Object? locationLink = freezed,
    Object? viewCount = freezed,
    Object? isDeleted = freezed,
    Object? dateAdded = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? cafeId = freezed,
    Object? v = freezed,
    Object? popularityScore = freezed,
    Object? activeBookings = freezed,
    Object? bookingStats = freezed,
    Object? userBooking = freezed,
    Object? likedUsersAtCafe = freezed,
    Object? hasBooking = freezed,
    Object? isAlreadyBooked = freezed,
    Object? hasLikedUsersAtCafe = freezed,
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
            locationLink: freezed == locationLink
                ? _value.locationLink
                : locationLink // ignore: cast_nullable_to_non_nullable
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
            popularityScore: freezed == popularityScore
                ? _value.popularityScore
                : popularityScore // ignore: cast_nullable_to_non_nullable
                      as int?,
            activeBookings: freezed == activeBookings
                ? _value.activeBookings
                : activeBookings // ignore: cast_nullable_to_non_nullable
                      as int?,
            bookingStats: freezed == bookingStats
                ? _value.bookingStats
                : bookingStats // ignore: cast_nullable_to_non_nullable
                      as BookingStats?,
            userBooking: freezed == userBooking
                ? _value.userBooking
                : userBooking // ignore: cast_nullable_to_non_nullable
                      as UserBooking?,
            likedUsersAtCafe: freezed == likedUsersAtCafe
                ? _value.likedUsersAtCafe
                : likedUsersAtCafe // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>?,
            hasBooking: freezed == hasBooking
                ? _value.hasBooking
                : hasBooking // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isAlreadyBooked: freezed == isAlreadyBooked
                ? _value.isAlreadyBooked
                : isAlreadyBooked // ignore: cast_nullable_to_non_nullable
                      as bool?,
            hasLikedUsersAtCafe: freezed == hasLikedUsersAtCafe
                ? _value.hasLikedUsersAtCafe
                : hasLikedUsersAtCafe // ignore: cast_nullable_to_non_nullable
                      as bool?,
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

  /// Create a copy of CafeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookingStatsCopyWith<$Res>? get bookingStats {
    if (_value.bookingStats == null) {
      return null;
    }

    return $BookingStatsCopyWith<$Res>(_value.bookingStats!, (value) {
      return _then(_value.copyWith(bookingStats: value) as $Val);
    });
  }

  /// Create a copy of CafeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserBookingCopyWith<$Res>? get userBooking {
    if (_value.userBooking == null) {
      return null;
    }

    return $UserBookingCopyWith<$Res>(_value.userBooking!, (value) {
      return _then(_value.copyWith(userBooking: value) as $Val);
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
    @JsonKey(name: '_id') String? id,
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
    String? locationLink,
    int? viewCount,
    bool? isDeleted,
    String? dateAdded,
    String? createdAt,
    String? updatedAt,
    String? cafeId,
    @JsonKey(name: '__v') int? v,
    int? popularityScore,
    int? activeBookings,
    BookingStats? bookingStats,
    UserBooking? userBooking,
    List<dynamic>? likedUsersAtCafe,
    bool? hasBooking,
    bool? isAlreadyBooked,
    bool? hasLikedUsersAtCafe,
  });

  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $ReviewsCopyWith<$Res>? get reviews;
  @override
  $BookingStatsCopyWith<$Res>? get bookingStats;
  @override
  $UserBookingCopyWith<$Res>? get userBooking;
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
    Object? locationLink = freezed,
    Object? viewCount = freezed,
    Object? isDeleted = freezed,
    Object? dateAdded = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? cafeId = freezed,
    Object? v = freezed,
    Object? popularityScore = freezed,
    Object? activeBookings = freezed,
    Object? bookingStats = freezed,
    Object? userBooking = freezed,
    Object? likedUsersAtCafe = freezed,
    Object? hasBooking = freezed,
    Object? isAlreadyBooked = freezed,
    Object? hasLikedUsersAtCafe = freezed,
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
        locationLink: freezed == locationLink
            ? _value.locationLink
            : locationLink // ignore: cast_nullable_to_non_nullable
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
        popularityScore: freezed == popularityScore
            ? _value.popularityScore
            : popularityScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        activeBookings: freezed == activeBookings
            ? _value.activeBookings
            : activeBookings // ignore: cast_nullable_to_non_nullable
                  as int?,
        bookingStats: freezed == bookingStats
            ? _value.bookingStats
            : bookingStats // ignore: cast_nullable_to_non_nullable
                  as BookingStats?,
        userBooking: freezed == userBooking
            ? _value.userBooking
            : userBooking // ignore: cast_nullable_to_non_nullable
                  as UserBooking?,
        likedUsersAtCafe: freezed == likedUsersAtCafe
            ? _value._likedUsersAtCafe
            : likedUsersAtCafe // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>?,
        hasBooking: freezed == hasBooking
            ? _value.hasBooking
            : hasBooking // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isAlreadyBooked: freezed == isAlreadyBooked
            ? _value.isAlreadyBooked
            : isAlreadyBooked // ignore: cast_nullable_to_non_nullable
                  as bool?,
        hasLikedUsersAtCafe: freezed == hasLikedUsersAtCafe
            ? _value.hasLikedUsersAtCafe
            : hasLikedUsersAtCafe // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CafeModelImpl implements _CafeModel {
  const _$CafeModelImpl({
    @JsonKey(name: '_id') this.id,
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
    this.locationLink,
    this.viewCount,
    this.isDeleted,
    this.dateAdded,
    this.createdAt,
    this.updatedAt,
    this.cafeId,
    @JsonKey(name: '__v') this.v,
    this.popularityScore,
    this.activeBookings,
    this.bookingStats,
    this.userBooking,
    final List<dynamic>? likedUsersAtCafe,
    this.hasBooking,
    this.isAlreadyBooked,
    this.hasLikedUsersAtCafe,
  }) : _openingHours = openingHours,
       _likedUsersAtCafe = likedUsersAtCafe;

  factory _$CafeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CafeModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
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
  final String? locationLink;
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
  @JsonKey(name: '__v')
  final int? v;
  @override
  final int? popularityScore;
  @override
  final int? activeBookings;
  @override
  final BookingStats? bookingStats;
  @override
  final UserBooking? userBooking;
  final List<dynamic>? _likedUsersAtCafe;
  @override
  List<dynamic>? get likedUsersAtCafe {
    final value = _likedUsersAtCafe;
    if (value == null) return null;
    if (_likedUsersAtCafe is EqualUnmodifiableListView)
      return _likedUsersAtCafe;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? hasBooking;
  @override
  final bool? isAlreadyBooked;
  @override
  final bool? hasLikedUsersAtCafe;

  @override
  String toString() {
    return 'CafeModel(id: $id, name: $name, email: $email, category: $category, averagePrice: $averagePrice, discountCode: $discountCode, discountPercentage: $discountPercentage, discountsGivenOut: $discountsGivenOut, allowedSuccessfulMatches: $allowedSuccessfulMatches, allowDiscountConfiguration: $allowDiscountConfiguration, image: $image, description: $description, location: $location, reviews: $reviews, openingHours: $openingHours, status: $status, locationLink: $locationLink, viewCount: $viewCount, isDeleted: $isDeleted, dateAdded: $dateAdded, createdAt: $createdAt, updatedAt: $updatedAt, cafeId: $cafeId, v: $v, popularityScore: $popularityScore, activeBookings: $activeBookings, bookingStats: $bookingStats, userBooking: $userBooking, likedUsersAtCafe: $likedUsersAtCafe, hasBooking: $hasBooking, isAlreadyBooked: $isAlreadyBooked, hasLikedUsersAtCafe: $hasLikedUsersAtCafe)';
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
            (identical(other.locationLink, locationLink) ||
                other.locationLink == locationLink) &&
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
            (identical(other.v, v) || other.v == v) &&
            (identical(other.popularityScore, popularityScore) ||
                other.popularityScore == popularityScore) &&
            (identical(other.activeBookings, activeBookings) ||
                other.activeBookings == activeBookings) &&
            (identical(other.bookingStats, bookingStats) ||
                other.bookingStats == bookingStats) &&
            (identical(other.userBooking, userBooking) ||
                other.userBooking == userBooking) &&
            const DeepCollectionEquality().equals(
              other._likedUsersAtCafe,
              _likedUsersAtCafe,
            ) &&
            (identical(other.hasBooking, hasBooking) ||
                other.hasBooking == hasBooking) &&
            (identical(other.isAlreadyBooked, isAlreadyBooked) ||
                other.isAlreadyBooked == isAlreadyBooked) &&
            (identical(other.hasLikedUsersAtCafe, hasLikedUsersAtCafe) ||
                other.hasLikedUsersAtCafe == hasLikedUsersAtCafe));
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
    locationLink,
    viewCount,
    isDeleted,
    dateAdded,
    createdAt,
    updatedAt,
    cafeId,
    v,
    popularityScore,
    activeBookings,
    bookingStats,
    userBooking,
    const DeepCollectionEquality().hash(_likedUsersAtCafe),
    hasBooking,
    isAlreadyBooked,
    hasLikedUsersAtCafe,
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
    @JsonKey(name: '_id') final String? id,
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
    final String? locationLink,
    final int? viewCount,
    final bool? isDeleted,
    final String? dateAdded,
    final String? createdAt,
    final String? updatedAt,
    final String? cafeId,
    @JsonKey(name: '__v') final int? v,
    final int? popularityScore,
    final int? activeBookings,
    final BookingStats? bookingStats,
    final UserBooking? userBooking,
    final List<dynamic>? likedUsersAtCafe,
    final bool? hasBooking,
    final bool? isAlreadyBooked,
    final bool? hasLikedUsersAtCafe,
  }) = _$CafeModelImpl;

  factory _CafeModel.fromJson(Map<String, dynamic> json) =
      _$CafeModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
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
  String? get locationLink;
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
  @JsonKey(name: '__v')
  int? get v;
  @override
  int? get popularityScore;
  @override
  int? get activeBookings;
  @override
  BookingStats? get bookingStats;
  @override
  UserBooking? get userBooking;
  @override
  List<dynamic>? get likedUsersAtCafe;
  @override
  bool? get hasBooking;
  @override
  bool? get isAlreadyBooked;
  @override
  bool? get hasLikedUsersAtCafe;

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
  double? get rating => throw _privateConstructorUsedError;
  int? get reviewCount => throw _privateConstructorUsedError;
  String? get reviewText => throw _privateConstructorUsedError;

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
  $Res call({double? rating, int? reviewCount, String? reviewText});
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
abstract class _$$ReviewsImplCopyWith<$Res> implements $ReviewsCopyWith<$Res> {
  factory _$$ReviewsImplCopyWith(
    _$ReviewsImpl value,
    $Res Function(_$ReviewsImpl) then,
  ) = __$$ReviewsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? rating, int? reviewCount, String? reviewText});
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
  $Res call({
    Object? rating = freezed,
    Object? reviewCount = freezed,
    Object? reviewText = freezed,
  }) {
    return _then(
      _$ReviewsImpl(
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
class _$ReviewsImpl implements _Reviews {
  const _$ReviewsImpl({this.rating, this.reviewCount, this.reviewText});

  factory _$ReviewsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewsImplFromJson(json);

  @override
  final double? rating;
  @override
  final int? reviewCount;
  @override
  final String? reviewText;

  @override
  String toString() {
    return 'Reviews(rating: $rating, reviewCount: $reviewCount, reviewText: $reviewText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewsImpl &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.reviewText, reviewText) ||
                other.reviewText == reviewText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rating, reviewCount, reviewText);

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
  const factory _Reviews({
    final double? rating,
    final int? reviewCount,
    final String? reviewText,
  }) = _$ReviewsImpl;

  factory _Reviews.fromJson(Map<String, dynamic> json) = _$ReviewsImpl.fromJson;

  @override
  double? get rating;
  @override
  int? get reviewCount;
  @override
  String? get reviewText;

  /// Create a copy of Reviews
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewsImplCopyWith<_$ReviewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookingStats _$BookingStatsFromJson(Map<String, dynamic> json) {
  return _BookingStats.fromJson(json);
}

/// @nodoc
mixin _$BookingStats {
  int? get maleBookings => throw _privateConstructorUsedError;
  int? get femaleBookings => throw _privateConstructorUsedError;
  int? get totalBookings => throw _privateConstructorUsedError;
  int? get mutualLikes => throw _privateConstructorUsedError;

  /// Serializes this BookingStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookingStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingStatsCopyWith<BookingStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingStatsCopyWith<$Res> {
  factory $BookingStatsCopyWith(
    BookingStats value,
    $Res Function(BookingStats) then,
  ) = _$BookingStatsCopyWithImpl<$Res, BookingStats>;
  @useResult
  $Res call({
    int? maleBookings,
    int? femaleBookings,
    int? totalBookings,
    int? mutualLikes,
  });
}

/// @nodoc
class _$BookingStatsCopyWithImpl<$Res, $Val extends BookingStats>
    implements $BookingStatsCopyWith<$Res> {
  _$BookingStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maleBookings = freezed,
    Object? femaleBookings = freezed,
    Object? totalBookings = freezed,
    Object? mutualLikes = freezed,
  }) {
    return _then(
      _value.copyWith(
            maleBookings: freezed == maleBookings
                ? _value.maleBookings
                : maleBookings // ignore: cast_nullable_to_non_nullable
                      as int?,
            femaleBookings: freezed == femaleBookings
                ? _value.femaleBookings
                : femaleBookings // ignore: cast_nullable_to_non_nullable
                      as int?,
            totalBookings: freezed == totalBookings
                ? _value.totalBookings
                : totalBookings // ignore: cast_nullable_to_non_nullable
                      as int?,
            mutualLikes: freezed == mutualLikes
                ? _value.mutualLikes
                : mutualLikes // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookingStatsImplCopyWith<$Res>
    implements $BookingStatsCopyWith<$Res> {
  factory _$$BookingStatsImplCopyWith(
    _$BookingStatsImpl value,
    $Res Function(_$BookingStatsImpl) then,
  ) = __$$BookingStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? maleBookings,
    int? femaleBookings,
    int? totalBookings,
    int? mutualLikes,
  });
}

/// @nodoc
class __$$BookingStatsImplCopyWithImpl<$Res>
    extends _$BookingStatsCopyWithImpl<$Res, _$BookingStatsImpl>
    implements _$$BookingStatsImplCopyWith<$Res> {
  __$$BookingStatsImplCopyWithImpl(
    _$BookingStatsImpl _value,
    $Res Function(_$BookingStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maleBookings = freezed,
    Object? femaleBookings = freezed,
    Object? totalBookings = freezed,
    Object? mutualLikes = freezed,
  }) {
    return _then(
      _$BookingStatsImpl(
        maleBookings: freezed == maleBookings
            ? _value.maleBookings
            : maleBookings // ignore: cast_nullable_to_non_nullable
                  as int?,
        femaleBookings: freezed == femaleBookings
            ? _value.femaleBookings
            : femaleBookings // ignore: cast_nullable_to_non_nullable
                  as int?,
        totalBookings: freezed == totalBookings
            ? _value.totalBookings
            : totalBookings // ignore: cast_nullable_to_non_nullable
                  as int?,
        mutualLikes: freezed == mutualLikes
            ? _value.mutualLikes
            : mutualLikes // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingStatsImpl implements _BookingStats {
  const _$BookingStatsImpl({
    this.maleBookings,
    this.femaleBookings,
    this.totalBookings,
    this.mutualLikes,
  });

  factory _$BookingStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingStatsImplFromJson(json);

  @override
  final int? maleBookings;
  @override
  final int? femaleBookings;
  @override
  final int? totalBookings;
  @override
  final int? mutualLikes;

  @override
  String toString() {
    return 'BookingStats(maleBookings: $maleBookings, femaleBookings: $femaleBookings, totalBookings: $totalBookings, mutualLikes: $mutualLikes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingStatsImpl &&
            (identical(other.maleBookings, maleBookings) ||
                other.maleBookings == maleBookings) &&
            (identical(other.femaleBookings, femaleBookings) ||
                other.femaleBookings == femaleBookings) &&
            (identical(other.totalBookings, totalBookings) ||
                other.totalBookings == totalBookings) &&
            (identical(other.mutualLikes, mutualLikes) ||
                other.mutualLikes == mutualLikes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    maleBookings,
    femaleBookings,
    totalBookings,
    mutualLikes,
  );

  /// Create a copy of BookingStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingStatsImplCopyWith<_$BookingStatsImpl> get copyWith =>
      __$$BookingStatsImplCopyWithImpl<_$BookingStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingStatsImplToJson(this);
  }
}

abstract class _BookingStats implements BookingStats {
  const factory _BookingStats({
    final int? maleBookings,
    final int? femaleBookings,
    final int? totalBookings,
    final int? mutualLikes,
  }) = _$BookingStatsImpl;

  factory _BookingStats.fromJson(Map<String, dynamic> json) =
      _$BookingStatsImpl.fromJson;

  @override
  int? get maleBookings;
  @override
  int? get femaleBookings;
  @override
  int? get totalBookings;
  @override
  int? get mutualLikes;

  /// Create a copy of BookingStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingStatsImplCopyWith<_$BookingStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserBooking _$UserBookingFromJson(Map<String, dynamic> json) {
  return _UserBooking.fromJson(json);
}

/// @nodoc
mixin _$UserBooking {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  List<String>? get lookingFor => throw _privateConstructorUsedError;
  List<String>? get availableFor => throw _privateConstructorUsedError;
  String? get bookingDate => throw _privateConstructorUsedError;
  String? get additionalNotes => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  bool? get isExpired => throw _privateConstructorUsedError;

  /// Serializes this UserBooking to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserBooking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserBookingCopyWith<UserBooking> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBookingCopyWith<$Res> {
  factory $UserBookingCopyWith(
    UserBooking value,
    $Res Function(UserBooking) then,
  ) = _$UserBookingCopyWithImpl<$Res, UserBooking>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    List<String>? lookingFor,
    List<String>? availableFor,
    String? bookingDate,
    String? additionalNotes,
    String? status,
    bool? isExpired,
  });
}

/// @nodoc
class _$UserBookingCopyWithImpl<$Res, $Val extends UserBooking>
    implements $UserBookingCopyWith<$Res> {
  _$UserBookingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBooking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? lookingFor = freezed,
    Object? availableFor = freezed,
    Object? bookingDate = freezed,
    Object? additionalNotes = freezed,
    Object? status = freezed,
    Object? isExpired = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            lookingFor: freezed == lookingFor
                ? _value.lookingFor
                : lookingFor // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            availableFor: freezed == availableFor
                ? _value.availableFor
                : availableFor // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            bookingDate: freezed == bookingDate
                ? _value.bookingDate
                : bookingDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            additionalNotes: freezed == additionalNotes
                ? _value.additionalNotes
                : additionalNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$UserBookingImplCopyWith<$Res>
    implements $UserBookingCopyWith<$Res> {
  factory _$$UserBookingImplCopyWith(
    _$UserBookingImpl value,
    $Res Function(_$UserBookingImpl) then,
  ) = __$$UserBookingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    List<String>? lookingFor,
    List<String>? availableFor,
    String? bookingDate,
    String? additionalNotes,
    String? status,
    bool? isExpired,
  });
}

/// @nodoc
class __$$UserBookingImplCopyWithImpl<$Res>
    extends _$UserBookingCopyWithImpl<$Res, _$UserBookingImpl>
    implements _$$UserBookingImplCopyWith<$Res> {
  __$$UserBookingImplCopyWithImpl(
    _$UserBookingImpl _value,
    $Res Function(_$UserBookingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserBooking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? lookingFor = freezed,
    Object? availableFor = freezed,
    Object? bookingDate = freezed,
    Object? additionalNotes = freezed,
    Object? status = freezed,
    Object? isExpired = freezed,
  }) {
    return _then(
      _$UserBookingImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        lookingFor: freezed == lookingFor
            ? _value._lookingFor
            : lookingFor // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        availableFor: freezed == availableFor
            ? _value._availableFor
            : availableFor // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        bookingDate: freezed == bookingDate
            ? _value.bookingDate
            : bookingDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        additionalNotes: freezed == additionalNotes
            ? _value.additionalNotes
            : additionalNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$UserBookingImpl implements _UserBooking {
  const _$UserBookingImpl({
    @JsonKey(name: '_id') this.id,
    final List<String>? lookingFor,
    final List<String>? availableFor,
    this.bookingDate,
    this.additionalNotes,
    this.status,
    this.isExpired,
  }) : _lookingFor = lookingFor,
       _availableFor = availableFor;

  factory _$UserBookingImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserBookingImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  final List<String>? _lookingFor;
  @override
  List<String>? get lookingFor {
    final value = _lookingFor;
    if (value == null) return null;
    if (_lookingFor is EqualUnmodifiableListView) return _lookingFor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _availableFor;
  @override
  List<String>? get availableFor {
    final value = _availableFor;
    if (value == null) return null;
    if (_availableFor is EqualUnmodifiableListView) return _availableFor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? bookingDate;
  @override
  final String? additionalNotes;
  @override
  final String? status;
  @override
  final bool? isExpired;

  @override
  String toString() {
    return 'UserBooking(id: $id, lookingFor: $lookingFor, availableFor: $availableFor, bookingDate: $bookingDate, additionalNotes: $additionalNotes, status: $status, isExpired: $isExpired)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBookingImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(
              other._lookingFor,
              _lookingFor,
            ) &&
            const DeepCollectionEquality().equals(
              other._availableFor,
              _availableFor,
            ) &&
            (identical(other.bookingDate, bookingDate) ||
                other.bookingDate == bookingDate) &&
            (identical(other.additionalNotes, additionalNotes) ||
                other.additionalNotes == additionalNotes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isExpired, isExpired) ||
                other.isExpired == isExpired));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    const DeepCollectionEquality().hash(_lookingFor),
    const DeepCollectionEquality().hash(_availableFor),
    bookingDate,
    additionalNotes,
    status,
    isExpired,
  );

  /// Create a copy of UserBooking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBookingImplCopyWith<_$UserBookingImpl> get copyWith =>
      __$$UserBookingImplCopyWithImpl<_$UserBookingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBookingImplToJson(this);
  }
}

abstract class _UserBooking implements UserBooking {
  const factory _UserBooking({
    @JsonKey(name: '_id') final String? id,
    final List<String>? lookingFor,
    final List<String>? availableFor,
    final String? bookingDate,
    final String? additionalNotes,
    final String? status,
    final bool? isExpired,
  }) = _$UserBookingImpl;

  factory _UserBooking.fromJson(Map<String, dynamic> json) =
      _$UserBookingImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  List<String>? get lookingFor;
  @override
  List<String>? get availableFor;
  @override
  String? get bookingDate;
  @override
  String? get additionalNotes;
  @override
  String? get status;
  @override
  bool? get isExpired;

  /// Create a copy of UserBooking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBookingImplCopyWith<_$UserBookingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OperatingHour _$OperatingHourFromJson(Map<String, dynamic> json) {
  return _OperatingHour.fromJson(json);
}

/// @nodoc
mixin _$OperatingHour {
  String? get day => throw _privateConstructorUsedError;
  String? get openingTime => throw _privateConstructorUsedError;
  String? get closingTime => throw _privateConstructorUsedError;
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
  $Res call({
    String? day,
    String? openingTime,
    String? closingTime,
    bool isClosed,
  });
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
    Object? openingTime = freezed,
    Object? closingTime = freezed,
    Object? isClosed = null,
  }) {
    return _then(
      _value.copyWith(
            day: freezed == day
                ? _value.day
                : day // ignore: cast_nullable_to_non_nullable
                      as String?,
            openingTime: freezed == openingTime
                ? _value.openingTime
                : openingTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            closingTime: freezed == closingTime
                ? _value.closingTime
                : closingTime // ignore: cast_nullable_to_non_nullable
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
  $Res call({
    String? day,
    String? openingTime,
    String? closingTime,
    bool isClosed,
  });
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
    Object? openingTime = freezed,
    Object? closingTime = freezed,
    Object? isClosed = null,
  }) {
    return _then(
      _$OperatingHourImpl(
        day: freezed == day
            ? _value.day
            : day // ignore: cast_nullable_to_non_nullable
                  as String?,
        openingTime: freezed == openingTime
            ? _value.openingTime
            : openingTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        closingTime: freezed == closingTime
            ? _value.closingTime
            : closingTime // ignore: cast_nullable_to_non_nullable
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
    this.openingTime,
    this.closingTime,
    this.isClosed = false,
  });

  factory _$OperatingHourImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperatingHourImplFromJson(json);

  @override
  final String? day;
  @override
  final String? openingTime;
  @override
  final String? closingTime;
  @override
  @JsonKey()
  final bool isClosed;

  @override
  String toString() {
    return 'OperatingHour(day: $day, openingTime: $openingTime, closingTime: $closingTime, isClosed: $isClosed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperatingHourImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.openingTime, openingTime) ||
                other.openingTime == openingTime) &&
            (identical(other.closingTime, closingTime) ||
                other.closingTime == closingTime) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, day, openingTime, closingTime, isClosed);

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
    final String? openingTime,
    final String? closingTime,
    final bool isClosed,
  }) = _$OperatingHourImpl;

  factory _OperatingHour.fromJson(Map<String, dynamic> json) =
      _$OperatingHourImpl.fromJson;

  @override
  String? get day;
  @override
  String? get openingTime;
  @override
  String? get closingTime;
  @override
  bool get isClosed;

  /// Create a copy of OperatingHour
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OperatingHourImplCopyWith<_$OperatingHourImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
