// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like_you_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LikeYouModel _$LikeYouModelFromJson(Map<String, dynamic> json) {
  return _LikeYouModel.fromJson(json);
}

/// @nodoc
mixin _$LikeYouModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get bookingId => throw _privateConstructorUsedError;
  RequestedBy? get requestedBy => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  DateTime? get respondedAt => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int? get v => throw _privateConstructorUsedError;

  /// Serializes this LikeYouModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LikeYouModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LikeYouModelCopyWith<LikeYouModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeYouModelCopyWith<$Res> {
  factory $LikeYouModelCopyWith(
    LikeYouModel value,
    $Res Function(LikeYouModel) then,
  ) = _$LikeYouModelCopyWithImpl<$Res, LikeYouModel>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? bookingId,
    RequestedBy? requestedBy,
    String? status,
    String? message,
    DateTime? respondedAt,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    @JsonKey(name: '__v') int? v,
  });

  $RequestedByCopyWith<$Res>? get requestedBy;
}

/// @nodoc
class _$LikeYouModelCopyWithImpl<$Res, $Val extends LikeYouModel>
    implements $LikeYouModelCopyWith<$Res> {
  _$LikeYouModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LikeYouModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bookingId = freezed,
    Object? requestedBy = freezed,
    Object? status = freezed,
    Object? message = freezed,
    Object? respondedAt = freezed,
    Object? isDeleted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            bookingId: freezed == bookingId
                ? _value.bookingId
                : bookingId // ignore: cast_nullable_to_non_nullable
                      as String?,
            requestedBy: freezed == requestedBy
                ? _value.requestedBy
                : requestedBy // ignore: cast_nullable_to_non_nullable
                      as RequestedBy?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            respondedAt: freezed == respondedAt
                ? _value.respondedAt
                : respondedAt // ignore: cast_nullable_to_non_nullable
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
          )
          as $Val,
    );
  }

  /// Create a copy of LikeYouModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RequestedByCopyWith<$Res>? get requestedBy {
    if (_value.requestedBy == null) {
      return null;
    }

    return $RequestedByCopyWith<$Res>(_value.requestedBy!, (value) {
      return _then(_value.copyWith(requestedBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LikeYouModelImplCopyWith<$Res>
    implements $LikeYouModelCopyWith<$Res> {
  factory _$$LikeYouModelImplCopyWith(
    _$LikeYouModelImpl value,
    $Res Function(_$LikeYouModelImpl) then,
  ) = __$$LikeYouModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? bookingId,
    RequestedBy? requestedBy,
    String? status,
    String? message,
    DateTime? respondedAt,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    @JsonKey(name: '__v') int? v,
  });

  @override
  $RequestedByCopyWith<$Res>? get requestedBy;
}

/// @nodoc
class __$$LikeYouModelImplCopyWithImpl<$Res>
    extends _$LikeYouModelCopyWithImpl<$Res, _$LikeYouModelImpl>
    implements _$$LikeYouModelImplCopyWith<$Res> {
  __$$LikeYouModelImplCopyWithImpl(
    _$LikeYouModelImpl _value,
    $Res Function(_$LikeYouModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LikeYouModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bookingId = freezed,
    Object? requestedBy = freezed,
    Object? status = freezed,
    Object? message = freezed,
    Object? respondedAt = freezed,
    Object? isDeleted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
  }) {
    return _then(
      _$LikeYouModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        bookingId: freezed == bookingId
            ? _value.bookingId
            : bookingId // ignore: cast_nullable_to_non_nullable
                  as String?,
        requestedBy: freezed == requestedBy
            ? _value.requestedBy
            : requestedBy // ignore: cast_nullable_to_non_nullable
                  as RequestedBy?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        respondedAt: freezed == respondedAt
            ? _value.respondedAt
            : respondedAt // ignore: cast_nullable_to_non_nullable
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LikeYouModelImpl implements _LikeYouModel {
  const _$LikeYouModelImpl({
    @JsonKey(name: '_id') this.id,
    this.bookingId,
    this.requestedBy,
    this.status,
    this.message,
    this.respondedAt,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    @JsonKey(name: '__v') this.v,
  });

  factory _$LikeYouModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LikeYouModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? bookingId;
  @override
  final RequestedBy? requestedBy;
  @override
  final String? status;
  @override
  final String? message;
  @override
  final DateTime? respondedAt;
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
  String toString() {
    return 'LikeYouModel(id: $id, bookingId: $bookingId, requestedBy: $requestedBy, status: $status, message: $message, respondedAt: $respondedAt, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeYouModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.requestedBy, requestedBy) ||
                other.requestedBy == requestedBy) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.respondedAt, respondedAt) ||
                other.respondedAt == respondedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    bookingId,
    requestedBy,
    status,
    message,
    respondedAt,
    isDeleted,
    createdAt,
    updatedAt,
    v,
  );

  /// Create a copy of LikeYouModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeYouModelImplCopyWith<_$LikeYouModelImpl> get copyWith =>
      __$$LikeYouModelImplCopyWithImpl<_$LikeYouModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LikeYouModelImplToJson(this);
  }
}

abstract class _LikeYouModel implements LikeYouModel {
  const factory _LikeYouModel({
    @JsonKey(name: '_id') final String? id,
    final String? bookingId,
    final RequestedBy? requestedBy,
    final String? status,
    final String? message,
    final DateTime? respondedAt,
    final bool? isDeleted,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    @JsonKey(name: '__v') final int? v,
  }) = _$LikeYouModelImpl;

  factory _LikeYouModel.fromJson(Map<String, dynamic> json) =
      _$LikeYouModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get bookingId;
  @override
  RequestedBy? get requestedBy;
  @override
  String? get status;
  @override
  String? get message;
  @override
  DateTime? get respondedAt;
  @override
  bool? get isDeleted;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(name: '__v')
  int? get v;

  /// Create a copy of LikeYouModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LikeYouModelImplCopyWith<_$LikeYouModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RequestedBy _$RequestedByFromJson(Map<String, dynamic> json) {
  return _RequestedBy.fromJson(json);
}

/// @nodoc
mixin _$RequestedBy {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  SocialAccounts? get socialAccounts => throw _privateConstructorUsedError;
  String? get profilePhoto => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get loginType => throw _privateConstructorUsedError;
  String? get appUsageType => throw _privateConstructorUsedError;
  String? get maritalStatus => throw _privateConstructorUsedError;
  String? get aiAvatar => throw _privateConstructorUsedError;
  String? get aiAvatarStyle => throw _privateConstructorUsedError;
  List<String>? get profileImages => throw _privateConstructorUsedError;
  String? get datingIntentions => throw _privateConstructorUsedError;
  bool? get pets => throw _privateConstructorUsedError;
  String? get voicePrompt => throw _privateConstructorUsedError;
  String? get video => throw _privateConstructorUsedError;
  List<String>? get greenFlags => throw _privateConstructorUsedError;
  List<String>? get redFlags => throw _privateConstructorUsedError;
  String? get verificationStatus => throw _privateConstructorUsedError;
  String? get verificationMethod => throw _privateConstructorUsedError;
  List<String>? get verificationDocuments => throw _privateConstructorUsedError;
  bool? get profileSetup => throw _privateConstructorUsedError;
  bool? get profileCompleted => throw _privateConstructorUsedError;
  String? get profileCompletionStep => throw _privateConstructorUsedError;
  List<String>? get preferredDatingIntentions =>
      throw _privateConstructorUsedError;
  List<String>? get preferredNationality => throw _privateConstructorUsedError;
  List<String>? get preferredReligion => throw _privateConstructorUsedError;
  bool? get isDelete => throw _privateConstructorUsedError;
  bool? get suspended => throw _privateConstructorUsedError;
  int? get bowlBalance => throw _privateConstructorUsedError;
  int? get permanentChatIncrements => throw _privateConstructorUsedError;
  List<String>? get rejectedUsers => throw _privateConstructorUsedError;
  int? get receivedLikesCount => throw _privateConstructorUsedError;
  bool? get profileBoostActive => throw _privateConstructorUsedError;
  DateTime? get profileBoostExpiresAt => throw _privateConstructorUsedError;
  bool? get crushBowlActive => throw _privateConstructorUsedError;
  DateTime? get crushBowlExpiresAt => throw _privateConstructorUsedError;
  int? get activeConversations => throw _privateConstructorUsedError;
  int? get subscriptionChatIncrements => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int? get v => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  String? get beforeAnything => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get clubbing => throw _privateConstructorUsedError;
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  String? get drinking => throw _privateConstructorUsedError;
  String? get favoriteQuotes => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get hobbies => throw _privateConstructorUsedError;
  String? get lifestyleInterests => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  int? get minAge => throw _privateConstructorUsedError;
  int? get maxAge => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  String? get occupation => throw _privateConstructorUsedError;
  String? get preferredGender => throw _privateConstructorUsedError;
  String? get religion => throw _privateConstructorUsedError;
  String? get smoking => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  String? get userStatus => throw _privateConstructorUsedError;
  DateTime? get verificationDate => throw _privateConstructorUsedError;

  /// Serializes this RequestedBy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestedBy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestedByCopyWith<RequestedBy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestedByCopyWith<$Res> {
  factory $RequestedByCopyWith(
    RequestedBy value,
    $Res Function(RequestedBy) then,
  ) = _$RequestedByCopyWithImpl<$Res, RequestedBy>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    SocialAccounts? socialAccounts,
    String? profilePhoto,
    String? email,
    String? role,
    String? status,
    String? loginType,
    String? appUsageType,
    String? maritalStatus,
    String? aiAvatar,
    String? aiAvatarStyle,
    List<String>? profileImages,
    String? datingIntentions,
    bool? pets,
    String? voicePrompt,
    String? video,
    List<String>? greenFlags,
    List<String>? redFlags,
    String? verificationStatus,
    String? verificationMethod,
    List<String>? verificationDocuments,
    bool? profileSetup,
    bool? profileCompleted,
    String? profileCompletionStep,
    List<String>? preferredDatingIntentions,
    List<String>? preferredNationality,
    List<String>? preferredReligion,
    bool? isDelete,
    bool? suspended,
    int? bowlBalance,
    int? permanentChatIncrements,
    List<String>? rejectedUsers,
    int? receivedLikesCount,
    bool? profileBoostActive,
    DateTime? profileBoostExpiresAt,
    bool? crushBowlActive,
    DateTime? crushBowlExpiresAt,
    int? activeConversations,
    int? subscriptionChatIncrements,
    DateTime? createdAt,
    DateTime? updatedAt,
    @JsonKey(name: '__v') int? v,
    int? age,
    String? beforeAnything,
    String? bio,
    String? clubbing,
    DateTime? dateOfBirth,
    String? drinking,
    String? favoriteQuotes,
    String? firstName,
    String? lastName,
    String? fullName,
    String? hobbies,
    String? lifestyleInterests,
    String? location,
    int? minAge,
    int? maxAge,
    String? nickname,
    String? occupation,
    String? preferredGender,
    String? religion,
    String? smoking,
    String? userName,
    String? userStatus,
    DateTime? verificationDate,
  });

  $SocialAccountsCopyWith<$Res>? get socialAccounts;
}

