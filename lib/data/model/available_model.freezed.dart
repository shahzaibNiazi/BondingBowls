// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AvailableModel _$AvailableModelFromJson(Map<String, dynamic> json) {
  return _AvailableModel.fromJson(json);
}

/// @nodoc
mixin _$AvailableModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  UserRefModel? get userId => throw _privateConstructorUsedError;
  CafeDataModel? get cafeId => throw _privateConstructorUsedError;
  List<String>? get lookingFor => throw _privateConstructorUsedError;
  List<String>? get availableFor => throw _privateConstructorUsedError;
  DateTime? get bookingDate => throw _privateConstructorUsedError;
  String? get additionalNotes => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get matchedUserId => throw _privateConstructorUsedError;
  DateTime? get matchedAt => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  String? get cancelledBy => throw _privateConstructorUsedError;
  DateTime? get cancelledAt => throw _privateConstructorUsedError;
  DateTime? get confirmedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int? get v => throw _privateConstructorUsedError;
  bool? get isExpired => throw _privateConstructorUsedError;
  bool? get hasJoinRequest => throw _privateConstructorUsedError;
  String? get joinRequestId => throw _privateConstructorUsedError;
  String? get joinRequestStatus => throw _privateConstructorUsedError;

  /// Serializes this AvailableModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvailableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailableModelCopyWith<AvailableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableModelCopyWith<$Res> {
  factory $AvailableModelCopyWith(
    AvailableModel value,
    $Res Function(AvailableModel) then,
  ) = _$AvailableModelCopyWithImpl<$Res, AvailableModel>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    UserRefModel? userId,
    CafeDataModel? cafeId,
    List<String>? lookingFor,
    List<String>? availableFor,
    DateTime? bookingDate,
    String? additionalNotes,
    String? status,
    String? matchedUserId,
    DateTime? matchedAt,
    DateTime? expiresAt,
    String? cancelledBy,
    DateTime? cancelledAt,
    DateTime? confirmedAt,
    DateTime? completedAt,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    @JsonKey(name: '__v') int? v,
    bool? isExpired,
    bool? hasJoinRequest,
    String? joinRequestId,
    String? joinRequestStatus,
  });

  $UserRefModelCopyWith<$Res>? get userId;
  $CafeDataModelCopyWith<$Res>? get cafeId;
}

