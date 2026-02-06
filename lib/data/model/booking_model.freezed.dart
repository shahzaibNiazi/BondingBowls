// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) {
  return _BookingModel.fromJson(json);
}

/// @nodoc
mixin _$BookingModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  UserModel? get userId => throw _privateConstructorUsedError;
  CafeData? get cafeId => throw _privateConstructorUsedError;
  List<String>? get lookingFor => throw _privateConstructorUsedError;
  List<String>? get availableFor => throw _privateConstructorUsedError;
  DateTime? get bookingDate => throw _privateConstructorUsedError;
  String? get additionalNotes => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get matchedUserId => throw _privateConstructorUsedError;
  DateTime? get matchedAt => throw _privateConstructorUsedError;
  String? get cancelledBy => throw _privateConstructorUsedError;
  DateTime? get cancelledAt => throw _privateConstructorUsedError;
  DateTime? get confirmedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int? get v => throw _privateConstructorUsedError;
  bool? get isExpired => throw _privateConstructorUsedError;
  FormattedBookingDate? get formattedBookingDate =>
      throw _privateConstructorUsedError;
  int? get timeRemaining => throw _privateConstructorUsedError;
  bool? get isConfirmed => throw _privateConstructorUsedError;
  bool? get isPending => throw _privateConstructorUsedError;

  /// Serializes this BookingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingModelCopyWith<BookingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingModelCopyWith<$Res> {
  factory $BookingModelCopyWith(
    BookingModel value,
    $Res Function(BookingModel) then,
  ) = _$BookingModelCopyWithImpl<$Res, BookingModel>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    UserModel? userId,
    CafeData? cafeId,
    List<String>? lookingFor,
    List<String>? availableFor,
    DateTime? bookingDate,
    String? additionalNotes,
    String? status,
    String? matchedUserId,
    DateTime? matchedAt,
    String? cancelledBy,
    DateTime? cancelledAt,
    DateTime? confirmedAt,
    DateTime? completedAt,
    bool? isDeleted,
    DateTime? expiresAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    @JsonKey(name: '__v') int? v,
    bool? isExpired,
    FormattedBookingDate? formattedBookingDate,
    int? timeRemaining,
    bool? isConfirmed,
    bool? isPending,
  });

  $UserModelCopyWith<$Res>? get userId;
  $CafeDataCopyWith<$Res>? get cafeId;
  $FormattedBookingDateCopyWith<$Res>? get formattedBookingDate;
}