/// @nodoc
class _$RequestedByCopyWithImpl<$Res, $Val extends RequestedBy>
    implements $RequestedByCopyWith<$Res> {
  _$RequestedByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestedBy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? socialAccounts = freezed,
    Object? profilePhoto = freezed,
    Object? email = freezed,
    Object? role = freezed,
    Object? status = freezed,
    Object? loginType = freezed,
    Object? appUsageType = freezed,
    Object? maritalStatus = freezed,
    Object? aiAvatar = freezed,
    Object? aiAvatarStyle = freezed,
    Object? profileImages = freezed,
    Object? datingIntentions = freezed,
    Object? pets = freezed,
    Object? voicePrompt = freezed,
    Object? video = freezed,
    Object? greenFlags = freezed,
    Object? redFlags = freezed,
    Object? verificationStatus = freezed,
    Object? verificationMethod = freezed,
    Object? verificationDocuments = freezed,
    Object? profileSetup = freezed,
    Object? profileCompleted = freezed,
    Object? profileCompletionStep = freezed,
    Object? preferredDatingIntentions = freezed,
    Object? preferredNationality = freezed,
    Object? preferredReligion = freezed,
    Object? isDelete = freezed,
    Object? suspended = freezed,
    Object? bowlBalance = freezed,
    Object? permanentChatIncrements = freezed,
    Object? rejectedUsers = freezed,
    Object? receivedLikesCount = freezed,
    Object? profileBoostActive = freezed,
    Object? profileBoostExpiresAt = freezed,
    Object? crushBowlActive = freezed,
    Object? crushBowlExpiresAt = freezed,
    Object? activeConversations = freezed,
    Object? subscriptionChatIncrements = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
    Object? age = freezed,
    Object? beforeAnything = freezed,
    Object? bio = freezed,
    Object? clubbing = freezed,
    Object? dateOfBirth = freezed,
    Object? drinking = freezed,
    Object? favoriteQuotes = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? fullName = freezed,
    Object? hobbies = freezed,
    Object? lifestyleInterests = freezed,
    Object? location = freezed,
    Object? minAge = freezed,
    Object? maxAge = freezed,
    Object? nickname = freezed,
    Object? occupation = freezed,
    Object? preferredGender = freezed,
    Object? religion = freezed,
    Object? smoking = freezed,
    Object? userName = freezed,
    Object? userStatus = freezed,
    Object? verificationDate = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            socialAccounts: freezed == socialAccounts
                ? _value.socialAccounts
                : socialAccounts // ignore: cast_nullable_to_non_nullable
                      as SocialAccounts?,
            profilePhoto: freezed == profilePhoto
                ? _value.profilePhoto
                : profilePhoto // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            role: freezed == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            loginType: freezed == loginType
                ? _value.loginType
                : loginType // ignore: cast_nullable_to_non_nullable
                      as String?,
            appUsageType: freezed == appUsageType
                ? _value.appUsageType
                : appUsageType // ignore: cast_nullable_to_non_nullable
                      as String?,
            maritalStatus: freezed == maritalStatus
                ? _value.maritalStatus
                : maritalStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            aiAvatar: freezed == aiAvatar
                ? _value.aiAvatar
                : aiAvatar // ignore: cast_nullable_to_non_nullable
                      as String?,
            aiAvatarStyle: freezed == aiAvatarStyle
                ? _value.aiAvatarStyle
                : aiAvatarStyle // ignore: cast_nullable_to_non_nullable
                      as String?,
            profileImages: freezed == profileImages
                ? _value.profileImages
                : profileImages // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            datingIntentions: freezed == datingIntentions
                ? _value.datingIntentions
                : datingIntentions // ignore: cast_nullable_to_non_nullable
                      as String?,
            pets: freezed == pets
                ? _value.pets
                : pets // ignore: cast_nullable_to_non_nullable
                      as bool?,
            voicePrompt: freezed == voicePrompt
                ? _value.voicePrompt
                : voicePrompt // ignore: cast_nullable_to_non_nullable
                      as String?,
            video: freezed == video
                ? _value.video
                : video // ignore: cast_nullable_to_non_nullable
                      as String?,
            greenFlags: freezed == greenFlags
                ? _value.greenFlags
                : greenFlags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            redFlags: freezed == redFlags
                ? _value.redFlags
                : redFlags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            verificationStatus: freezed == verificationStatus
                ? _value.verificationStatus
                : verificationStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            verificationMethod: freezed == verificationMethod
                ? _value.verificationMethod
                : verificationMethod // ignore: cast_nullable_to_non_nullable
                      as String?,
            verificationDocuments: freezed == verificationDocuments
                ? _value.verificationDocuments
                : verificationDocuments // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            profileSetup: freezed == profileSetup
                ? _value.profileSetup
                : profileSetup // ignore: cast_nullable_to_non_nullable
                      as bool?,
            profileCompleted: freezed == profileCompleted
                ? _value.profileCompleted
                : profileCompleted // ignore: cast_nullable_to_non_nullable
                      as bool?,
            profileCompletionStep: freezed == profileCompletionStep
                ? _value.profileCompletionStep
                : profileCompletionStep // ignore: cast_nullable_to_non_nullable
                      as String?,
            preferredDatingIntentions: freezed == preferredDatingIntentions
                ? _value.preferredDatingIntentions
                : preferredDatingIntentions // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            preferredNationality: freezed == preferredNationality
                ? _value.preferredNationality
                : preferredNationality // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            preferredReligion: freezed == preferredReligion
                ? _value.preferredReligion
                : preferredReligion // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            isDelete: freezed == isDelete
                ? _value.isDelete
                : isDelete // ignore: cast_nullable_to_non_nullable
                      as bool?,
            suspended: freezed == suspended
                ? _value.suspended
                : suspended // ignore: cast_nullable_to_non_nullable
                      as bool?,
            bowlBalance: freezed == bowlBalance
                ? _value.bowlBalance
                : bowlBalance // ignore: cast_nullable_to_non_nullable
                      as int?,
            permanentChatIncrements: freezed == permanentChatIncrements
                ? _value.permanentChatIncrements
                : permanentChatIncrements // ignore: cast_nullable_to_non_nullable
                      as int?,
            rejectedUsers: freezed == rejectedUsers
                ? _value.rejectedUsers
                : rejectedUsers // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            receivedLikesCount: freezed == receivedLikesCount
                ? _value.receivedLikesCount
                : receivedLikesCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            profileBoostActive: freezed == profileBoostActive
                ? _value.profileBoostActive
                : profileBoostActive // ignore: cast_nullable_to_non_nullable
                      as bool?,
            profileBoostExpiresAt: freezed == profileBoostExpiresAt
                ? _value.profileBoostExpiresAt
                : profileBoostExpiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            crushBowlActive: freezed == crushBowlActive
                ? _value.crushBowlActive
                : crushBowlActive // ignore: cast_nullable_to_non_nullable
                      as bool?,
            crushBowlExpiresAt: freezed == crushBowlExpiresAt
                ? _value.crushBowlExpiresAt
                : crushBowlExpiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            activeConversations: freezed == activeConversations
                ? _value.activeConversations
                : activeConversations // ignore: cast_nullable_to_non_nullable
                      as int?,
            subscriptionChatIncrements: freezed == subscriptionChatIncrements
                ? _value.subscriptionChatIncrements
                : subscriptionChatIncrements // ignore: cast_nullable_to_non_nullable
                      as int?,
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
            age: freezed == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int?,
            beforeAnything: freezed == beforeAnything
                ? _value.beforeAnything
                : beforeAnything // ignore: cast_nullable_to_non_nullable
                      as String?,
            bio: freezed == bio
                ? _value.bio
                : bio // ignore: cast_nullable_to_non_nullable
                      as String?,
            clubbing: freezed == clubbing
                ? _value.clubbing
                : clubbing // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateOfBirth: freezed == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            drinking: freezed == drinking
                ? _value.drinking
                : drinking // ignore: cast_nullable_to_non_nullable
                      as String?,
            favoriteQuotes: freezed == favoriteQuotes
                ? _value.favoriteQuotes
                : favoriteQuotes // ignore: cast_nullable_to_non_nullable
                      as String?,
            firstName: freezed == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String?,
            hobbies: freezed == hobbies
                ? _value.hobbies
                : hobbies // ignore: cast_nullable_to_non_nullable
                      as String?,
            lifestyleInterests: freezed == lifestyleInterests
                ? _value.lifestyleInterests
                : lifestyleInterests // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            minAge: freezed == minAge
                ? _value.minAge
                : minAge // ignore: cast_nullable_to_non_nullable
                      as int?,
            maxAge: freezed == maxAge
                ? _value.maxAge
                : maxAge // ignore: cast_nullable_to_non_nullable
                      as int?,
            nickname: freezed == nickname
                ? _value.nickname
                : nickname // ignore: cast_nullable_to_non_nullable
                      as String?,
            occupation: freezed == occupation
                ? _value.occupation
                : occupation // ignore: cast_nullable_to_non_nullable
                      as String?,
            preferredGender: freezed == preferredGender
                ? _value.preferredGender
                : preferredGender // ignore: cast_nullable_to_non_nullable
                      as String?,
            religion: freezed == religion
                ? _value.religion
                : religion // ignore: cast_nullable_to_non_nullable
                      as String?,
            smoking: freezed == smoking
                ? _value.smoking
                : smoking // ignore: cast_nullable_to_non_nullable
                      as String?,
            userName: freezed == userName
                ? _value.userName
                : userName // ignore: cast_nullable_to_non_nullable
                      as String?,
            userStatus: freezed == userStatus
                ? _value.userStatus
                : userStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            verificationDate: freezed == verificationDate
                ? _value.verificationDate
                : verificationDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of RequestedBy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SocialAccountsCopyWith<$Res>? get socialAccounts {
    if (_value.socialAccounts == null) {
      return null;
    }

    return $SocialAccountsCopyWith<$Res>(_value.socialAccounts!, (value) {
      return _then(_value.copyWith(socialAccounts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RequestedByImplCopyWith<$Res>
    implements $RequestedByCopyWith<$Res> {
  factory _$$RequestedByImplCopyWith(
    _$RequestedByImpl value,
    $Res Function(_$RequestedByImpl) then,
  ) = __$$RequestedByImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    SocialAccounts? socialAccounts,
    String? profilePhoto,
    String? email,
    String? role,
    String? status,
    String? loginType,
    String? appUsageType,
    String? maritalStatus,
    String? aiAvatar,
    String? aiAvatarStyle,
    List<String>? profileImages,
    String? datingIntentions,
    bool? pets,
    String? voicePrompt,
    String? video,
    List<String>? greenFlags,
    List<String>? redFlags,
    String? verificationStatus,
    String? verificationMethod,
    List<String>? verificationDocuments,
    bool? profileSetup,
    bool? profileCompleted,
    String? profileCompletionStep,
    List<String>? preferredDatingIntentions,
    List<String>? preferredNationality,
    List<String>? preferredReligion,
    bool? isDelete,
    bool? suspended,
    int? bowlBalance,
    int? permanentChatIncrements,
    List<String>? rejectedUsers,
    int? receivedLikesCount,
    bool? profileBoostActive,
    DateTime? profileBoostExpiresAt,
    bool? crushBowlActive,
    DateTime? crushBowlExpiresAt,
    int? activeConversations,
    int? subscriptionChatIncrements,
    DateTime? createdAt,
    DateTime? updatedAt,
    @JsonKey(name: '__v') int? v,
    int? age,
    String? beforeAnything,
    String? bio,
    String? clubbing,
    DateTime? dateOfBirth,
    String? drinking,
    String? favoriteQuotes,
    String? firstName,
    String? lastName,
    String? fullName,
    String? hobbies,
    String? lifestyleInterests,
    String? location,
    int? minAge,
    int? maxAge,
    String? nickname,
    String? occupation,
    String? preferredGender,
    String? religion,
    String? smoking,
    String? userName,
    String? userStatus,
    DateTime? verificationDate,
  });

  @override
  $SocialAccountsCopyWith<$Res>? get socialAccounts;
}

/// @nodoc
class __$$RequestedByImplCopyWithImpl<$Res>
    extends _$RequestedByCopyWithImpl<$Res, _$RequestedByImpl>
    implements _$$RequestedByImplCopyWith<$Res> {
  __$$RequestedByImplCopyWithImpl(
    _$RequestedByImpl _value,
    $Res Function(_$RequestedByImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RequestedBy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? socialAccounts = freezed,
    Object? profilePhoto = freezed,
    Object? email = freezed,
    Object? role = freezed,
    Object? status = freezed,
    Object? loginType = freezed,
    Object? appUsageType = freezed,
    Object? maritalStatus = freezed,
    Object? aiAvatar = freezed,
    Object? aiAvatarStyle = freezed,
    Object? profileImages = freezed,
    Object? datingIntentions = freezed,
    Object? pets = freezed,
    Object? voicePrompt = freezed,
    Object? video = freezed,
    Object? greenFlags = freezed,
    Object? redFlags = freezed,
    Object? verificationStatus = freezed,
    Object? verificationMethod = freezed,
    Object? verificationDocuments = freezed,
    Object? profileSetup = freezed,
    Object? profileCompleted = freezed,
    Object? profileCompletionStep = freezed,
    Object? preferredDatingIntentions = freezed,
    Object? preferredNationality = freezed,
    Object? preferredReligion = freezed,
    Object? isDelete = freezed,
    Object? suspended = freezed,
    Object? bowlBalance = freezed,
    Object? permanentChatIncrements = freezed,
    Object? rejectedUsers = freezed,
    Object? receivedLikesCount = freezed,
    Object? profileBoostActive = freezed,
    Object? profileBoostExpiresAt = freezed,
    Object? crushBowlActive = freezed,
    Object? crushBowlExpiresAt = freezed,
    Object? activeConversations = freezed,
    Object? subscriptionChatIncrements = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
    Object? age = freezed,
    Object? beforeAnything = freezed,
    Object? bio = freezed,
    Object? clubbing = freezed,
    Object? dateOfBirth = freezed,
    Object? drinking = freezed,
    Object? favoriteQuotes = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? fullName = freezed,
    Object? hobbies = freezed,
    Object? lifestyleInterests = freezed,
    Object? location = freezed,
    Object? minAge = freezed,
    Object? maxAge = freezed,
    Object? nickname = freezed,
    Object? occupation = freezed,
    Object? preferredGender = freezed,
    Object? religion = freezed,
    Object? smoking = freezed,
    Object? userName = freezed,
    Object? userStatus = freezed,
    Object? verificationDate = freezed,
  }) {
    return _then(
      _$RequestedByImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        socialAccounts: freezed == socialAccounts
            ? _value.socialAccounts
            : socialAccounts // ignore: cast_nullable_to_non_nullable
                  as SocialAccounts?,
        profilePhoto: freezed == profilePhoto
            ? _value.profilePhoto
            : profilePhoto // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        role: freezed == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        loginType: freezed == loginType
            ? _value.loginType
            : loginType // ignore: cast_nullable_to_non_nullable
                  as String?,
        appUsageType: freezed == appUsageType
            ? _value.appUsageType
            : appUsageType // ignore: cast_nullable_to_non_nullable
                  as String?,
        maritalStatus: freezed == maritalStatus
            ? _value.maritalStatus
            : maritalStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        aiAvatar: freezed == aiAvatar
            ? _value.aiAvatar
            : aiAvatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        aiAvatarStyle: freezed == aiAvatarStyle
            ? _value.aiAvatarStyle
            : aiAvatarStyle // ignore: cast_nullable_to_non_nullable
                  as String?,
        profileImages: freezed == profileImages
            ? _value._profileImages
            : profileImages // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        datingIntentions: freezed == datingIntentions
            ? _value.datingIntentions
            : datingIntentions // ignore: cast_nullable_to_non_nullable
                  as String?,
        pets: freezed == pets
            ? _value.pets
            : pets // ignore: cast_nullable_to_non_nullable
                  as bool?,
        voicePrompt: freezed == voicePrompt
            ? _value.voicePrompt
            : voicePrompt // ignore: cast_nullable_to_non_nullable
                  as String?,
        video: freezed == video
            ? _value.video
            : video // ignore: cast_nullable_to_non_nullable
                  as String?,
        greenFlags: freezed == greenFlags
            ? _value._greenFlags
            : greenFlags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        redFlags: freezed == redFlags
            ? _value._redFlags
            : redFlags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        verificationStatus: freezed == verificationStatus
            ? _value.verificationStatus
            : verificationStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        verificationMethod: freezed == verificationMethod
            ? _value.verificationMethod
            : verificationMethod // ignore: cast_nullable_to_non_nullable
                  as String?,
        verificationDocuments: freezed == verificationDocuments
            ? _value._verificationDocuments
            : verificationDocuments // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        profileSetup: freezed == profileSetup
            ? _value.profileSetup
            : profileSetup // ignore: cast_nullable_to_non_nullable
                  as bool?,
        profileCompleted: freezed == profileCompleted
            ? _value.profileCompleted
            : profileCompleted // ignore: cast_nullable_to_non_nullable
                  as bool?,
        profileCompletionStep: freezed == profileCompletionStep
            ? _value.profileCompletionStep
            : profileCompletionStep // ignore: cast_nullable_to_non_nullable
                  as String?,
        preferredDatingIntentions: freezed == preferredDatingIntentions
            ? _value._preferredDatingIntentions
            : preferredDatingIntentions // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        preferredNationality: freezed == preferredNationality
            ? _value._preferredNationality
            : preferredNationality // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        preferredReligion: freezed == preferredReligion
            ? _value._preferredReligion
            : preferredReligion // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        isDelete: freezed == isDelete
            ? _value.isDelete
            : isDelete // ignore: cast_nullable_to_non_nullable
                  as bool?,
        suspended: freezed == suspended
            ? _value.suspended
            : suspended // ignore: cast_nullable_to_non_nullable
                  as bool?,
        bowlBalance: freezed == bowlBalance
            ? _value.bowlBalance
            : bowlBalance // ignore: cast_nullable_to_non_nullable
                  as int?,
        permanentChatIncrements: freezed == permanentChatIncrements
            ? _value.permanentChatIncrements
            : permanentChatIncrements // ignore: cast_nullable_to_non_nullable
                  as int?,
        rejectedUsers: freezed == rejectedUsers
            ? _value._rejectedUsers
            : rejectedUsers // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        receivedLikesCount: freezed == receivedLikesCount
            ? _value.receivedLikesCount
            : receivedLikesCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        profileBoostActive: freezed == profileBoostActive
            ? _value.profileBoostActive
            : profileBoostActive // ignore: cast_nullable_to_non_nullable
                  as bool?,
        profileBoostExpiresAt: freezed == profileBoostExpiresAt
            ? _value.profileBoostExpiresAt
            : profileBoostExpiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        crushBowlActive: freezed == crushBowlActive
            ? _value.crushBowlActive
            : crushBowlActive // ignore: cast_nullable_to_non_nullable
                  as bool?,
        crushBowlExpiresAt: freezed == crushBowlExpiresAt
            ? _value.crushBowlExpiresAt
            : crushBowlExpiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        activeConversations: freezed == activeConversations
            ? _value.activeConversations
            : activeConversations // ignore: cast_nullable_to_non_nullable
                  as int?,
        subscriptionChatIncrements: freezed == subscriptionChatIncrements
            ? _value.subscriptionChatIncrements
            : subscriptionChatIncrements // ignore: cast_nullable_to_non_nullable
                  as int?,
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
        age: freezed == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int?,
        beforeAnything: freezed == beforeAnything
            ? _value.beforeAnything
            : beforeAnything // ignore: cast_nullable_to_non_nullable
                  as String?,
        bio: freezed == bio
            ? _value.bio
            : bio // ignore: cast_nullable_to_non_nullable
                  as String?,
        clubbing: freezed == clubbing
            ? _value.clubbing
            : clubbing // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateOfBirth: freezed == dateOfBirth
            ? _value.dateOfBirth
            : dateOfBirth // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        drinking: freezed == drinking
            ? _value.drinking
            : drinking // ignore: cast_nullable_to_non_nullable
                  as String?,
        favoriteQuotes: freezed == favoriteQuotes
            ? _value.favoriteQuotes
            : favoriteQuotes // ignore: cast_nullable_to_non_nullable
                  as String?,
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        hobbies: freezed == hobbies
            ? _value.hobbies
            : hobbies // ignore: cast_nullable_to_non_nullable
                  as String?,
        lifestyleInterests: freezed == lifestyleInterests
            ? _value.lifestyleInterests
            : lifestyleInterests // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        minAge: freezed == minAge
            ? _value.minAge
            : minAge // ignore: cast_nullable_to_non_nullable
                  as int?,
        maxAge: freezed == maxAge
            ? _value.maxAge
            : maxAge // ignore: cast_nullable_to_non_nullable
                  as int?,
        nickname: freezed == nickname
            ? _value.nickname
            : nickname // ignore: cast_nullable_to_non_nullable
                  as String?,
        occupation: freezed == occupation
            ? _value.occupation
            : occupation // ignore: cast_nullable_to_non_nullable
                  as String?,
        preferredGender: freezed == preferredGender
            ? _value.preferredGender
            : preferredGender // ignore: cast_nullable_to_non_nullable
                  as String?,
        religion: freezed == religion
            ? _value.religion
            : religion // ignore: cast_nullable_to_non_nullable
                  as String?,
        smoking: freezed == smoking
            ? _value.smoking
            : smoking // ignore: cast_nullable_to_non_nullable
                  as String?,
        userName: freezed == userName
            ? _value.userName
            : userName // ignore: cast_nullable_to_non_nullable
                  as String?,
        userStatus: freezed == userStatus
            ? _value.userStatus
            : userStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        verificationDate: freezed == verificationDate
            ? _value.verificationDate
            : verificationDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestedByImpl implements _RequestedBy {
  const _$RequestedByImpl({
    @JsonKey(name: '_id') this.id,
    this.socialAccounts,
    this.profilePhoto,
    this.email,
    this.role,
    this.status,
    this.loginType,
    this.appUsageType,
    this.maritalStatus,
    this.aiAvatar,
    this.aiAvatarStyle,
    final List<String>? profileImages,
    this.datingIntentions,
    this.pets,
    this.voicePrompt,
    this.video,
    final List<String>? greenFlags,
    final List<String>? redFlags,
    this.verificationStatus,
    this.verificationMethod,
    final List<String>? verificationDocuments,
    this.profileSetup,
    this.profileCompleted,
    this.profileCompletionStep,
    final List<String>? preferredDatingIntentions,
    final List<String>? preferredNationality,
    final List<String>? preferredReligion,
    this.isDelete,
    this.suspended,
    this.bowlBalance,
    this.permanentChatIncrements,
    final List<String>? rejectedUsers,
    this.receivedLikesCount,
    this.profileBoostActive,
    this.profileBoostExpiresAt,
    this.crushBowlActive,
    this.crushBowlExpiresAt,
    this.activeConversations,
    this.subscriptionChatIncrements,
    this.createdAt,
    this.updatedAt,
    @JsonKey(name: '__v') this.v,
    this.age,
    this.beforeAnything,
    this.bio,
    this.clubbing,
    this.dateOfBirth,
    this.drinking,
    this.favoriteQuotes,
    this.firstName,
    this.lastName,
    this.fullName,
    this.hobbies,
    this.lifestyleInterests,
    this.location,
    this.minAge,
    this.maxAge,
    this.nickname,
    this.occupation,
    this.preferredGender,
    this.religion,
    this.smoking,
    this.userName,
    this.userStatus,
    this.verificationDate,
  }) : _profileImages = profileImages,
       _greenFlags = greenFlags,
       _redFlags = redFlags,
       _verificationDocuments = verificationDocuments,
       _preferredDatingIntentions = preferredDatingIntentions,
       _preferredNationality = preferredNationality,
       _preferredReligion = preferredReligion,
       _rejectedUsers = rejectedUsers;

  factory _$RequestedByImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestedByImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final SocialAccounts? socialAccounts;
  @override
  final String? profilePhoto;
  @override
  final String? email;
  @override
  final String? role;
  @override
  final String? status;
  @override
  final String? loginType;
  @override
  final String? appUsageType;
  @override
  final String? maritalStatus;
  @override
  final String? aiAvatar;
  @override
  final String? aiAvatarStyle;
  final List<String>? _profileImages;
  @override
  List<String>? get profileImages {
    final value = _profileImages;
    if (value == null) return null;
    if (_profileImages is EqualUnmodifiableListView) return _profileImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? datingIntentions;
  @override
  final bool? pets;
  @override
  final String? voicePrompt;
  @override
  final String? video;
  final List<String>? _greenFlags;
  @override
  List<String>? get greenFlags {
    final value = _greenFlags;
    if (value == null) return null;
    if (_greenFlags is EqualUnmodifiableListView) return _greenFlags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _redFlags;
  @override
  List<String>? get redFlags {
    final value = _redFlags;
    if (value == null) return null;
    if (_redFlags is EqualUnmodifiableListView) return _redFlags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? verificationStatus;
  @override
  final String? verificationMethod;
  final List<String>? _verificationDocuments;
  @override
  List<String>? get verificationDocuments {
    final value = _verificationDocuments;
    if (value == null) return null;
    if (_verificationDocuments is EqualUnmodifiableListView)
      return _verificationDocuments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? profileSetup;
  @override
  final bool? profileCompleted;
  @override
  final String? profileCompletionStep;
  final List<String>? _preferredDatingIntentions;
  @override
  List<String>? get preferredDatingIntentions {
    final value = _preferredDatingIntentions;
    if (value == null) return null;
    if (_preferredDatingIntentions is EqualUnmodifiableListView)
      return _preferredDatingIntentions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _preferredNationality;
  @override
  List<String>? get preferredNationality {
    final value = _preferredNationality;
    if (value == null) return null;
    if (_preferredNationality is EqualUnmodifiableListView)
      return _preferredNationality;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _preferredReligion;
  @override
  List<String>? get preferredReligion {
    final value = _preferredReligion;
    if (value == null) return null;
    if (_preferredReligion is EqualUnmodifiableListView)
      return _preferredReligion;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isDelete;
  @override
  final bool? suspended;
  @override
  final int? bowlBalance;
  @override
  final int? permanentChatIncrements;
  final List<String>? _rejectedUsers;
  @override
  List<String>? get rejectedUsers {
    final value = _rejectedUsers;
    if (value == null) return null;
    if (_rejectedUsers is EqualUnmodifiableListView) return _rejectedUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? receivedLikesCount;
  @override
  final bool? profileBoostActive;
  @override
  final DateTime? profileBoostExpiresAt;
  @override
  final bool? crushBowlActive;
  @override
  final DateTime? crushBowlExpiresAt;
  @override
  final int? activeConversations;
  @override
  final int? subscriptionChatIncrements;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey(name: '__v')
  final int? v;
  @override
  final int? age;
  @override
  final String? beforeAnything;
  @override
  final String? bio;
  @override
  final String? clubbing;
  @override
  final DateTime? dateOfBirth;
  @override
  final String? drinking;
  @override
  final String? favoriteQuotes;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? fullName;
  @override
  final String? hobbies;
  @override
  final String? lifestyleInterests;
  @override
  final String? location;
  @override
  final int? minAge;
  @override
  final int? maxAge;
  @override
  final String? nickname;
  @override
  final String? occupation;
  @override
  final String? preferredGender;
  @override
  final String? religion;
  @override
  final String? smoking;
  @override
  final String? userName;
  @override
  final String? userStatus;
  @override
  final DateTime? verificationDate;

  @override
  String toString() {
    return 'RequestedBy(id: $id, socialAccounts: $socialAccounts, profilePhoto: $profilePhoto, email: $email, role: $role, status: $status, loginType: $loginType, appUsageType: $appUsageType, maritalStatus: $maritalStatus, aiAvatar: $aiAvatar, aiAvatarStyle: $aiAvatarStyle, profileImages: $profileImages, datingIntentions: $datingIntentions, pets: $pets, voicePrompt: $voicePrompt, video: $video, greenFlags: $greenFlags, redFlags: $redFlags, verificationStatus: $verificationStatus, verificationMethod: $verificationMethod, verificationDocuments: $verificationDocuments, profileSetup: $profileSetup, profileCompleted: $profileCompleted, profileCompletionStep: $profileCompletionStep, preferredDatingIntentions: $preferredDatingIntentions, preferredNationality: $preferredNationality, preferredReligion: $preferredReligion, isDelete: $isDelete, suspended: $suspended, bowlBalance: $bowlBalance, permanentChatIncrements: $permanentChatIncrements, rejectedUsers: $rejectedUsers, receivedLikesCount: $receivedLikesCount, profileBoostActive: $profileBoostActive, profileBoostExpiresAt: $profileBoostExpiresAt, crushBowlActive: $crushBowlActive, crushBowlExpiresAt: $crushBowlExpiresAt, activeConversations: $activeConversations, subscriptionChatIncrements: $subscriptionChatIncrements, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, age: $age, beforeAnything: $beforeAnything, bio: $bio, clubbing: $clubbing, dateOfBirth: $dateOfBirth, drinking: $drinking, favoriteQuotes: $favoriteQuotes, firstName: $firstName, lastName: $lastName, fullName: $fullName, hobbies: $hobbies, lifestyleInterests: $lifestyleInterests, location: $location, minAge: $minAge, maxAge: $maxAge, nickname: $nickname, occupation: $occupation, preferredGender: $preferredGender, religion: $religion, smoking: $smoking, userName: $userName, userStatus: $userStatus, verificationDate: $verificationDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestedByImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.socialAccounts, socialAccounts) ||
                other.socialAccounts == socialAccounts) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.loginType, loginType) ||
                other.loginType == loginType) &&
            (identical(other.appUsageType, appUsageType) ||
                other.appUsageType == appUsageType) &&
            (identical(other.maritalStatus, maritalStatus) ||
                other.maritalStatus == maritalStatus) &&
            (identical(other.aiAvatar, aiAvatar) ||
                other.aiAvatar == aiAvatar) &&
            (identical(other.aiAvatarStyle, aiAvatarStyle) ||
                other.aiAvatarStyle == aiAvatarStyle) &&
            const DeepCollectionEquality().equals(
              other._profileImages,
              _profileImages,
            ) &&
            (identical(other.datingIntentions, datingIntentions) ||
                other.datingIntentions == datingIntentions) &&
            (identical(other.pets, pets) || other.pets == pets) &&
            (identical(other.voicePrompt, voicePrompt) ||
                other.voicePrompt == voicePrompt) &&
            (identical(other.video, video) || other.video == video) &&
            const DeepCollectionEquality().equals(
              other._greenFlags,
              _greenFlags,
            ) &&
            const DeepCollectionEquality().equals(other._redFlags, _redFlags) &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus) &&
            (identical(other.verificationMethod, verificationMethod) ||
                other.verificationMethod == verificationMethod) &&
            const DeepCollectionEquality().equals(
              other._verificationDocuments,
              _verificationDocuments,
            ) &&
            (identical(other.profileSetup, profileSetup) ||
                other.profileSetup == profileSetup) &&
            (identical(other.profileCompleted, profileCompleted) ||
                other.profileCompleted == profileCompleted) &&
            (identical(other.profileCompletionStep, profileCompletionStep) ||
                other.profileCompletionStep == profileCompletionStep) &&
            const DeepCollectionEquality().equals(
              other._preferredDatingIntentions,
              _preferredDatingIntentions,
            ) &&
            const DeepCollectionEquality().equals(
              other._preferredNationality,
              _preferredNationality,
            ) &&
            const DeepCollectionEquality().equals(
              other._preferredReligion,
              _preferredReligion,
            ) &&
            (identical(other.isDelete, isDelete) ||
                other.isDelete == isDelete) &&
            (identical(other.suspended, suspended) ||
                other.suspended == suspended) &&
            (identical(other.bowlBalance, bowlBalance) ||
                other.bowlBalance == bowlBalance) &&
            (identical(
                  other.permanentChatIncrements,
                  permanentChatIncrements,
                ) ||
                other.permanentChatIncrements == permanentChatIncrements) &&
            const DeepCollectionEquality().equals(
              other._rejectedUsers,
              _rejectedUsers,
            ) &&
            (identical(other.receivedLikesCount, receivedLikesCount) ||
                other.receivedLikesCount == receivedLikesCount) &&
            (identical(other.profileBoostActive, profileBoostActive) ||
                other.profileBoostActive == profileBoostActive) &&
            (identical(other.profileBoostExpiresAt, profileBoostExpiresAt) ||
                other.profileBoostExpiresAt == profileBoostExpiresAt) &&
            (identical(other.crushBowlActive, crushBowlActive) ||
                other.crushBowlActive == crushBowlActive) &&
            (identical(other.crushBowlExpiresAt, crushBowlExpiresAt) ||
                other.crushBowlExpiresAt == crushBowlExpiresAt) &&
            (identical(other.activeConversations, activeConversations) ||
                other.activeConversations == activeConversations) &&
            (identical(
                  other.subscriptionChatIncrements,
                  subscriptionChatIncrements,
                ) ||
                other.subscriptionChatIncrements ==
                    subscriptionChatIncrements) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.beforeAnything, beforeAnything) ||
                other.beforeAnything == beforeAnything) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.clubbing, clubbing) ||
                other.clubbing == clubbing) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.drinking, drinking) ||
                other.drinking == drinking) &&
            (identical(other.favoriteQuotes, favoriteQuotes) ||
                other.favoriteQuotes == favoriteQuotes) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.hobbies, hobbies) || other.hobbies == hobbies) &&
            (identical(other.lifestyleInterests, lifestyleInterests) ||
                other.lifestyleInterests == lifestyleInterests) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.minAge, minAge) || other.minAge == minAge) &&
            (identical(other.maxAge, maxAge) || other.maxAge == maxAge) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.occupation, occupation) ||
                other.occupation == occupation) &&
            (identical(other.preferredGender, preferredGender) ||
                other.preferredGender == preferredGender) &&
            (identical(other.religion, religion) ||
                other.religion == religion) &&
            (identical(other.smoking, smoking) || other.smoking == smoking) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userStatus, userStatus) ||
                other.userStatus == userStatus) &&
            (identical(other.verificationDate, verificationDate) ||
                other.verificationDate == verificationDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    socialAccounts,
    profilePhoto,
    email,
    role,
    status,
    loginType,
    appUsageType,
    maritalStatus,
    aiAvatar,
    aiAvatarStyle,
    const DeepCollectionEquality().hash(_profileImages),
    datingIntentions,
    pets,
    voicePrompt,
    video,
    const DeepCollectionEquality().hash(_greenFlags),
    const DeepCollectionEquality().hash(_redFlags),
    verificationStatus,
    verificationMethod,
    const DeepCollectionEquality().hash(_verificationDocuments),
    profileSetup,
    profileCompleted,
    profileCompletionStep,
    const DeepCollectionEquality().hash(_preferredDatingIntentions),
    const DeepCollectionEquality().hash(_preferredNationality),
    const DeepCollectionEquality().hash(_preferredReligion),
    isDelete,
    suspended,
    bowlBalance,
    permanentChatIncrements,
    const DeepCollectionEquality().hash(_rejectedUsers),
    receivedLikesCount,
    profileBoostActive,
    profileBoostExpiresAt,
    crushBowlActive,
    crushBowlExpiresAt,
    activeConversations,
    subscriptionChatIncrements,
    createdAt,
    updatedAt,
    v,
    age,
    beforeAnything,
    bio,
    clubbing,
    dateOfBirth,
    drinking,
    favoriteQuotes,
    firstName,
    lastName,
    fullName,
    hobbies,
    lifestyleInterests,
    location,
    minAge,
    maxAge,
    nickname,
    occupation,
    preferredGender,
    religion,
    smoking,
    userName,
    userStatus,
    verificationDate,
  ]);

  /// Create a copy of RequestedBy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestedByImplCopyWith<_$RequestedByImpl> get copyWith =>
      __$$RequestedByImplCopyWithImpl<_$RequestedByImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestedByImplToJson(this);
  }
}

