// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ConversationModel _$ConversationModelFromJson(Map<String, dynamic> json) {
  return _ConversationModel.fromJson(json);
}

/// @nodoc
mixin _$ConversationModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  OtherUserModel? get otherUser => throw _privateConstructorUsedError;
  String? get lastMessage => throw _privateConstructorUsedError;
  String? get lastMessageAt => throw _privateConstructorUsedError;
  OtherUserModel? get lastMessageBy =>
      throw _privateConstructorUsedError; // <-- Updated type
  int? get unreadCount => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ConversationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConversationModelCopyWith<ConversationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationModelCopyWith<$Res> {
  factory $ConversationModelCopyWith(
    ConversationModel value,
    $Res Function(ConversationModel) then,
  ) = _$ConversationModelCopyWithImpl<$Res, ConversationModel>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? type,
    OtherUserModel? otherUser,
    String? lastMessage,
    String? lastMessageAt,
    OtherUserModel? lastMessageBy,
    int? unreadCount,
    String? createdAt,
    String? updatedAt,
  });

  $OtherUserModelCopyWith<$Res>? get otherUser;
  $OtherUserModelCopyWith<$Res>? get lastMessageBy;
}

/// @nodoc
class _$ConversationModelCopyWithImpl<$Res, $Val extends ConversationModel>
    implements $ConversationModelCopyWith<$Res> {
  _$ConversationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? otherUser = freezed,
    Object? lastMessage = freezed,
    Object? lastMessageAt = freezed,
    Object? lastMessageBy = freezed,
    Object? unreadCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            otherUser: freezed == otherUser
                ? _value.otherUser
                : otherUser // ignore: cast_nullable_to_non_nullable
                      as OtherUserModel?,
            lastMessage: freezed == lastMessage
                ? _value.lastMessage
                : lastMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastMessageAt: freezed == lastMessageAt
                ? _value.lastMessageAt
                : lastMessageAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastMessageBy: freezed == lastMessageBy
                ? _value.lastMessageBy
                : lastMessageBy // ignore: cast_nullable_to_non_nullable
                      as OtherUserModel?,
            unreadCount: freezed == unreadCount
                ? _value.unreadCount
                : unreadCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of ConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OtherUserModelCopyWith<$Res>? get otherUser {
    if (_value.otherUser == null) {
      return null;
    }

    return $OtherUserModelCopyWith<$Res>(_value.otherUser!, (value) {
      return _then(_value.copyWith(otherUser: value) as $Val);
    });
  }

  /// Create a copy of ConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OtherUserModelCopyWith<$Res>? get lastMessageBy {
    if (_value.lastMessageBy == null) {
      return null;
    }

    return $OtherUserModelCopyWith<$Res>(_value.lastMessageBy!, (value) {
      return _then(_value.copyWith(lastMessageBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConversationModelImplCopyWith<$Res>
    implements $ConversationModelCopyWith<$Res> {
  factory _$$ConversationModelImplCopyWith(
    _$ConversationModelImpl value,
    $Res Function(_$ConversationModelImpl) then,
  ) = __$$ConversationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? type,
    OtherUserModel? otherUser,
    String? lastMessage,
    String? lastMessageAt,
    OtherUserModel? lastMessageBy,
    int? unreadCount,
    String? createdAt,
    String? updatedAt,
  });

  @override
  $OtherUserModelCopyWith<$Res>? get otherUser;
  @override
  $OtherUserModelCopyWith<$Res>? get lastMessageBy;
}

/// @nodoc
class __$$ConversationModelImplCopyWithImpl<$Res>
    extends _$ConversationModelCopyWithImpl<$Res, _$ConversationModelImpl>
    implements _$$ConversationModelImplCopyWith<$Res> {
  __$$ConversationModelImplCopyWithImpl(
    _$ConversationModelImpl _value,
    $Res Function(_$ConversationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? otherUser = freezed,
    Object? lastMessage = freezed,
    Object? lastMessageAt = freezed,
    Object? lastMessageBy = freezed,
    Object? unreadCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$ConversationModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        otherUser: freezed == otherUser
            ? _value.otherUser
            : otherUser // ignore: cast_nullable_to_non_nullable
                  as OtherUserModel?,
        lastMessage: freezed == lastMessage
            ? _value.lastMessage
            : lastMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastMessageAt: freezed == lastMessageAt
            ? _value.lastMessageAt
            : lastMessageAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastMessageBy: freezed == lastMessageBy
            ? _value.lastMessageBy
            : lastMessageBy // ignore: cast_nullable_to_non_nullable
                  as OtherUserModel?,
        unreadCount: freezed == unreadCount
            ? _value.unreadCount
            : unreadCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConversationModelImpl implements _ConversationModel {
  const _$ConversationModelImpl({
    @JsonKey(name: '_id') this.id,
    this.type,
    this.otherUser,
    this.lastMessage,
    this.lastMessageAt,
    this.lastMessageBy,
    this.unreadCount,
    this.createdAt,
    this.updatedAt,
  });

  factory _$ConversationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversationModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? type;
  @override
  final OtherUserModel? otherUser;
  @override
  final String? lastMessage;
  @override
  final String? lastMessageAt;
  @override
  final OtherUserModel? lastMessageBy;
  // <-- Updated type
  @override
  final int? unreadCount;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'ConversationModel(id: $id, type: $type, otherUser: $otherUser, lastMessage: $lastMessage, lastMessageAt: $lastMessageAt, lastMessageBy: $lastMessageBy, unreadCount: $unreadCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.otherUser, otherUser) ||
                other.otherUser == otherUser) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastMessageAt, lastMessageAt) ||
                other.lastMessageAt == lastMessageAt) &&
            (identical(other.lastMessageBy, lastMessageBy) ||
                other.lastMessageBy == lastMessageBy) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    otherUser,
    lastMessage,
    lastMessageAt,
    lastMessageBy,
    unreadCount,
    createdAt,
    updatedAt,
  );

  /// Create a copy of ConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationModelImplCopyWith<_$ConversationModelImpl> get copyWith =>
      __$$ConversationModelImplCopyWithImpl<_$ConversationModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversationModelImplToJson(this);
  }
}

abstract class _ConversationModel implements ConversationModel {
  const factory _ConversationModel({
    @JsonKey(name: '_id') final String? id,
    final String? type,
    final OtherUserModel? otherUser,
    final String? lastMessage,
    final String? lastMessageAt,
    final OtherUserModel? lastMessageBy,
    final int? unreadCount,
    final String? createdAt,
    final String? updatedAt,
  }) = _$ConversationModelImpl;

  factory _ConversationModel.fromJson(Map<String, dynamic> json) =
      _$ConversationModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get type;
  @override
  OtherUserModel? get otherUser;
  @override
  String? get lastMessage;
  @override
  String? get lastMessageAt;
  @override
  OtherUserModel? get lastMessageBy; // <-- Updated type
  @override
  int? get unreadCount;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of ConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversationModelImplCopyWith<_$ConversationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OtherUserModel _$OtherUserModelFromJson(Map<String, dynamic> json) {
  return _OtherUserModel.fromJson(json);
}

/// @nodoc
mixin _$OtherUserModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get profilePhoto => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;

  /// Serializes this OtherUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OtherUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtherUserModelCopyWith<OtherUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherUserModelCopyWith<$Res> {
  factory $OtherUserModelCopyWith(
    OtherUserModel value,
    $Res Function(OtherUserModel) then,
  ) = _$OtherUserModelCopyWithImpl<$Res, OtherUserModel>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? profilePhoto,
    String? fullName,
    String? nickname,
  });
}