/// @nodoc
class _$AvailableModelCopyWithImpl<$Res, $Val extends AvailableModel>
    implements $AvailableModelCopyWith<$Res> {
  _$AvailableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailableModel
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
    Object? expiresAt = freezed,
    Object? cancelledBy = freezed,
    Object? cancelledAt = freezed,
    Object? confirmedAt = freezed,
    Object? completedAt = freezed,
    Object? isDeleted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
    Object? isExpired = freezed,
    Object? hasJoinRequest = freezed,
    Object? joinRequestId = freezed,
    Object? joinRequestStatus = freezed,
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
                      as UserRefModel?,
            cafeId: freezed == cafeId
                ? _value.cafeId
                : cafeId // ignore: cast_nullable_to_non_nullable
                      as CafeDataModel?,
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
            expiresAt: freezed == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
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
            hasJoinRequest: freezed == hasJoinRequest
                ? _value.hasJoinRequest
                : hasJoinRequest // ignore: cast_nullable_to_non_nullable
                      as bool?,
            joinRequestId: freezed == joinRequestId
                ? _value.joinRequestId
                : joinRequestId // ignore: cast_nullable_to_non_nullable
                      as String?,
            joinRequestStatus: freezed == joinRequestStatus
                ? _value.joinRequestStatus
                : joinRequestStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of AvailableModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserRefModelCopyWith<$Res>? get userId {
    if (_value.userId == null) {
      return null;
    }

    return $UserRefModelCopyWith<$Res>(_value.userId!, (value) {
      return _then(_value.copyWith(userId: value) as $Val);
    });
  }

  /// Create a copy of AvailableModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CafeDataModelCopyWith<$Res>? get cafeId {
    if (_value.cafeId == null) {
      return null;
    }

    return $CafeDataModelCopyWith<$Res>(_value.cafeId!, (value) {
      return _then(_value.copyWith(cafeId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AvailableModelImplCopyWith<$Res>
    implements $AvailableModelCopyWith<$Res> {
  factory _$$AvailableModelImplCopyWith(
    _$AvailableModelImpl value,
    $Res Function(_$AvailableModelImpl) then,
  ) = __$$AvailableModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    UserRefModel? userId,
    CafeDataModel? cafeId,
    List<String>? lookingFor,
    List<String>? availableFor,
    DateTime? bookingDate,
    String? additionalNotes,
    String? status,
    String? matchedUserId,
    DateTime? matchedAt,
    DateTime? expiresAt,
    String? cancelledBy,
    DateTime? cancelledAt,
    DateTime? confirmedAt,
    DateTime? completedAt,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    @JsonKey(name: '__v') int? v,
    bool? isExpired,
    bool? hasJoinRequest,
    String? joinRequestId,
    String? joinRequestStatus,
  });

  @override
  $UserRefModelCopyWith<$Res>? get userId;
  @override
  $CafeDataModelCopyWith<$Res>? get cafeId;
}

/// @nodoc
class __$$AvailableModelImplCopyWithImpl<$Res>
    extends _$AvailableModelCopyWithImpl<$Res, _$AvailableModelImpl>
    implements _$$AvailableModelImplCopyWith<$Res> {
  __$$AvailableModelImplCopyWithImpl(
    _$AvailableModelImpl _value,
    $Res Function(_$AvailableModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AvailableModel
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
    Object? expiresAt = freezed,
    Object? cancelledBy = freezed,
    Object? cancelledAt = freezed,
    Object? confirmedAt = freezed,
    Object? completedAt = freezed,
    Object? isDeleted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
    Object? isExpired = freezed,
    Object? hasJoinRequest = freezed,
    Object? joinRequestId = freezed,
    Object? joinRequestStatus = freezed,
  }) {
    return _then(
      _$AvailableModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as UserRefModel?,
        cafeId: freezed == cafeId
            ? _value.cafeId
            : cafeId // ignore: cast_nullable_to_non_nullable
                  as CafeDataModel?,
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
        expiresAt: freezed == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
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
        hasJoinRequest: freezed == hasJoinRequest
            ? _value.hasJoinRequest
            : hasJoinRequest // ignore: cast_nullable_to_non_nullable
                  as bool?,
        joinRequestId: freezed == joinRequestId
            ? _value.joinRequestId
            : joinRequestId // ignore: cast_nullable_to_non_nullable
                  as String?,
        joinRequestStatus: freezed == joinRequestStatus
            ? _value.joinRequestStatus
            : joinRequestStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailableModelImpl implements _AvailableModel {
  const _$AvailableModelImpl({
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
    this.expiresAt,
    this.cancelledBy,
    this.cancelledAt,
    this.confirmedAt,
    this.completedAt,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    @JsonKey(name: '__v') this.v,
    this.isExpired,
    this.hasJoinRequest,
    this.joinRequestId,
    this.joinRequestStatus,
  }) : _lookingFor = lookingFor,
       _availableFor = availableFor;

  factory _$AvailableModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailableModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final UserRefModel? userId;
  @override
  final CafeDataModel? cafeId;
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
  final DateTime? expiresAt;
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
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey(name: '__v')
  final int? v;
  @override
  final bool? isExpired;
  @override
  final bool? hasJoinRequest;
  @override
  final String? joinRequestId;
  @override
  final String? joinRequestStatus;

  @override
  String toString() {
    return 'AvailableModel(id: $id, userId: $userId, cafeId: $cafeId, lookingFor: $lookingFor, availableFor: $availableFor, bookingDate: $bookingDate, additionalNotes: $additionalNotes, status: $status, matchedUserId: $matchedUserId, matchedAt: $matchedAt, expiresAt: $expiresAt, cancelledBy: $cancelledBy, cancelledAt: $cancelledAt, confirmedAt: $confirmedAt, completedAt: $completedAt, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, isExpired: $isExpired, hasJoinRequest: $hasJoinRequest, joinRequestId: $joinRequestId, joinRequestStatus: $joinRequestStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableModelImpl &&
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
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
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
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v) &&
            (identical(other.isExpired, isExpired) ||
                other.isExpired == isExpired) &&
            (identical(other.hasJoinRequest, hasJoinRequest) ||
                other.hasJoinRequest == hasJoinRequest) &&
            (identical(other.joinRequestId, joinRequestId) ||
                other.joinRequestId == joinRequestId) &&
            (identical(other.joinRequestStatus, joinRequestStatus) ||
                other.joinRequestStatus == joinRequestStatus));
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
    expiresAt,
    cancelledBy,
    cancelledAt,
    confirmedAt,
    completedAt,
    isDeleted,
    createdAt,
    updatedAt,
    v,
    isExpired,
    hasJoinRequest,
    joinRequestId,
    joinRequestStatus,
  ]);

  /// Create a copy of AvailableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableModelImplCopyWith<_$AvailableModelImpl> get copyWith =>
      __$$AvailableModelImplCopyWithImpl<_$AvailableModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailableModelImplToJson(this);
  }
}

abstract class _AvailableModel implements AvailableModel {
  const factory _AvailableModel({
    @JsonKey(name: '_id') final String? id,
    final UserRefModel? userId,
    final CafeDataModel? cafeId,
    final List<String>? lookingFor,
    final List<String>? availableFor,
    final DateTime? bookingDate,
    final String? additionalNotes,
    final String? status,
    final String? matchedUserId,
    final DateTime? matchedAt,
    final DateTime? expiresAt,
    final String? cancelledBy,
    final DateTime? cancelledAt,
    final DateTime? confirmedAt,
    final DateTime? completedAt,
    final bool? isDeleted,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    @JsonKey(name: '__v') final int? v,
    final bool? isExpired,
    final bool? hasJoinRequest,
    final String? joinRequestId,
    final String? joinRequestStatus,
  }) = _$AvailableModelImpl;

  factory _AvailableModel.fromJson(Map<String, dynamic> json) =
      _$AvailableModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  UserRefModel? get userId;
  @override
  CafeDataModel? get cafeId;
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
  DateTime? get expiresAt;
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
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(name: '__v')
  int? get v;
  @override
  bool? get isExpired;
  @override
  bool? get hasJoinRequest;
  @override
  String? get joinRequestId;
  @override
  String? get joinRequestStatus;

  /// Create a copy of AvailableModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailableModelImplCopyWith<_$AvailableModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserRefModel _$UserRefModelFromJson(Map<String, dynamic> json) {
  return _UserRefModel.fromJson(json);
}

/// @nodoc
mixin _$UserRefModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get profilePhoto => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get datingIntentions => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  String? get dateOfBirth => throw _privateConstructorUsedError;
  String? get maritalStatus => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get occupation => throw _privateConstructorUsedError;
  String? get preferredGender => throw _privateConstructorUsedError;

  /// Serializes this UserRefModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserRefModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRefModelCopyWith<UserRefModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRefModelCopyWith<$Res> {
  factory $UserRefModelCopyWith(
    UserRefModel value,
    $Res Function(UserRefModel) then,
  ) = _$UserRefModelCopyWithImpl<$Res, UserRefModel>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? profilePhoto,
    String? email,
    String? datingIntentions,
    int? age,
    String? dateOfBirth,
    String? maritalStatus,
    String? bio,
    String? fullName,
    String? location,
    String? occupation,
    String? preferredGender,
  });
}

