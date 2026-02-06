import 'package:convo_hearts/data/model/voucher_detail_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'newsletter_model.freezed.dart';
part 'newsletter_model.g.dart';

@freezed
class AveragePrice with _$AveragePrice {
  const factory AveragePrice({int? min, int? max}) = _AveragePrice;

  factory AveragePrice.fromJson(Map<String, dynamic> json) =>
      _$AveragePriceFromJson(json);
}

@freezed
class CafeReview with _$CafeReview {
  const factory CafeReview({
    double? rating,
    int? reviewCount,
    String? reviewText,
  }) = _CafeReview;

  factory CafeReview.fromJson(Map<String, dynamic> json) =>
      _$CafeReviewFromJson(json);
}

@freezed
class CafeDetails with _$CafeDetails {
  const factory CafeDetails({
    CafeReview? cafeReviews,
    String? cafeName,
    String? cafeDescription,
  }) = _CafeDetails;

  factory CafeDetails.fromJson(Map<String, dynamic> json) =>
      _$CafeDetailsFromJson(json);
}

@freezed
class OperatingHour with _$OperatingHour {
  const factory OperatingHour({
    String? day,
    String? opening,
    String? closing,
    @Default(false) bool isClosed,
  }) = _OperatingHour;

  factory OperatingHour.fromJson(Map<String, dynamic> json) =>
      _$OperatingHourFromJson(json);
}

@freezed
class MediaAddition with _$MediaAddition {
  const factory MediaAddition({String? type, String? content, int? order}) =
      _MediaAddition;

  factory MediaAddition.fromJson(Map<String, dynamic> json) =>
      _$MediaAdditionFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    @JsonKey(name: '_id') String? id,
    String? title,
    String? secondaryText1,
    String? locationLink,
    String? displayImage,
    String? category,
    AveragePrice? averagePrice,
    VoucherDetailModel? voucherDetails,
    CafeDetails? cafeDetails,
    @Default('Enabled') String status,
    @Default(false) bool disableViewCount,
    @Default(0) int viewCount,
    String? location,
    @Default([]) List<OperatingHour> operatingHours,
    @Default([]) List<String> tags,
    @Default(false) bool isDeleted,
    @Default([]) List<MediaAddition> mediaAdditions,
    @JsonKey(name: '__v') @Default(0) int v,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class CategoryData with _$CategoryData {
  const factory CategoryData({
    @Default([]) List<Item> items,
    int? totalCount,
    bool? hasMore,
  }) = _CategoryData;

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
}

@freezed
class Categories with _$Categories {
  const factory Categories({
    @JsonKey(name: 'Food') CategoryData? food,
    @JsonKey(name: 'Beverages') CategoryData? beverages,
    @JsonKey(name: 'Events') CategoryData? events,
  }) = _Categories;

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
}

@freezed
class ApiResponse with _$ApiResponse {
  const factory ApiResponse({Categories? categories}) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}