/// @nodoc
class _$BookingModelCopyWithImpl<$Res, $Val extends BookingModel>
    implements $BookingModelCopyWith<$Res> {
  _$BookingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? cafeId = freezed,
    Object? lookingFor = freezed,
    Object? availableFor = freezed,
    Object? bookingDate = freezed,
    Object? additionalNotes = freezed,
    Object? status = freezed,
    Object? matchedUserId = freezed,
    Object? matchedAt = freezed,
    Object? cancelledBy = freezed,
    Object? cancelledAt = freezed,
    Object? confirmedAt = freezed,
    Object? completedAt = freezed,
    Object? isDeleted = freezed,
    Object? expiresAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
    Object? isExpired = freezed,
    Object? formattedBookingDate = freezed,
    Object? timeRemaining = freezed,
    Object? isConfirmed = freezed,
    Object? isPending = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as UserModel?,
            cafeId: freezed == cafeId
                ? _value.cafeId
                : cafeId // ignore: cast_nullable_to_non_nullable
                      as CafeData?,
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
                      as DateTime?,
            additionalNotes: freezed == additionalNotes
                ? _value.additionalNotes
                : additionalNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            matchedUserId: freezed == matchedUserId
                ? _value.matchedUserId
                : matchedUserId // ignore: cast_nullable_to_non_nullable
                      as String?,
            matchedAt: freezed == matchedAt
                ? _value.matchedAt
                : matchedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            cancelledBy: freezed == cancelledBy
                ? _value.cancelledBy
                : cancelledBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            cancelledAt: freezed == cancelledAt
                ? _value.cancelledAt
                : cancelledAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            confirmedAt: freezed == confirmedAt
                ? _value.confirmedAt
                : confirmedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            isDeleted: freezed == isDeleted
                ? _value.isDeleted
                : isDeleted // ignore: cast_nullable_to_non_nullable
                      as bool?,
            expiresAt: freezed == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
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
            isExpired: freezed == isExpired
                ? _value.isExpired
                : isExpired // ignore: cast_nullable_to_non_nullable
                      as bool?,
            formattedBookingDate: freezed == formattedBookingDate
                ? _value.formattedBookingDate
                : formattedBookingDate // ignore: cast_nullable_to_non_nullable
                      as FormattedBookingDate?,
            timeRemaining: freezed == timeRemaining
                ? _value.timeRemaining
                : timeRemaining // ignore: cast_nullable_to_non_nullable
                      as int?,
            isConfirmed: freezed == isConfirmed
                ? _value.isConfirmed
                : isConfirmed // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isPending: freezed == isPending
                ? _value.isPending
                : isPending // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get userId {
    if (_value.userId == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.userId!, (value) {
      return _then(_value.copyWith(userId: value) as $Val);
    });
  }

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CafeDataCopyWith<$Res>? get cafeId {
    if (_value.cafeId == null) {
      return null;
    }

    return $CafeDataCopyWith<$Res>(_value.cafeId!, (value) {
      return _then(_value.copyWith(cafeId: value) as $Val);
    });
  }

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormattedBookingDateCopyWith<$Res>? get formattedBookingDate {
    if (_value.formattedBookingDate == null) {
      return null;
    }

    return $FormattedBookingDateCopyWith<$Res>(_value.formattedBookingDate!, (
      value,
    ) {
      return _then(_value.copyWith(formattedBookingDate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookingModelImplCopyWith<$Res>
    implements $BookingModelCopyWith<$Res> {
  factory _$$BookingModelImplCopyWith(
    _$BookingModelImpl value,
    $Res Function(_$BookingModelImpl) then,
  ) = __$$BookingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    UserModel? userId,
    CafeData? cafeId,
    List<String>? lookingFor,
    List<String>? availableFor,
    DateTime? bookingDate,
    String? additionalNotes,
    String? status,
    String? matchedUserId,
    DateTime? matchedAt,
    String? cancelledBy,
    DateTime? cancelledAt,
    DateTime? confirmedAt,
    DateTime? completedAt,
    bool? isDeleted,
    DateTime? expiresAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    @JsonKey(name: '__v') int? v,
    bool? isExpired,
    FormattedBookingDate? formattedBookingDate,
    int? timeRemaining,
    bool? isConfirmed,
    bool? isPending,
  });

  @override
  $UserModelCopyWith<$Res>? get userId;
  @override
  $CafeDataCopyWith<$Res>? get cafeId;
  @override
  $FormattedBookingDateCopyWith<$Res>? get formattedBookingDate;
}

/// @nodoc
class __$$BookingModelImplCopyWithImpl<$Res>
    extends _$BookingModelCopyWithImpl<$Res, _$BookingModelImpl>
    implements _$$BookingModelImplCopyWith<$Res> {
  __$$BookingModelImplCopyWithImpl(
    _$BookingModelImpl _value,
    $Res Function(_$BookingModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? cafeId = freezed,
    Object? lookingFor = freezed,
    Object? availableFor = freezed,
    Object? bookingDate = freezed,
    Object? additionalNotes = freezed,
    Object? status = freezed,
    Object? matchedUserId = freezed,
    Object? matchedAt = freezed,
    Object? cancelledBy = freezed,
    Object? cancelledAt = freezed,
    Object? confirmedAt = freezed,
    Object? completedAt = freezed,
    Object? isDeleted = freezed,
    Object? expiresAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
    Object? isExpired = freezed,
    Object? formattedBookingDate = freezed,
    Object? timeRemaining = freezed,
    Object? isConfirmed = freezed,
    Object? isPending = freezed,
  }) {
    return _then(
      _$BookingModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as UserModel?,
        cafeId: freezed == cafeId
            ? _value.cafeId
            : cafeId // ignore: cast_nullable_to_non_nullable
                  as CafeData?,
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
                  as DateTime?,
        additionalNotes: freezed == additionalNotes
            ? _value.additionalNotes
            : additionalNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        matchedUserId: freezed == matchedUserId
            ? _value.matchedUserId
            : matchedUserId // ignore: cast_nullable_to_non_nullable
                  as String?,
        matchedAt: freezed == matchedAt
            ? _value.matchedAt
            : matchedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        cancelledBy: freezed == cancelledBy
            ? _value.cancelledBy
            : cancelledBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        cancelledAt: freezed == cancelledAt
            ? _value.cancelledAt
            : cancelledAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        confirmedAt: freezed == confirmedAt
            ? _value.confirmedAt
            : confirmedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isDeleted: freezed == isDeleted
            ? _value.isDeleted
            : isDeleted // ignore: cast_nullable_to_non_nullable
                  as bool?,
        expiresAt: freezed == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
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
        isExpired: freezed == isExpired
            ? _value.isExpired
            : isExpired // ignore: cast_nullable_to_non_nullable
                  as bool?,
        formattedBookingDate: freezed == formattedBookingDate
            ? _value.formattedBookingDate
            : formattedBookingDate // ignore: cast_nullable_to_non_nullable
                  as FormattedBookingDate?,
        timeRemaining: freezed == timeRemaining
            ? _value.timeRemaining
            : timeRemaining // ignore: cast_nullable_to_non_nullable
                  as int?,
        isConfirmed: freezed == isConfirmed
            ? _value.isConfirmed
            : isConfirmed // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isPending: freezed == isPending
            ? _value.isPending
            : isPending // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingModelImpl implements _BookingModel {
  const _$BookingModelImpl({
    @JsonKey(name: '_id') this.id,
    this.userId,
    this.cafeId,
    final List<String>? lookingFor,
    final List<String>? availableFor,
    this.bookingDate,
    this.additionalNotes,
    this.status,
    this.matchedUserId,
    this.matchedAt,
    this.cancelledBy,
    this.cancelledAt,
    this.confirmedAt,
    this.completedAt,
    this.isDeleted,
    this.expiresAt,
    this.createdAt,
    this.updatedAt,
    @JsonKey(name: '__v') this.v,
    this.isExpired,
    this.formattedBookingDate,
    this.timeRemaining,
    this.isConfirmed,
    this.isPending,
  }) : _lookingFor = lookingFor,
       _availableFor = availableFor;

  factory _$BookingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final UserModel? userId;
  @override
  final CafeData? cafeId;
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
  final DateTime? bookingDate;
  @override
  final String? additionalNotes;
  @override
  final String? status;
  @override
  final String? matchedUserId;
  @override
  final DateTime? matchedAt;
  @override
  final String? cancelledBy;
  @override
  final DateTime? cancelledAt;
  @override
  final DateTime? confirmedAt;
  @override
  final DateTime? completedAt;
  @override
  final bool? isDeleted;
  @override
  final DateTime? expiresAt;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey(name: '__v')
  final int? v;
  @override
  final bool? isExpired;
  @override
  final FormattedBookingDate? formattedBookingDate;
  @override
  final int? timeRemaining;
  @override
  final bool? isConfirmed;
  @override
  final bool? isPending;

  @override
  String toString() {
    return 'BookingModel(id: $id, userId: $userId, cafeId: $cafeId, lookingFor: $lookingFor, availableFor: $availableFor, bookingDate: $bookingDate, additionalNotes: $additionalNotes, status: $status, matchedUserId: $matchedUserId, matchedAt: $matchedAt, cancelledBy: $cancelledBy, cancelledAt: $cancelledAt, confirmedAt: $confirmedAt, completedAt: $completedAt, isDeleted: $isDeleted, expiresAt: $expiresAt, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, isExpired: $isExpired, formattedBookingDate: $formattedBookingDate, timeRemaining: $timeRemaining, isConfirmed: $isConfirmed, isPending: $isPending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.cafeId, cafeId) || other.cafeId == cafeId) &&
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
            (identical(other.matchedUserId, matchedUserId) ||
                other.matchedUserId == matchedUserId) &&
            (identical(other.matchedAt, matchedAt) ||
                other.matchedAt == matchedAt) &&
            (identical(other.cancelledBy, cancelledBy) ||
                other.cancelledBy == cancelledBy) &&
            (identical(other.cancelledAt, cancelledAt) ||
                other.cancelledAt == cancelledAt) &&
            (identical(other.confirmedAt, confirmedAt) ||
                other.confirmedAt == confirmedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v) &&
            (identical(other.isExpired, isExpired) ||
                other.isExpired == isExpired) &&
            (identical(other.formattedBookingDate, formattedBookingDate) ||
                other.formattedBookingDate == formattedBookingDate) &&
            (identical(other.timeRemaining, timeRemaining) ||
                other.timeRemaining == timeRemaining) &&
            (identical(other.isConfirmed, isConfirmed) ||
                other.isConfirmed == isConfirmed) &&
            (identical(other.isPending, isPending) ||
                other.isPending == isPending));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    userId,
    cafeId,
    const DeepCollectionEquality().hash(_lookingFor),
    const DeepCollectionEquality().hash(_availableFor),
    bookingDate,
    additionalNotes,
    status,
    matchedUserId,
    matchedAt,
    cancelledBy,
    cancelledAt,
    confirmedAt,
    completedAt,
    isDeleted,
    expiresAt,
    createdAt,
    updatedAt,
    v,
    isExpired,
    formattedBookingDate,
    timeRemaining,
    isConfirmed,
    isPending,
  ]);

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingModelImplCopyWith<_$BookingModelImpl> get copyWith =>
      __$$BookingModelImplCopyWithImpl<_$BookingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingModelImplToJson(this);
  }
}

abstract class _BookingModel implements BookingModel {
  const factory _BookingModel({
    @JsonKey(name: '_id') final String? id,
    final UserModel? userId,
    final CafeData? cafeId,
    final List<String>? lookingFor,
    final List<String>? availableFor,
    final DateTime? bookingDate,
    final String? additionalNotes,
    final String? status,
    final String? matchedUserId,
    final DateTime? matchedAt,
    final String? cancelledBy,
    final DateTime? cancelledAt,
    final DateTime? confirmedAt,
    final DateTime? completedAt,
    final bool? isDeleted,
    final DateTime? expiresAt,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    @JsonKey(name: '__v') final int? v,
    final bool? isExpired,
    final FormattedBookingDate? formattedBookingDate,
    final int? timeRemaining,
    final bool? isConfirmed,
    final bool? isPending,
  }) = _$BookingModelImpl;

  factory _BookingModel.fromJson(Map<String, dynamic> json) =
      _$BookingModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  UserModel? get userId;
  @override
  CafeData? get cafeId;
  @override
  List<String>? get lookingFor;
  @override
  List<String>? get availableFor;
  @override
  DateTime? get bookingDate;
  @override
  String? get additionalNotes;
  @override
  String? get status;
  @override
  String? get matchedUserId;
  @override
  DateTime? get matchedAt;
  @override
  String? get cancelledBy;
  @override
  DateTime? get cancelledAt;
  @override
  DateTime? get confirmedAt;
  @override
  DateTime? get completedAt;
  @override
  bool? get isDeleted;
  @override
  DateTime? get expiresAt;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(name: '__v')
  int? get v;
  @override
  bool? get isExpired;
  @override
  FormattedBookingDate? get formattedBookingDate;
  @override
  int? get timeRemaining;
  @override
  bool? get isConfirmed;
  @override
  bool? get isPending;

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingModelImplCopyWith<_$BookingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get profilePhoto => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? fullName,
    String? profilePhoto,
    String? nickname,
  });
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? profilePhoto = freezed,
    Object? nickname = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String?,
            profilePhoto: freezed == profilePhoto
                ? _value.profilePhoto
                : profilePhoto // ignore: cast_nullable_to_non_nullable
                      as String?,
            nickname: freezed == nickname
                ? _value.nickname
                : nickname // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
    _$UserModelImpl value,
    $Res Function(_$UserModelImpl) then,
  ) = __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? fullName,
    String? profilePhoto,
    String? nickname,
  });
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
    _$UserModelImpl _value,
    $Res Function(_$UserModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? profilePhoto = freezed,
    Object? nickname = freezed,
  }) {
    return _then(
      _$UserModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        profilePhoto: freezed == profilePhoto
            ? _value.profilePhoto
            : profilePhoto // ignore: cast_nullable_to_non_nullable
                  as String?,
        nickname: freezed == nickname
            ? _value.nickname
            : nickname // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl({
    @JsonKey(name: '_id') this.id,
    this.fullName,
    this.profilePhoto,
    this.nickname,
  });

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? fullName;
  @override
  final String? profilePhoto;
  @override
  final String? nickname;

  @override
  String toString() {
    return 'UserModel(id: $id, fullName: $fullName, profilePhoto: $profilePhoto, nickname: $nickname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, fullName, profilePhoto, nickname);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(this);
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel({
    @JsonKey(name: '_id') final String? id,
    final String? fullName,
    final String? profilePhoto,
    final String? nickname,
  }) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get fullName;
  @override
  String? get profilePhoto;
  @override
  String? get nickname;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CafeData _$CafeDataFromJson(Map<String, dynamic> json) {
  return _CafeData.fromJson(json);
}

/// @nodoc
mixin _$CafeData {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  int? get averagePrice => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get cafeId => throw _privateConstructorUsedError;
  String? get locationLink => throw _privateConstructorUsedError;
  String? get locationlink => throw _privateConstructorUsedError;
  LocationModel? get location => throw _privateConstructorUsedError;
  ReviewModel? get reviews => throw _privateConstructorUsedError;
  List<OpeningHour>? get openingHours => throw _privateConstructorUsedError;
  BookingDayHours? get bookingDayHours => throw _privateConstructorUsedError;

  /// Serializes this CafeData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CafeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CafeDataCopyWith<CafeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CafeDataCopyWith<$Res> {
  factory $CafeDataCopyWith(CafeData value, $Res Function(CafeData) then) =
      _$CafeDataCopyWithImpl<$Res, CafeData>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? name,
    String? category,
    int? averagePrice,
    String? image,
    String? cafeId,
    String? locationLink,
    String? locationlink,
    LocationModel? location,
    ReviewModel? reviews,
    List<OpeningHour>? openingHours,
    BookingDayHours? bookingDayHours,
  });

  $LocationModelCopyWith<$Res>? get location;
  $ReviewModelCopyWith<$Res>? get reviews;
  $BookingDayHoursCopyWith<$Res>? get bookingDayHours;
}

