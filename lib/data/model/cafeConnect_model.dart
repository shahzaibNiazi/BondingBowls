import 'package:freezed_annotation/freezed_annotation.dart';

import 'newsletter_model.dart';

part 'cafeConnect_model.freezed.dart';
part 'cafeConnect_model.g.dart';

@freezed
class CafeModel with _$CafeModel {
  const factory CafeModel({
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
  const factory Reviews({int? rating, int? reviewCount}) = _Reviews;

  factory Reviews.fromJson(Map<String, dynamic> json) =>
      _$ReviewsFromJson(json);
}