/// @nodoc
class _$UserRefModelCopyWithImpl<$Res, $Val extends UserRefModel>
    implements $UserRefModelCopyWith<$Res> {
  _$UserRefModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRefModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? profilePhoto = freezed,
    Object? email = freezed,
    Object? datingIntentions = freezed,
    Object? age = freezed,
    Object? dateOfBirth = freezed,
    Object? maritalStatus = freezed,
    Object? bio = freezed,
    Object? fullName = freezed,
    Object? location = freezed,
    Object? occupation = freezed,
    Object? preferredGender = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            profilePhoto: freezed == profilePhoto
                ? _value.profilePhoto
                : profilePhoto // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            datingIntentions: freezed == datingIntentions
                ? _value.datingIntentions
                : datingIntentions // ignore: cast_nullable_to_non_nullable
                      as String?,
            age: freezed == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int?,
            dateOfBirth: freezed == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                      as String?,
            maritalStatus: freezed == maritalStatus
                ? _value.maritalStatus
                : maritalStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            bio: freezed == bio
                ? _value.bio
                : bio // ignore: cast_nullable_to_non_nullable
                      as String?,
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            occupation: freezed == occupation
                ? _value.occupation
                : occupation // ignore: cast_nullable_to_non_nullable
                      as String?,
            preferredGender: freezed == preferredGender
                ? _value.preferredGender
                : preferredGender // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserRefModelImplCopyWith<$Res>
    implements $UserRefModelCopyWith<$Res> {
  factory _$$UserRefModelImplCopyWith(
    _$UserRefModelImpl value,
    $Res Function(_$UserRefModelImpl) then,
  ) = __$$UserRefModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? profilePhoto,
    String? email,
    String? datingIntentions,
    int? age,
    String? dateOfBirth,
    String? maritalStatus,
    String? bio,
    String? fullName,
    String? location,
    String? occupation,
    String? preferredGender,
  });
}