/// @nodoc
class _$CafeDataCopyWithImpl<$Res, $Val extends CafeData>
    implements $CafeDataCopyWith<$Res> {
  _$CafeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CafeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? category = freezed,
    Object? averagePrice = freezed,
    Object? image = freezed,
    Object? cafeId = freezed,
    Object? locationLink = freezed,
    Object? locationlink = freezed,
    Object? location = freezed,
    Object? reviews = freezed,
    Object? openingHours = freezed,
    Object? bookingDayHours = freezed,
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
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
            averagePrice: freezed == averagePrice
                ? _value.averagePrice
                : averagePrice // ignore: cast_nullable_to_non_nullable
                      as int?,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            cafeId: freezed == cafeId
                ? _value.cafeId
                : cafeId // ignore: cast_nullable_to_non_nullable
                      as String?,
            locationLink: freezed == locationLink
                ? _value.locationLink
                : locationLink // ignore: cast_nullable_to_non_nullable
                      as String?,
            locationlink: freezed == locationlink
                ? _value.locationlink
                : locationlink // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as LocationModel?,
            reviews: freezed == reviews
                ? _value.reviews
                : reviews // ignore: cast_nullable_to_non_nullable
                      as ReviewModel?,
            openingHours: freezed == openingHours
                ? _value.openingHours
                : openingHours // ignore: cast_nullable_to_non_nullable
                      as List<OpeningHour>?,
            bookingDayHours: freezed == bookingDayHours
                ? _value.bookingDayHours
                : bookingDayHours // ignore: cast_nullable_to_non_nullable
                      as BookingDayHours?,
          )
          as $Val,
    );
  }

  /// Create a copy of CafeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationModelCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationModelCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  /// Create a copy of CafeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewModelCopyWith<$Res>? get reviews {
    if (_value.reviews == null) {
      return null;
    }

    return $ReviewModelCopyWith<$Res>(_value.reviews!, (value) {
      return _then(_value.copyWith(reviews: value) as $Val);
    });
  }

  /// Create a copy of CafeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookingDayHoursCopyWith<$Res>? get bookingDayHours {
    if (_value.bookingDayHours == null) {
      return null;
    }

    return $BookingDayHoursCopyWith<$Res>(_value.bookingDayHours!, (value) {
      return _then(_value.copyWith(bookingDayHours: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CafeDataImplCopyWith<$Res>
    implements $CafeDataCopyWith<$Res> {
  factory _$$CafeDataImplCopyWith(
    _$CafeDataImpl value,
    $Res Function(_$CafeDataImpl) then,
  ) = __$$CafeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? name,
    String? category,
    int? averagePrice,
    String? image,
    String? cafeId,
    String? locationLink,
    String? locationlink,
    LocationModel? location,
    ReviewModel? reviews,
    List<OpeningHour>? openingHours,
    BookingDayHours? bookingDayHours,
  });

  @override
  $LocationModelCopyWith<$Res>? get location;
  @override
  $ReviewModelCopyWith<$Res>? get reviews;
  @override
  $BookingDayHoursCopyWith<$Res>? get bookingDayHours;
}

/// @nodoc
class __$$CafeDataImplCopyWithImpl<$Res>
    extends _$CafeDataCopyWithImpl<$Res, _$CafeDataImpl>
    implements _$$CafeDataImplCopyWith<$Res> {
  __$$CafeDataImplCopyWithImpl(
    _$CafeDataImpl _value,
    $Res Function(_$CafeDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CafeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? category = freezed,
    Object? averagePrice = freezed,
    Object? image = freezed,
    Object? cafeId = freezed,
    Object? locationLink = freezed,
    Object? locationlink = freezed,
    Object? location = freezed,
    Object? reviews = freezed,
    Object? openingHours = freezed,
    Object? bookingDayHours = freezed,
  }) {
    return _then(
      _$CafeDataImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
        averagePrice: freezed == averagePrice
            ? _value.averagePrice
            : averagePrice // ignore: cast_nullable_to_non_nullable
                  as int?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        cafeId: freezed == cafeId
            ? _value.cafeId
            : cafeId // ignore: cast_nullable_to_non_nullable
                  as String?,
        locationLink: freezed == locationLink
            ? _value.locationLink
            : locationLink // ignore: cast_nullable_to_non_nullable
                  as String?,
        locationlink: freezed == locationlink
            ? _value.locationlink
            : locationlink // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as LocationModel?,
        reviews: freezed == reviews
            ? _value.reviews
            : reviews // ignore: cast_nullable_to_non_nullable
                  as ReviewModel?,
        openingHours: freezed == openingHours
            ? _value._openingHours
            : openingHours // ignore: cast_nullable_to_non_nullable
                  as List<OpeningHour>?,
        bookingDayHours: freezed == bookingDayHours
            ? _value.bookingDayHours
            : bookingDayHours // ignore: cast_nullable_to_non_nullable
                  as BookingDayHours?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CafeDataImpl implements _CafeData {
  const _$CafeDataImpl({
    @JsonKey(name: '_id') this.id,
    this.name,
    this.category,
    this.averagePrice,
    this.image,
    this.cafeId,
    this.locationLink,
    this.locationlink,
    this.location,
    this.reviews,
    final List<OpeningHour>? openingHours,
    this.bookingDayHours,
  }) : _openingHours = openingHours;

  factory _$CafeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CafeDataImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;
  @override
  final String? category;
  @override
  final int? averagePrice;
  @override
  final String? image;
  @override
  final String? cafeId;
  @override
  final String? locationLink;
  @override
  final String? locationlink;
  @override
  final LocationModel? location;
  @override
  final ReviewModel? reviews;
  final List<OpeningHour>? _openingHours;
  @override
  List<OpeningHour>? get openingHours {
    final value = _openingHours;
    if (value == null) return null;
    if (_openingHours is EqualUnmodifiableListView) return _openingHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final BookingDayHours? bookingDayHours;

  @override
  String toString() {
    return 'CafeData(id: $id, name: $name, category: $category, averagePrice: $averagePrice, image: $image, cafeId: $cafeId, locationLink: $locationLink, locationlink: $locationlink, location: $location, reviews: $reviews, openingHours: $openingHours, bookingDayHours: $bookingDayHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CafeDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.averagePrice, averagePrice) ||
                other.averagePrice == averagePrice) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.cafeId, cafeId) || other.cafeId == cafeId) &&
            (identical(other.locationLink, locationLink) ||
                other.locationLink == locationLink) &&
            (identical(other.locationlink, locationlink) ||
                other.locationlink == locationlink) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.reviews, reviews) || other.reviews == reviews) &&
            const DeepCollectionEquality().equals(
              other._openingHours,
              _openingHours,
            ) &&
            (identical(other.bookingDayHours, bookingDayHours) ||
                other.bookingDayHours == bookingDayHours));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    category,
    averagePrice,
    image,
    cafeId,
    locationLink,
    locationlink,
    location,
    reviews,
    const DeepCollectionEquality().hash(_openingHours),
    bookingDayHours,
  );

  /// Create a copy of CafeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CafeDataImplCopyWith<_$CafeDataImpl> get copyWith =>
      __$$CafeDataImplCopyWithImpl<_$CafeDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CafeDataImplToJson(this);
  }
}