abstract class _RequestedBy implements RequestedBy {
  const factory _RequestedBy({
    @JsonKey(name: '_id') final String? id,
    final SocialAccounts? socialAccounts,
    final String? profilePhoto,
    final String? email,
    final String? role,
    final String? status,
    final String? loginType,
    final String? appUsageType,
    final String? maritalStatus,
    final String? aiAvatar,
    final String? aiAvatarStyle,
    final List<String>? profileImages,
    final String? datingIntentions,
    final bool? pets,
    final String? voicePrompt,
    final String? video,
    final List<String>? greenFlags,
    final List<String>? redFlags,
    final String? verificationStatus,
    final String? verificationMethod,
    final List<String>? verificationDocuments,
    final bool? profileSetup,
    final bool? profileCompleted,
    final String? profileCompletionStep,
    final List<String>? preferredDatingIntentions,
    final List<String>? preferredNationality,
    final List<String>? preferredReligion,
    final bool? isDelete,
    final bool? suspended,
    final int? bowlBalance,
    final int? permanentChatIncrements,
    final List<String>? rejectedUsers,
    final int? receivedLikesCount,
    final bool? profileBoostActive,
    final DateTime? profileBoostExpiresAt,
    final bool? crushBowlActive,
    final DateTime? crushBowlExpiresAt,
    final int? activeConversations,
    final int? subscriptionChatIncrements,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    @JsonKey(name: '__v') final int? v,
    final int? age,
    final String? beforeAnything,
    final String? bio,
    final String? clubbing,
    final DateTime? dateOfBirth,
    final String? drinking,
    final String? favoriteQuotes,
    final String? firstName,
    final String? lastName,
    final String? fullName,
    final String? hobbies,
    final String? lifestyleInterests,
    final String? location,
    final int? minAge,
    final int? maxAge,
    final String? nickname,
    final String? occupation,
    final String? preferredGender,
    final String? religion,
    final String? smoking,
    final String? userName,
    final String? userStatus,
    final DateTime? verificationDate,
  }) = _$RequestedByImpl;