/// @nodoc
class __$$UserRefModelImplCopyWithImpl<$Res>
    extends _$UserRefModelCopyWithImpl<$Res, _$UserRefModelImpl>
    implements _$$UserRefModelImplCopyWith<$Res> {
  __$$UserRefModelImplCopyWithImpl(
    _$UserRefModelImpl _value,
    $Res Function(_$UserRefModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserRefModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? profilePhoto = freezed,
    Object? email = freezed,
    Object? datingIntentions = freezed,
    Object? age = freezed,
    Object? dateOfBirth = freezed,
    Object? maritalStatus = freezed,
    Object? bio = freezed,
    Object? fullName = freezed,
    Object? location = freezed,
    Object? occupation = freezed,
    Object? preferredGender = freezed,
  }) {
    return _then(
      _$UserRefModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        profilePhoto: freezed == profilePhoto
            ? _value.profilePhoto
            : profilePhoto // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        datingIntentions: freezed == datingIntentions
            ? _value.datingIntentions
            : datingIntentions // ignore: cast_nullable_to_non_nullable
                  as String?,
        age: freezed == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int?,
        dateOfBirth: freezed == dateOfBirth
            ? _value.dateOfBirth
            : dateOfBirth // ignore: cast_nullable_to_non_nullable
                  as String?,
        maritalStatus: freezed == maritalStatus
            ? _value.maritalStatus
            : maritalStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        bio: freezed == bio
            ? _value.bio
            : bio // ignore: cast_nullable_to_non_nullable
                  as String?,
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        occupation: freezed == occupation
            ? _value.occupation
            : occupation // ignore: cast_nullable_to_non_nullable
                  as String?,
        preferredGender: freezed == preferredGender
            ? _value.preferredGender
            : preferredGender // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRefModelImpl implements _UserRefModel {
  const _$UserRefModelImpl({
    @JsonKey(name: '_id') this.id,
    this.profilePhoto,
    this.email,
    this.datingIntentions,
    this.age,
    this.dateOfBirth,
    this.maritalStatus,
    this.bio,
    this.fullName,
    this.location,
    this.occupation,
    this.preferredGender,
  });

  factory _$UserRefModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRefModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? profilePhoto;
  @override
  final String? email;
  @override
  final String? datingIntentions;
  @override
  final int? age;
  @override
  final String? dateOfBirth;
  @override
  final String? maritalStatus;
  @override
  final String? bio;
  @override
  final String? fullName;
  @override
  final String? location;
  @override
  final String? occupation;
  @override
  final String? preferredGender;

  @override
  String toString() {
    return 'UserRefModel(id: $id, profilePhoto: $profilePhoto, email: $email, datingIntentions: $datingIntentions, age: $age, dateOfBirth: $dateOfBirth, maritalStatus: $maritalStatus, bio: $bio, fullName: $fullName, location: $location, occupation: $occupation, preferredGender: $preferredGender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRefModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.datingIntentions, datingIntentions) ||
                other.datingIntentions == datingIntentions) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.maritalStatus, maritalStatus) ||
                other.maritalStatus == maritalStatus) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.occupation, occupation) ||
                other.occupation == occupation) &&
            (identical(other.preferredGender, preferredGender) ||
                other.preferredGender == preferredGender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    profilePhoto,
    email,
    datingIntentions,
    age,
    dateOfBirth,
    maritalStatus,
    bio,
    fullName,
    location,
    occupation,
    preferredGender,
  );

  /// Create a copy of UserRefModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRefModelImplCopyWith<_$UserRefModelImpl> get copyWith =>
      __$$UserRefModelImplCopyWithImpl<_$UserRefModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRefModelImplToJson(this);
  }
}