abstract class _CafeData implements CafeData {
  const factory _CafeData({
    @JsonKey(name: '_id') final String? id,
    final String? name,
    final String? category,
    final int? averagePrice,
    final String? image,
    final String? cafeId,
    final String? locationLink,
    final String? locationlink,
    final LocationModel? location,
    final ReviewModel? reviews,
    final List<OpeningHour>? openingHours,
    final BookingDayHours? bookingDayHours,
  }) = _$CafeDataImpl;

  factory _CafeData.fromJson(Map<String, dynamic> json) =
      _$CafeDataImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get name;
  @override
  String? get category;
  @override
  int? get averagePrice;
  @override
  String? get image;
  @override
  String? get cafeId;
  @override
  String? get locationLink;
  @override
  String? get locationlink;
  @override
  LocationModel? get location;
  @override
  ReviewModel? get reviews;
  @override
  List<OpeningHour>? get openingHours;
  @override
  BookingDayHours? get bookingDayHours;

  /// Create a copy of CafeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CafeDataImplCopyWith<_$CafeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return _LocationModel.fromJson(json);
}

/// @nodoc
mixin _$LocationModel {
  String? get exactLocation => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;

  /// Serializes this LocationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationModelCopyWith<LocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationModelCopyWith<$Res> {
  factory $LocationModelCopyWith(
    LocationModel value,
    $Res Function(LocationModel) then,
  ) = _$LocationModelCopyWithImpl<$Res, LocationModel>;
  @useResult
  $Res call({String? exactLocation, String? region});
}

