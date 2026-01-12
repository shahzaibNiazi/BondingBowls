class ApiEndPoints {
  static String baseUrl = "https://bonding-bowls.projectco.space/api/v1/users/";
  static String otherBaseUrl = "https://bonding-bowls.projectco.space/api/v1/";
  static String imageUrl = "https://bonding-bowls.projectco.space";
  static String multiBaseUrl = "https://bonding-bowls.projectco.space/";
  static String get login => "login/";
  static String get register => "create/";
  static String get socialLogin => "social-login/";
  static String get verifyOTP => "verify-otp/";
  static String get profileCreation => "update-profile/";
  static String get uploadImage => "upload-image-multer";
  static String get uploadVideo => "upload-video-multer";
  static String get uploadAudio => "upload-audio-multer";
  static String get getMatchingProfile => "matching/matches";
  static String get getNewsLetter => "newsletters/mobile/feed";
  static String get getCafe => "cafe-connects";
  static String get bookings => "bookings";
  static String get getBooking => "bookings/cafe";
  static String get likeYou => "cafe-connects/my-booked-and-liked";
  static String get available => "bookings/available";
  static String get getVouchers => "vouchers";
  static String get redeemVouchers => "vouchers/redeem";
  static String get likeProfile => "matching/like";
  static String get disLikeProfile => "matching/dislike";
  static String get superLikeProfile => "matching/superlike";
  static String get notifications => "/notifications";
  static String get report => "/reports";
}