abstract class _UserRefModel implements UserRefModel {
  const factory _UserRefModel({
    @JsonKey(name: '_id') final String? id,
    final String? profilePhoto,
    final String? email,
    final String? datingIntentions,
    final int? age,
    final String? dateOfBirth,
    final String? maritalStatus,
    final String? bio,
    final String? fullName,
    final String? location,
    final String? occupation,
    final String? preferredGender,
  }) = _$UserRefModelImpl;

  factory _UserRefModel.fromJson(Map<String, dynamic> json) =
      _$UserRefModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get profilePhoto;
  @override
  String? get email;
  @override
  String? get datingIntentions;
  @override
  int? get age;
  @override
  String? get dateOfBirth;
  @override
  String? get maritalStatus;
  @override
  String? get bio;
  @override
  String? get fullName;
  @override
  String? get location;
  @override
  String? get occupation;
  @override
  String? get preferredGender;

  /// Create a copy of UserRefModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRefModelImplCopyWith<_$UserRefModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CafeDataModel _$CafeDataModelFromJson(Map<String, dynamic> json) {
  return _CafeDataModel.fromJson(json);
}

/// @nodoc
mixin _$CafeDataModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  CafeLocationModel? get location => throw _privateConstructorUsedError;
  CafeReviewModel? get reviews => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  num? get averagePrice => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this CafeDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CafeDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CafeDataModelCopyWith<CafeDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CafeDataModelCopyWith<$Res> {
  factory $CafeDataModelCopyWith(
    CafeDataModel value,
    $Res Function(CafeDataModel) then,
  ) = _$CafeDataModelCopyWithImpl<$Res, CafeDataModel>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    CafeLocationModel? location,
    CafeReviewModel? reviews,
    String? name,
    String? category,
    num? averagePrice,
    String? image,
  });

  $CafeLocationModelCopyWith<$Res>? get location;
  $CafeReviewModelCopyWith<$Res>? get reviews;
}