/// @nodoc
class _$LocationModelCopyWithImpl<$Res, $Val extends LocationModel>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationModel
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
abstract class _$$LocationModelImplCopyWith<$Res>
    implements $LocationModelCopyWith<$Res> {
  factory _$$LocationModelImplCopyWith(
    _$LocationModelImpl value,
    $Res Function(_$LocationModelImpl) then,
  ) = __$$LocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? exactLocation, String? region});
}

/// @nodoc
class __$$LocationModelImplCopyWithImpl<$Res>
    extends _$LocationModelCopyWithImpl<$Res, _$LocationModelImpl>
    implements _$$LocationModelImplCopyWith<$Res> {
  __$$LocationModelImplCopyWithImpl(
    _$LocationModelImpl _value,
    $Res Function(_$LocationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? exactLocation = freezed, Object? region = freezed}) {
    return _then(
      _$LocationModelImpl(
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
class _$LocationModelImpl implements _LocationModel {
  const _$LocationModelImpl({this.exactLocation, this.region});

  factory _$LocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationModelImplFromJson(json);

  @override
  final String? exactLocation;
  @override
  final String? region;

  @override
  String toString() {
    return 'LocationModel(exactLocation: $exactLocation, region: $region)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationModelImpl &&
            (identical(other.exactLocation, exactLocation) ||
                other.exactLocation == exactLocation) &&
            (identical(other.region, region) || other.region == region));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, exactLocation, region);

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      __$$LocationModelImplCopyWithImpl<_$LocationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationModelImplToJson(this);
  }
}

abstract class _LocationModel implements LocationModel {
  const factory _LocationModel({
    final String? exactLocation,
    final String? region,
  }) = _$LocationModelImpl;

  factory _LocationModel.fromJson(Map<String, dynamic> json) =
      _$LocationModelImpl.fromJson;

  @override
  String? get exactLocation;
  @override
  String? get region;

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) {
  return _ReviewModel.fromJson(json);
}

/// @nodoc
mixin _$ReviewModel {
  double? get rating => throw _privateConstructorUsedError;
  int? get reviewCount => throw _privateConstructorUsedError;
  String? get reviewText => throw _privateConstructorUsedError;

  /// Serializes this ReviewModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewModelCopyWith<ReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewModelCopyWith<$Res> {
  factory $ReviewModelCopyWith(
    ReviewModel value,
    $Res Function(ReviewModel) then,
  ) = _$ReviewModelCopyWithImpl<$Res, ReviewModel>;
  @useResult
  $Res call({double? rating, int? reviewCount, String? reviewText});
}

/// @nodoc
class _$ReviewModelCopyWithImpl<$Res, $Val extends ReviewModel>
    implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewModel
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
abstract class _$$ReviewModelImplCopyWith<$Res>
    implements $ReviewModelCopyWith<$Res> {
  factory _$$ReviewModelImplCopyWith(
    _$ReviewModelImpl value,
    $Res Function(_$ReviewModelImpl) then,
  ) = __$$ReviewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? rating, int? reviewCount, String? reviewText});
}

