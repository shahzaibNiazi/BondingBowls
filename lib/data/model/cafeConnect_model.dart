import 'package:freezed_annotation/freezed_annotation.dart';

part 'cafeConnect_model.freezed.dart';
part 'cafeConnect_model.g.dart';

@freezed
class CafeModel with _$CafeModel {
  const factory CafeModel({
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
  }) = _CafeModel;

  factory CafeModel.fromJson(Map<String, dynamic> json) =>
      _$CafeModelFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({String? exactLocation, String? region}) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
class Reviews with _$Reviews {
  const factory Reviews({
    double? rating,
    int? reviewCount,
    String? reviewText,
  }) = _Reviews;

  factory Reviews.fromJson(Map<String, dynamic> json) =>
      _$ReviewsFromJson(json);
}

@freezed
class BookingStats with _$BookingStats {
  const factory BookingStats({
    int? maleBookings,
    int? femaleBookings,
    int? totalBookings,
    int? mutualLikes,
  }) = _BookingStats;

  factory BookingStats.fromJson(Map<String, dynamic> json) =>
      _$BookingStatsFromJson(json);
}

@freezed
class UserBooking with _$UserBooking {
  const factory UserBooking({
    @JsonKey(name: '_id') String? id,
    List<String>? lookingFor,
    List<String>? availableFor,
    String? bookingDate,
    String? additionalNotes,
    String? status,
    bool? isExpired,
  }) = _UserBooking;

  factory UserBooking.fromJson(Map<String, dynamic> json) =>
      _$UserBookingFromJson(json);
}

@freezed
class OperatingHour with _$OperatingHour {
  const factory OperatingHour({
    String? day,
    String? openingTime,
    String? closingTime,
    @Default(false) bool isClosed,
  }) = _OperatingHour;

  factory OperatingHour.fromJson(Map<String, dynamic> json) =>
      _$OperatingHourFromJson(json);
}