  factory _RequestedBy.fromJson(Map<String, dynamic> json) =
      _$RequestedByImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  SocialAccounts? get socialAccounts;
  @override
  String? get profilePhoto;
  @override
  String? get email;
  @override
  String? get role;
  @override
  String? get status;
  @override
  String? get loginType;
  @override
  String? get appUsageType;
  @override
  String? get maritalStatus;
  @override
  String? get aiAvatar;
  @override
  String? get aiAvatarStyle;
  @override
  List<String>? get profileImages;
  @override
  String? get datingIntentions;
  @override
  bool? get pets;
  @override
  String? get voicePrompt;
  @override
  String? get video;
  @override
  List<String>? get greenFlags;
  @override
  List<String>? get redFlags;
  @override
  String? get verificationStatus;
  @override
  String? get verificationMethod;
  @override
  List<String>? get verificationDocuments;
  @override
  bool? get profileSetup;
  @override
  bool? get profileCompleted;
  @override
  String? get profileCompletionStep;
  @override
  List<String>? get preferredDatingIntentions;
  @override
  List<String>? get preferredNationality;
  @override
  List<String>? get preferredReligion;
  @override
  bool? get isDelete;
  @override
  bool? get suspended;
  @override
  int? get bowlBalance;
  @override
  int? get permanentChatIncrements;
  @override
  List<String>? get rejectedUsers;
  @override
  int? get receivedLikesCount;
  @override
  bool? get profileBoostActive;
  @override
  DateTime? get profileBoostExpiresAt;
  @override
  bool? get crushBowlActive;
  @override
  DateTime? get crushBowlExpiresAt;
  @override
  int? get activeConversations;
  @override
  int? get subscriptionChatIncrements;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(name: '__v')
  int? get v;
  @override
  int? get age;
  @override
  String? get beforeAnything;
  @override
  String? get bio;
  @override
  String? get clubbing;
  @override
  DateTime? get dateOfBirth;
  @override
  String? get drinking;
  @override
  String? get favoriteQuotes;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get fullName;
  @override
  String? get hobbies;
  @override
  String? get lifestyleInterests;
  @override
  String? get location;
  @override
  int? get minAge;
  @override
  int? get maxAge;
  @override
  String? get nickname;
  @override
  String? get occupation;
  @override
  String? get preferredGender;
  @override
  String? get religion;
  @override
  String? get smoking;
  @override
  String? get userName;
  @override
  String? get userStatus;
  @override
  DateTime? get verificationDate;