/// @nodoc
class __$$ReviewModelImplCopyWithImpl<$Res>
    extends _$ReviewModelCopyWithImpl<$Res, _$ReviewModelImpl>
    implements _$$ReviewModelImplCopyWith<$Res> {
  __$$ReviewModelImplCopyWithImpl(
    _$ReviewModelImpl _value,
    $Res Function(_$ReviewModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = freezed,
    Object? reviewCount = freezed,
    Object? reviewText = freezed,
  }) {
    return _then(
      _$ReviewModelImpl(
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
class _$ReviewModelImpl implements _ReviewModel {
  const _$ReviewModelImpl({this.rating, this.reviewCount, this.reviewText});

  factory _$ReviewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewModelImplFromJson(json);

  @override
  final double? rating;
  @override
  final int? reviewCount;
  @override
  final String? reviewText;

  @override
  String toString() {
    return 'ReviewModel(rating: $rating, reviewCount: $reviewCount, reviewText: $reviewText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewModelImpl &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.reviewText, reviewText) ||
                other.reviewText == reviewText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rating, reviewCount, reviewText);

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewModelImplCopyWith<_$ReviewModelImpl> get copyWith =>
      __$$ReviewModelImplCopyWithImpl<_$ReviewModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewModelImplToJson(this);
  }
}

abstract class _ReviewModel implements ReviewModel {
  const factory _ReviewModel({
    final double? rating,
    final int? reviewCount,
    final String? reviewText,
  }) = _$ReviewModelImpl;

  factory _ReviewModel.fromJson(Map<String, dynamic> json) =
      _$ReviewModelImpl.fromJson;

  @override
  double? get rating;
  @override
  int? get reviewCount;
  @override
  String? get reviewText;

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewModelImplCopyWith<_$ReviewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpeningHour _$OpeningHourFromJson(Map<String, dynamic> json) {
  return _OpeningHour.fromJson(json);
}

/// @nodoc
mixin _$OpeningHour {
  String? get day => throw _privateConstructorUsedError;
  String? get openingTime => throw _privateConstructorUsedError;
  String? get closingTime => throw _privateConstructorUsedError;
  bool? get isClosed => throw _privateConstructorUsedError;

  /// Serializes this OpeningHour to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpeningHour
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpeningHourCopyWith<OpeningHour> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpeningHourCopyWith<$Res> {
  factory $OpeningHourCopyWith(
    OpeningHour value,
    $Res Function(OpeningHour) then,
  ) = _$OpeningHourCopyWithImpl<$Res, OpeningHour>;
  @useResult
  $Res call({
    String? day,
    String? openingTime,
    String? closingTime,
    bool? isClosed,
  });
}

/// @nodoc
class _$OpeningHourCopyWithImpl<$Res, $Val extends OpeningHour>
    implements $OpeningHourCopyWith<$Res> {
  _$OpeningHourCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpeningHour
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? openingTime = freezed,
    Object? closingTime = freezed,
    Object? isClosed = freezed,
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
            isClosed: freezed == isClosed
                ? _value.isClosed
                : isClosed // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OpeningHourImplCopyWith<$Res>
    implements $OpeningHourCopyWith<$Res> {
  factory _$$OpeningHourImplCopyWith(
    _$OpeningHourImpl value,
    $Res Function(_$OpeningHourImpl) then,
  ) = __$$OpeningHourImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? day,
    String? openingTime,
    String? closingTime,
    bool? isClosed,
  });
}

/// @nodoc
class __$$OpeningHourImplCopyWithImpl<$Res>
    extends _$OpeningHourCopyWithImpl<$Res, _$OpeningHourImpl>
    implements _$$OpeningHourImplCopyWith<$Res> {
  __$$OpeningHourImplCopyWithImpl(
    _$OpeningHourImpl _value,
    $Res Function(_$OpeningHourImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpeningHour
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? openingTime = freezed,
    Object? closingTime = freezed,
    Object? isClosed = freezed,
  }) {
    return _then(
      _$OpeningHourImpl(
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
        isClosed: freezed == isClosed
            ? _value.isClosed
            : isClosed // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OpeningHourImpl implements _OpeningHour {
  const _$OpeningHourImpl({
    this.day,
    this.openingTime,
    this.closingTime,
    this.isClosed,
  });

  factory _$OpeningHourImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpeningHourImplFromJson(json);

  @override
  final String? day;
  @override
  final String? openingTime;
  @override
  final String? closingTime;
  @override
  final bool? isClosed;

  @override
  String toString() {
    return 'OpeningHour(day: $day, openingTime: $openingTime, closingTime: $closingTime, isClosed: $isClosed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpeningHourImpl &&
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

  /// Create a copy of OpeningHour
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpeningHourImplCopyWith<_$OpeningHourImpl> get copyWith =>
      __$$OpeningHourImplCopyWithImpl<_$OpeningHourImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpeningHourImplToJson(this);
  }
}

abstract class _OpeningHour implements OpeningHour {
  const factory _OpeningHour({
    final String? day,
    final String? openingTime,
    final String? closingTime,
    final bool? isClosed,
  }) = _$OpeningHourImpl;

  factory _OpeningHour.fromJson(Map<String, dynamic> json) =
      _$OpeningHourImpl.fromJson;

  @override
  String? get day;
  @override
  String? get openingTime;
  @override
  String? get closingTime;
  @override
  bool? get isClosed;

  /// Create a copy of OpeningHour
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpeningHourImplCopyWith<_$OpeningHourImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookingDayHours _$BookingDayHoursFromJson(Map<String, dynamic> json) {
  return _BookingDayHours.fromJson(json);
}

/// @nodoc
mixin _$BookingDayHours {
  String? get openingTime => throw _privateConstructorUsedError;
  String? get closingTime => throw _privateConstructorUsedError;
  bool? get isClosed => throw _privateConstructorUsedError;
  String? get formatted => throw _privateConstructorUsedError;

  /// Serializes this BookingDayHours to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookingDayHours
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingDayHoursCopyWith<BookingDayHours> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingDayHoursCopyWith<$Res> {
  factory $BookingDayHoursCopyWith(
    BookingDayHours value,
    $Res Function(BookingDayHours) then,
  ) = _$BookingDayHoursCopyWithImpl<$Res, BookingDayHours>;
  @useResult
  $Res call({
    String? openingTime,
    String? closingTime,
    bool? isClosed,
    String? formatted,
  });
}

/// @nodoc
class _$BookingDayHoursCopyWithImpl<$Res, $Val extends BookingDayHours>
    implements $BookingDayHoursCopyWith<$Res> {
  _$BookingDayHoursCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingDayHours
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openingTime = freezed,
    Object? closingTime = freezed,
    Object? isClosed = freezed,
    Object? formatted = freezed,
  }) {
    return _then(
      _value.copyWith(
            openingTime: freezed == openingTime
                ? _value.openingTime
                : openingTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            closingTime: freezed == closingTime
                ? _value.closingTime
                : closingTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            isClosed: freezed == isClosed
                ? _value.isClosed
                : isClosed // ignore: cast_nullable_to_non_nullable
                      as bool?,
            formatted: freezed == formatted
                ? _value.formatted
                : formatted // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookingDayHoursImplCopyWith<$Res>
    implements $BookingDayHoursCopyWith<$Res> {
  factory _$$BookingDayHoursImplCopyWith(
    _$BookingDayHoursImpl value,
    $Res Function(_$BookingDayHoursImpl) then,
  ) = __$$BookingDayHoursImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? openingTime,
    String? closingTime,
    bool? isClosed,
    String? formatted,
  });
}

/// @nodoc
class __$$BookingDayHoursImplCopyWithImpl<$Res>
    extends _$BookingDayHoursCopyWithImpl<$Res, _$BookingDayHoursImpl>
    implements _$$BookingDayHoursImplCopyWith<$Res> {
  __$$BookingDayHoursImplCopyWithImpl(
    _$BookingDayHoursImpl _value,
    $Res Function(_$BookingDayHoursImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingDayHours
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openingTime = freezed,
    Object? closingTime = freezed,
    Object? isClosed = freezed,
    Object? formatted = freezed,
  }) {
    return _then(
      _$BookingDayHoursImpl(
        openingTime: freezed == openingTime
            ? _value.openingTime
            : openingTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        closingTime: freezed == closingTime
            ? _value.closingTime
            : closingTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        isClosed: freezed == isClosed
            ? _value.isClosed
            : isClosed // ignore: cast_nullable_to_non_nullable
                  as bool?,
        formatted: freezed == formatted
            ? _value.formatted
            : formatted // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingDayHoursImpl implements _BookingDayHours {
  const _$BookingDayHoursImpl({
    this.openingTime,
    this.closingTime,
    this.isClosed,
    this.formatted,
  });

  factory _$BookingDayHoursImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingDayHoursImplFromJson(json);

  @override
  final String? openingTime;
  @override
  final String? closingTime;
  @override
  final bool? isClosed;
  @override
  final String? formatted;

  @override
  String toString() {
    return 'BookingDayHours(openingTime: $openingTime, closingTime: $closingTime, isClosed: $isClosed, formatted: $formatted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingDayHoursImpl &&
            (identical(other.openingTime, openingTime) ||
                other.openingTime == openingTime) &&
            (identical(other.closingTime, closingTime) ||
                other.closingTime == closingTime) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed) &&
            (identical(other.formatted, formatted) ||
                other.formatted == formatted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, openingTime, closingTime, isClosed, formatted);

  /// Create a copy of BookingDayHours
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingDayHoursImplCopyWith<_$BookingDayHoursImpl> get copyWith =>
      __$$BookingDayHoursImplCopyWithImpl<_$BookingDayHoursImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingDayHoursImplToJson(this);
  }
}

abstract class _BookingDayHours implements BookingDayHours {
  const factory _BookingDayHours({
    final String? openingTime,
    final String? closingTime,
    final bool? isClosed,
    final String? formatted,
  }) = _$BookingDayHoursImpl;

  factory _BookingDayHours.fromJson(Map<String, dynamic> json) =
      _$BookingDayHoursImpl.fromJson;

  @override
  String? get openingTime;
  @override
  String? get closingTime;
  @override
  bool? get isClosed;
  @override
  String? get formatted;

  /// Create a copy of BookingDayHours
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingDayHoursImplCopyWith<_$BookingDayHoursImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FormattedBookingDate _$FormattedBookingDateFromJson(Map<String, dynamic> json) {
  return _FormattedBookingDate.fromJson(json);
}

/// @nodoc
mixin _$FormattedBookingDate {
  String? get date => throw _privateConstructorUsedError;
  String? get dateShort => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String? get dayName => throw _privateConstructorUsedError;
  String? get iso => throw _privateConstructorUsedError;

  /// Serializes this FormattedBookingDate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FormattedBookingDate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormattedBookingDateCopyWith<FormattedBookingDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormattedBookingDateCopyWith<$Res> {
  factory $FormattedBookingDateCopyWith(
    FormattedBookingDate value,
    $Res Function(FormattedBookingDate) then,
  ) = _$FormattedBookingDateCopyWithImpl<$Res, FormattedBookingDate>;
  @useResult
  $Res call({
    String? date,
    String? dateShort,
    String? time,
    String? dayName,
    String? iso,
  });
}

/// @nodoc
class _$FormattedBookingDateCopyWithImpl<
  $Res,
  $Val extends FormattedBookingDate
>
    implements $FormattedBookingDateCopyWith<$Res> {
  _$FormattedBookingDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormattedBookingDate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? dateShort = freezed,
    Object? time = freezed,
    Object? dayName = freezed,
    Object? iso = freezed,
  }) {
    return _then(
      _value.copyWith(
            date: freezed == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateShort: freezed == dateShort
                ? _value.dateShort
                : dateShort // ignore: cast_nullable_to_non_nullable
                      as String?,
            time: freezed == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as String?,
            dayName: freezed == dayName
                ? _value.dayName
                : dayName // ignore: cast_nullable_to_non_nullable
                      as String?,
            iso: freezed == iso
                ? _value.iso
                : iso // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FormattedBookingDateImplCopyWith<$Res>
    implements $FormattedBookingDateCopyWith<$Res> {
  factory _$$FormattedBookingDateImplCopyWith(
    _$FormattedBookingDateImpl value,
    $Res Function(_$FormattedBookingDateImpl) then,
  ) = __$$FormattedBookingDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? date,
    String? dateShort,
    String? time,
    String? dayName,
    String? iso,
  });
}

/// @nodoc
class __$$FormattedBookingDateImplCopyWithImpl<$Res>
    extends _$FormattedBookingDateCopyWithImpl<$Res, _$FormattedBookingDateImpl>
    implements _$$FormattedBookingDateImplCopyWith<$Res> {
  __$$FormattedBookingDateImplCopyWithImpl(
    _$FormattedBookingDateImpl _value,
    $Res Function(_$FormattedBookingDateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FormattedBookingDate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? dateShort = freezed,
    Object? time = freezed,
    Object? dayName = freezed,
    Object? iso = freezed,
  }) {
    return _then(
      _$FormattedBookingDateImpl(
        date: freezed == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateShort: freezed == dateShort
            ? _value.dateShort
            : dateShort // ignore: cast_nullable_to_non_nullable
                  as String?,
        time: freezed == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as String?,
        dayName: freezed == dayName
            ? _value.dayName
            : dayName // ignore: cast_nullable_to_non_nullable
                  as String?,
        iso: freezed == iso
            ? _value.iso
            : iso // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FormattedBookingDateImpl implements _FormattedBookingDate {
  const _$FormattedBookingDateImpl({
    this.date,
    this.dateShort,
    this.time,
    this.dayName,
    this.iso,
  });

  factory _$FormattedBookingDateImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormattedBookingDateImplFromJson(json);

  @override
  final String? date;
  @override
  final String? dateShort;
  @override
  final String? time;
  @override
  final String? dayName;
  @override
  final String? iso;

  @override
  String toString() {
    return 'FormattedBookingDate(date: $date, dateShort: $dateShort, time: $time, dayName: $dayName, iso: $iso)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormattedBookingDateImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dateShort, dateShort) ||
                other.dateShort == dateShort) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.dayName, dayName) || other.dayName == dayName) &&
            (identical(other.iso, iso) || other.iso == iso));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, dateShort, time, dayName, iso);

  /// Create a copy of FormattedBookingDate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormattedBookingDateImplCopyWith<_$FormattedBookingDateImpl>
  get copyWith =>
      __$$FormattedBookingDateImplCopyWithImpl<_$FormattedBookingDateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FormattedBookingDateImplToJson(this);
  }
}

abstract class _FormattedBookingDate implements FormattedBookingDate {
  const factory _FormattedBookingDate({
    final String? date,
    final String? dateShort,
    final String? time,
    final String? dayName,
    final String? iso,
  }) = _$FormattedBookingDateImpl;

  factory _FormattedBookingDate.fromJson(Map<String, dynamic> json) =
      _$FormattedBookingDateImpl.fromJson;

  @override
  String? get date;
  @override
  String? get dateShort;
  @override
  String? get time;
  @override
  String? get dayName;
  @override
  String? get iso;

  /// Create a copy of FormattedBookingDate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormattedBookingDateImplCopyWith<_$FormattedBookingDateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
