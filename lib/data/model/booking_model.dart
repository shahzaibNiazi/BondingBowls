import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

@freezed
class BookingModel with _$BookingModel {
  const factory BookingModel({
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
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);
}

/* ---------------- USER ---------------- */

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: '_id') String? id,
    String? fullName,
    String? profilePhoto,
    String? nickname,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

/* ---------------- CAFE ---------------- */

@freezed
class CafeData with _$CafeData {
  const factory CafeData({
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
  }) = _CafeData;

  factory CafeData.fromJson(Map<String, dynamic> json) =>
      _$CafeDataFromJson(json);
}

/* ---------------- LOCATION ---------------- */

@freezed
class LocationModel with _$LocationModel {
  const factory LocationModel({String? exactLocation, String? region}) =
      _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}

/* ---------------- REVIEWS ---------------- */

@freezed
class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    double? rating,
    int? reviewCount,
    String? reviewText,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}

/* ---------------- OPENING HOURS ---------------- */

@freezed
class OpeningHour with _$OpeningHour {
  const factory OpeningHour({
    String? day,
    String? openingTime,
    String? closingTime,
    bool? isClosed,
  }) = _OpeningHour;

  factory OpeningHour.fromJson(Map<String, dynamic> json) =>
      _$OpeningHourFromJson(json);
}

/* ---------------- BOOKING DAY HOURS ---------------- */

@freezed
class BookingDayHours with _$BookingDayHours {
  const factory BookingDayHours({
    String? openingTime,
    String? closingTime,
    bool? isClosed,
    String? formatted,
  }) = _BookingDayHours;

  factory BookingDayHours.fromJson(Map<String, dynamic> json) =>
      _$BookingDayHoursFromJson(json);
}

/* ---------------- FORMATTED DATE ---------------- */

@freezed
class FormattedBookingDate with _$FormattedBookingDate {
  const factory FormattedBookingDate({
    String? date,
    String? dateShort,
    String? time,
    String? dayName,
    String? iso,
  }) = _FormattedBookingDate;

  factory FormattedBookingDate.fromJson(Map<String, dynamic> json) =>
      _$FormattedBookingDateFromJson(json);
}