/// @nodoc
class _$CafeDataModelCopyWithImpl<$Res, $Val extends CafeDataModel>
    implements $CafeDataModelCopyWith<$Res> {
  _$CafeDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CafeDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? location = freezed,
    Object? reviews = freezed,
    Object? name = freezed,
    Object? category = freezed,
    Object? averagePrice = freezed,
    Object? image = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as CafeLocationModel?,
            reviews: freezed == reviews
                ? _value.reviews
                : reviews // ignore: cast_nullable_to_non_nullable
                      as CafeReviewModel?,
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
                      as num?,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of CafeDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CafeLocationModelCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $CafeLocationModelCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  /// Create a copy of CafeDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CafeReviewModelCopyWith<$Res>? get reviews {
    if (_value.reviews == null) {
      return null;
    }

    return $CafeReviewModelCopyWith<$Res>(_value.reviews!, (value) {
      return _then(_value.copyWith(reviews: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CafeDataModelImplCopyWith<$Res>
    implements $CafeDataModelCopyWith<$Res> {
  factory _$$CafeDataModelImplCopyWith(
    _$CafeDataModelImpl value,
    $Res Function(_$CafeDataModelImpl) then,
  ) = __$$CafeDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    CafeLocationModel? location,
    CafeReviewModel? reviews,
    String? name,
    String? category,
    num? averagePrice,
    String? image,
  });

  @override
  $CafeLocationModelCopyWith<$Res>? get location;
  @override
  $CafeReviewModelCopyWith<$Res>? get reviews;
}

/// @nodoc
class __$$CafeDataModelImplCopyWithImpl<$Res>
    extends _$CafeDataModelCopyWithImpl<$Res, _$CafeDataModelImpl>
    implements _$$CafeDataModelImplCopyWith<$Res> {
  __$$CafeDataModelImplCopyWithImpl(
    _$CafeDataModelImpl _value,
    $Res Function(_$CafeDataModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CafeDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? location = freezed,
    Object? reviews = freezed,
    Object? name = freezed,
    Object? category = freezed,
    Object? averagePrice = freezed,
    Object? image = freezed,
  }) {
    return _then(
      _$CafeDataModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as CafeLocationModel?,
        reviews: freezed == reviews
            ? _value.reviews
            : reviews // ignore: cast_nullable_to_non_nullable
                  as CafeReviewModel?,
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
                  as num?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CafeDataModelImpl implements _CafeDataModel {
  const _$CafeDataModelImpl({
    @JsonKey(name: '_id') this.id,
    this.location,
    this.reviews,
    this.name,
    this.category,
    this.averagePrice,
    this.image,
  });

  factory _$CafeDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CafeDataModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final CafeLocationModel? location;
  @override
  final CafeReviewModel? reviews;
  @override
  final String? name;
  @override
  final String? category;
  @override
  final num? averagePrice;
  @override
  final String? image;

  @override
  String toString() {
    return 'CafeDataModel(id: $id, location: $location, reviews: $reviews, name: $name, category: $category, averagePrice: $averagePrice, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CafeDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.reviews, reviews) || other.reviews == reviews) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.averagePrice, averagePrice) ||
                other.averagePrice == averagePrice) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    location,
    reviews,
    name,
    category,
    averagePrice,
    image,
  );

  /// Create a copy of CafeDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CafeDataModelImplCopyWith<_$CafeDataModelImpl> get copyWith =>
      __$$CafeDataModelImplCopyWithImpl<_$CafeDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CafeDataModelImplToJson(this);
  }
}

abstract class _CafeDataModel implements CafeDataModel {
  const factory _CafeDataModel({
    @JsonKey(name: '_id') final String? id,
    final CafeLocationModel? location,
    final CafeReviewModel? reviews,
    final String? name,
    final String? category,
    final num? averagePrice,
    final String? image,
  }) = _$CafeDataModelImpl;

  factory _CafeDataModel.fromJson(Map<String, dynamic> json) =
      _$CafeDataModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  CafeLocationModel? get location;
  @override
  CafeReviewModel? get reviews;
  @override
  String? get name;
  @override
  String? get category;
  @override
  num? get averagePrice;
  @override
  String? get image;

  /// Create a copy of CafeDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CafeDataModelImplCopyWith<_$CafeDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CafeLocationModel _$CafeLocationModelFromJson(Map<String, dynamic> json) {
  return _CafeLocationModel.fromJson(json);
}

/// @nodoc
mixin _$CafeLocationModel {
  String? get exactLocation => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;

  /// Serializes this CafeLocationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CafeLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CafeLocationModelCopyWith<CafeLocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CafeLocationModelCopyWith<$Res> {
  factory $CafeLocationModelCopyWith(
    CafeLocationModel value,
    $Res Function(CafeLocationModel) then,
  ) = _$CafeLocationModelCopyWithImpl<$Res, CafeLocationModel>;
  @useResult
  $Res call({String? exactLocation, String? region});
}

/// @nodoc
class _$CafeLocationModelCopyWithImpl<$Res, $Val extends CafeLocationModel>
    implements $CafeLocationModelCopyWith<$Res> {
  _$CafeLocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CafeLocationModel
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
abstract class _$$CafeLocationModelImplCopyWith<$Res>
    implements $CafeLocationModelCopyWith<$Res> {
  factory _$$CafeLocationModelImplCopyWith(
    _$CafeLocationModelImpl value,
    $Res Function(_$CafeLocationModelImpl) then,
  ) = __$$CafeLocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? exactLocation, String? region});
}

/// @nodoc
class __$$CafeLocationModelImplCopyWithImpl<$Res>
    extends _$CafeLocationModelCopyWithImpl<$Res, _$CafeLocationModelImpl>
    implements _$$CafeLocationModelImplCopyWith<$Res> {
  __$$CafeLocationModelImplCopyWithImpl(
    _$CafeLocationModelImpl _value,
    $Res Function(_$CafeLocationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CafeLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? exactLocation = freezed, Object? region = freezed}) {
    return _then(
      _$CafeLocationModelImpl(
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
class _$CafeLocationModelImpl implements _CafeLocationModel {
  const _$CafeLocationModelImpl({this.exactLocation, this.region});

  factory _$CafeLocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CafeLocationModelImplFromJson(json);

  @override
  final String? exactLocation;
  @override
  final String? region;

  @override
  String toString() {
    return 'CafeLocationModel(exactLocation: $exactLocation, region: $region)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CafeLocationModelImpl &&
            (identical(other.exactLocation, exactLocation) ||
                other.exactLocation == exactLocation) &&
            (identical(other.region, region) || other.region == region));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, exactLocation, region);

  /// Create a copy of CafeLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CafeLocationModelImplCopyWith<_$CafeLocationModelImpl> get copyWith =>
      __$$CafeLocationModelImplCopyWithImpl<_$CafeLocationModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CafeLocationModelImplToJson(this);
  }
}

abstract class _CafeLocationModel implements CafeLocationModel {
  const factory _CafeLocationModel({
    final String? exactLocation,
    final String? region,
  }) = _$CafeLocationModelImpl;

  factory _CafeLocationModel.fromJson(Map<String, dynamic> json) =
      _$CafeLocationModelImpl.fromJson;

  @override
  String? get exactLocation;
  @override
  String? get region;

  /// Create a copy of CafeLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CafeLocationModelImplCopyWith<_$CafeLocationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CafeReviewModel _$CafeReviewModelFromJson(Map<String, dynamic> json) {
  return _CafeReviewModel.fromJson(json);
}

/// @nodoc
mixin _$CafeReviewModel {
  num? get rating => throw _privateConstructorUsedError;
  int? get reviewCount => throw _privateConstructorUsedError;
  String? get reviewText => throw _privateConstructorUsedError;

  /// Serializes this CafeReviewModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CafeReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CafeReviewModelCopyWith<CafeReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CafeReviewModelCopyWith<$Res> {
  factory $CafeReviewModelCopyWith(
    CafeReviewModel value,
    $Res Function(CafeReviewModel) then,
  ) = _$CafeReviewModelCopyWithImpl<$Res, CafeReviewModel>;
  @useResult
  $Res call({num? rating, int? reviewCount, String? reviewText});
}

/// @nodoc
class _$CafeReviewModelCopyWithImpl<$Res, $Val extends CafeReviewModel>
    implements $CafeReviewModelCopyWith<$Res> {
  _$CafeReviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CafeReviewModel
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
                      as num?,
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
abstract class _$$CafeReviewModelImplCopyWith<$Res>
    implements $CafeReviewModelCopyWith<$Res> {
  factory _$$CafeReviewModelImplCopyWith(
    _$CafeReviewModelImpl value,
    $Res Function(_$CafeReviewModelImpl) then,
  ) = __$$CafeReviewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num? rating, int? reviewCount, String? reviewText});
}

/// @nodoc
class __$$CafeReviewModelImplCopyWithImpl<$Res>
    extends _$CafeReviewModelCopyWithImpl<$Res, _$CafeReviewModelImpl>
    implements _$$CafeReviewModelImplCopyWith<$Res> {
  __$$CafeReviewModelImplCopyWithImpl(
    _$CafeReviewModelImpl _value,
    $Res Function(_$CafeReviewModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CafeReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = freezed,
    Object? reviewCount = freezed,
    Object? reviewText = freezed,
  }) {
    return _then(
      _$CafeReviewModelImpl(
        rating: freezed == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as num?,
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
class _$CafeReviewModelImpl implements _CafeReviewModel {
  const _$CafeReviewModelImpl({this.rating, this.reviewCount, this.reviewText});

  factory _$CafeReviewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CafeReviewModelImplFromJson(json);

  @override
  final num? rating;
  @override
  final int? reviewCount;
  @override
  final String? reviewText;

  @override
  String toString() {
    return 'CafeReviewModel(rating: $rating, reviewCount: $reviewCount, reviewText: $reviewText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CafeReviewModelImpl &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.reviewText, reviewText) ||
                other.reviewText == reviewText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rating, reviewCount, reviewText);

  /// Create a copy of CafeReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CafeReviewModelImplCopyWith<_$CafeReviewModelImpl> get copyWith =>
      __$$CafeReviewModelImplCopyWithImpl<_$CafeReviewModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CafeReviewModelImplToJson(this);
  }
}

abstract class _CafeReviewModel implements CafeReviewModel {
  const factory _CafeReviewModel({
    final num? rating,
    final int? reviewCount,
    final String? reviewText,
  }) = _$CafeReviewModelImpl;

  factory _CafeReviewModel.fromJson(Map<String, dynamic> json) =
      _$CafeReviewModelImpl.fromJson;

  @override
  num? get rating;
  @override
  int? get reviewCount;
  @override
  String? get reviewText;

  /// Create a copy of CafeReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CafeReviewModelImplCopyWith<_$CafeReviewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