  /// Create a copy of RequestedBy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestedByImplCopyWith<_$RequestedByImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SocialAccounts _$SocialAccountsFromJson(Map<String, dynamic> json) {
  return _SocialAccounts.fromJson(json);
}

/// @nodoc
mixin _$SocialAccounts {
  String? get googleId => throw _privateConstructorUsedError;
  String? get appleId => throw _privateConstructorUsedError;
  String? get facebookId => throw _privateConstructorUsedError;

  /// Serializes this SocialAccounts to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocialAccounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocialAccountsCopyWith<SocialAccounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialAccountsCopyWith<$Res> {
  factory $SocialAccountsCopyWith(
    SocialAccounts value,
    $Res Function(SocialAccounts) then,
  ) = _$SocialAccountsCopyWithImpl<$Res, SocialAccounts>;
  @useResult
  $Res call({String? googleId, String? appleId, String? facebookId});
}

/// @nodoc
class _$SocialAccountsCopyWithImpl<$Res, $Val extends SocialAccounts>
    implements $SocialAccountsCopyWith<$Res> {
  _$SocialAccountsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocialAccounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? googleId = freezed,
    Object? appleId = freezed,
    Object? facebookId = freezed,
  }) {
    return _then(
      _value.copyWith(
            googleId: freezed == googleId
                ? _value.googleId
                : googleId // ignore: cast_nullable_to_non_nullable
                      as String?,
            appleId: freezed == appleId
                ? _value.appleId
                : appleId // ignore: cast_nullable_to_non_nullable
                      as String?,
            facebookId: freezed == facebookId
                ? _value.facebookId
                : facebookId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SocialAccountsImplCopyWith<$Res>
    implements $SocialAccountsCopyWith<$Res> {
  factory _$$SocialAccountsImplCopyWith(
    _$SocialAccountsImpl value,
    $Res Function(_$SocialAccountsImpl) then,
  ) = __$$SocialAccountsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? googleId, String? appleId, String? facebookId});
}

/// @nodoc
class __$$SocialAccountsImplCopyWithImpl<$Res>
    extends _$SocialAccountsCopyWithImpl<$Res, _$SocialAccountsImpl>
    implements _$$SocialAccountsImplCopyWith<$Res> {
  __$$SocialAccountsImplCopyWithImpl(
    _$SocialAccountsImpl _value,
    $Res Function(_$SocialAccountsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SocialAccounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? googleId = freezed,
    Object? appleId = freezed,
    Object? facebookId = freezed,
  }) {
    return _then(
      _$SocialAccountsImpl(
        googleId: freezed == googleId
            ? _value.googleId
            : googleId // ignore: cast_nullable_to_non_nullable
                  as String?,
        appleId: freezed == appleId
            ? _value.appleId
            : appleId // ignore: cast_nullable_to_non_nullable
                  as String?,
        facebookId: freezed == facebookId
            ? _value.facebookId
            : facebookId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialAccountsImpl implements _SocialAccounts {
  const _$SocialAccountsImpl({this.googleId, this.appleId, this.facebookId});

  factory _$SocialAccountsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialAccountsImplFromJson(json);

  @override
  final String? googleId;
  @override
  final String? appleId;
  @override
  final String? facebookId;

  @override
  String toString() {
    return 'SocialAccounts(googleId: $googleId, appleId: $appleId, facebookId: $facebookId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialAccountsImpl &&
            (identical(other.googleId, googleId) ||
                other.googleId == googleId) &&
            (identical(other.appleId, appleId) || other.appleId == appleId) &&
            (identical(other.facebookId, facebookId) ||
                other.facebookId == facebookId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, googleId, appleId, facebookId);

  /// Create a copy of SocialAccounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialAccountsImplCopyWith<_$SocialAccountsImpl> get copyWith =>
      __$$SocialAccountsImplCopyWithImpl<_$SocialAccountsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialAccountsImplToJson(this);
  }
}

abstract class _SocialAccounts implements SocialAccounts {
  const factory _SocialAccounts({
    final String? googleId,
    final String? appleId,
    final String? facebookId,
  }) = _$SocialAccountsImpl;

  factory _SocialAccounts.fromJson(Map<String, dynamic> json) =
      _$SocialAccountsImpl.fromJson;

  @override
  String? get googleId;
  @override
  String? get appleId;
  @override
  String? get facebookId;

  /// Create a copy of SocialAccounts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialAccountsImplCopyWith<_$SocialAccountsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