/// @nodoc
class _$OtherUserModelCopyWithImpl<$Res, $Val extends OtherUserModel>
    implements $OtherUserModelCopyWith<$Res> {
  _$OtherUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtherUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? profilePhoto = freezed,
    Object? fullName = freezed,
    Object? nickname = freezed,
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
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
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
abstract class _$$OtherUserModelImplCopyWith<$Res>
    implements $OtherUserModelCopyWith<$Res> {
  factory _$$OtherUserModelImplCopyWith(
    _$OtherUserModelImpl value,
    $Res Function(_$OtherUserModelImpl) then,
  ) = __$$OtherUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String? id,
    String? profilePhoto,
    String? fullName,
    String? nickname,
  });
}

/// @nodoc
class __$$OtherUserModelImplCopyWithImpl<$Res>
    extends _$OtherUserModelCopyWithImpl<$Res, _$OtherUserModelImpl>
    implements _$$OtherUserModelImplCopyWith<$Res> {
  __$$OtherUserModelImplCopyWithImpl(
    _$OtherUserModelImpl _value,
    $Res Function(_$OtherUserModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtherUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? profilePhoto = freezed,
    Object? fullName = freezed,
    Object? nickname = freezed,
  }) {
    return _then(
      _$OtherUserModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        profilePhoto: freezed == profilePhoto
            ? _value.profilePhoto
            : profilePhoto // ignore: cast_nullable_to_non_nullable
                  as String?,
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
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
class _$OtherUserModelImpl implements _OtherUserModel {
  const _$OtherUserModelImpl({
    @JsonKey(name: '_id') this.id,
    this.profilePhoto,
    this.fullName,
    this.nickname,
  });

  factory _$OtherUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtherUserModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? profilePhoto;
  @override
  final String? fullName;
  @override
  final String? nickname;

  @override
  String toString() {
    return 'OtherUserModel(id: $id, profilePhoto: $profilePhoto, fullName: $fullName, nickname: $nickname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtherUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, profilePhoto, fullName, nickname);

  /// Create a copy of OtherUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtherUserModelImplCopyWith<_$OtherUserModelImpl> get copyWith =>
      __$$OtherUserModelImplCopyWithImpl<_$OtherUserModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OtherUserModelImplToJson(this);
  }
}

abstract class _OtherUserModel implements OtherUserModel {
  const factory _OtherUserModel({
    @JsonKey(name: '_id') final String? id,
    final String? profilePhoto,
    final String? fullName,
    final String? nickname,
  }) = _$OtherUserModelImpl;

  factory _OtherUserModel.fromJson(Map<String, dynamic> json) =
      _$OtherUserModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get profilePhoto;
  @override
  String? get fullName;
  @override
  String? get nickname;

  /// Create a copy of OtherUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtherUserModelImplCopyWith<_$OtherUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
