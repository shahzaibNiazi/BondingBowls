import 'package:freezed_annotation/freezed_annotation.dart';

part 'available_model.freezed.dart';
part 'available_model.g.dart';

@freezed
class AvailableModel with _$AvailableModel {
  const factory AvailableModel({
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
  }) = _AvailableModel;

  factory AvailableModel.fromJson(Map<String, dynamic> json) =>
      _$AvailableModelFromJson(json);
}

/* ------------------ USER ------------------ */

@freezed
class UserRefModel with _$UserRefModel {
  const factory UserRefModel({
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
  }) = _UserRefModel;

  factory UserRefModel.fromJson(Map<String, dynamic> json) =>
      _$UserRefModelFromJson(json);
}

/* ------------------ CAFE ------------------ */

@freezed
class CafeDataModel with _$CafeDataModel {
  const factory CafeDataModel({
    @JsonKey(name: '_id') String? id,
    CafeLocationModel? location,
    CafeReviewModel? reviews,
    String? name,
    String? category,
    num? averagePrice,
    String? image,
  }) = _CafeDataModel;

  factory CafeDataModel.fromJson(Map<String, dynamic> json) =>
      _$CafeDataModelFromJson(json);
}

/* ------------------ LOCATION ------------------ */

@freezed
class CafeLocationModel with _$CafeLocationModel {
  const factory CafeLocationModel({String? exactLocation, String? region}) =
      _CafeLocationModel;

  factory CafeLocationModel.fromJson(Map<String, dynamic> json) =>
      _$CafeLocationModelFromJson(json);
}

/* ------------------ REVIEWS ------------------ */

@freezed
class CafeReviewModel with _$CafeReviewModel {
  const factory CafeReviewModel({
    num? rating,
    int? reviewCount,
    String? reviewText,
  }) = _CafeReviewModel;

  factory CafeReviewModel.fromJson(Map<String, dynamic> json) =>
      _$CafeReviewModelFromJson(json);
}
