import 'package:get/get.dart';

import '../../Presentation/ai_avatar_pick_image/bindings/ai_avatar_pick_image_binding.dart';
import '../../Presentation/ai_avatar_pick_image/views/ai_avatar_pick_image_view.dart';
import '../../Presentation/booking_details/bindings/booking_details_binding.dart';
import '../../Presentation/booking_details/views/booking_details_view.dart';
import '../../Presentation/cafeconnect/bindings/cafeconnect_binding.dart';
import '../../Presentation/cafeconnect/views/cafeconnect_view.dart';
import '../../Presentation/cafeconnect_booking_details/bindings/cafeconnect_booking_details_binding.dart';
import '../../Presentation/cafeconnect_booking_details/views/cafeconnect_booking_details_view.dart';
import '../../Presentation/cafeconnect_chat/bindings/cafeconnect_chat_binding.dart';
import '../../Presentation/cafeconnect_chat/views/cafeconnect_chat_view.dart';
import '../../Presentation/cafeconnect_conversation/bindings/cafeconnect_conversation_binding.dart';
import '../../Presentation/cafeconnect_conversation/views/cafeconnect_conversation_view.dart';
import '../../Presentation/chat/bindings/chat_binding.dart';
import '../../Presentation/chat/views/chat_view.dart';
import '../../Presentation/email_verification/bindings/email_verification_binding.dart';
import '../../Presentation/email_verification/views/email_verification_view.dart';
import '../../Presentation/home/bindings/home_binding.dart';
import '../../Presentation/home/views/home_view.dart';
import '../../Presentation/intro/bindings/intro_binding.dart';
import '../../Presentation/intro/views/intro_view.dart';
import '../../Presentation/login/bindings/login_binding.dart';
import '../../Presentation/login/views/login_view.dart';
import '../../Presentation/make_a_booking/bindings/make_a_booking_binding.dart';
import '../../Presentation/make_a_booking/views/make_a_booking_view.dart';
import '../../Presentation/manually_verify/bindings/manually_verify_binding.dart';
import '../../Presentation/manually_verify/views/manually_verify_view.dart';
import '../../Presentation/manually_verify_second/bindings/manually_verify_second_binding.dart';
import '../../Presentation/manually_verify_second/views/manually_verify_second_view.dart';
import '../../Presentation/match_making_setting/bindings/match_making_setting_binding.dart';
import '../../Presentation/match_making_setting/views/match_making_setting_view.dart';
import '../../Presentation/match_profile/bindings/match_profile_binding.dart';
import '../../Presentation/match_profile/views/match_profile_view.dart';
import '../../Presentation/matches/bindings/matches_binding.dart';
import '../../Presentation/matches/views/matches_view.dart';
import '../../Presentation/newsletter/bindings/newsletter_binding.dart';
import '../../Presentation/newsletter/views/newsletter_view.dart';
import '../../Presentation/newsletter_detail/bindings/newsletter_detail_binding.dart';
import '../../Presentation/newsletter_detail/views/newsletter_detail_view.dart';
import '../../Presentation/payment_system/bindings/payment_system_binding.dart';
import '../../Presentation/payment_system/views/payment_system_view.dart';
import '../../Presentation/profile_creation/bindings/profile_creation_binding.dart';
import '../../Presentation/profile_creation/views/profile_creation_decision.dart';
import '../../Presentation/profile_creation/views/profile_creation_view.dart';
import '../../Presentation/profile_creation/views/voice_prompt_one.dart';
import '../../Presentation/profile_creation/views/voice_prompt_second.dart';
import '../../Presentation/received_likes/bindings/received_likes_binding.dart';
import '../../Presentation/received_likes/views/received_likes_view.dart';
import '../../Presentation/redeem/bindings/redeem_binding.dart';
import '../../Presentation/redeem/views/redeem_view.dart';
import '../../Presentation/reset_password/bindings/reset_password_binding.dart';
import '../../Presentation/reset_password/views/reset_password_view.dart';
import '../../Presentation/second_splash/bindings/second_splash_binding.dart';
import '../../Presentation/second_splash/views/second_splash_view.dart';
import '../../Presentation/send_otp/bindings/send_otp_binding.dart';
import '../../Presentation/send_otp/views/send_otp_view.dart';
import '../../Presentation/signup/bindings/signup_binding.dart';
import '../../Presentation/signup/views/signup_view.dart';
import '../../Presentation/splash/bindings/splash_binding.dart';
import '../../Presentation/splash/views/splash_view.dart';
import '../../Presentation/system_chat/bindings/system_chat_binding.dart';
import '../../Presentation/system_chat/views/system_chat_view.dart';
import '../../Presentation/third_splash/bindings/third_splash_binding.dart';
import '../../Presentation/third_splash/views/third_splash_view.dart';
import '../../Presentation/user_booking_details/bindings/user_booking_details_binding.dart';
import '../../Presentation/user_booking_details/views/user_booking_details_view.dart';
import '../../Presentation/verify_otp/bindings/verify_otp_binding.dart';
import '../../Presentation/verify_otp/views/verify_otp_view.dart';
import '../../Presentation/vouchers/bindings/vouchers_binding.dart';
import '../../Presentation/vouchers/views/vouchers_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SECOND_SPLASH,
      page: () => const SecondSplashView(),
      binding: SecondSplashBinding(),
    ),
    GetPage(
      name: _Paths.THIRD_SPLASH,
      page: () => const ThirdSplashView(),
      binding: ThirdSplashBinding(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 800), // 👈 Add this
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 800), // 👈 Add this
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
      transitionDuration: const Duration(milliseconds: 800), // 👈 Add this
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: _Paths.EMAIL_VERIFICATION,
      page: () => const EmailVerificationView(),
      binding: EmailVerificationBinding(),
    ),
    GetPage(
      name: _Paths.SEND_OTP,
      page: () => const SendOtpView(),
      binding: SendOtpBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_OTP,
      page: () => const VerifyOtpView(),
      binding: VerifyOtpBinding(),
      transitionDuration: const Duration(milliseconds: 800), // 👈 Add this
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_CREATION,
      page: () => ProfileCreationView(),
      binding: ProfileCreationBinding(),
      transitionDuration: const Duration(milliseconds: 800), // 👈 Add this
    ),
    GetPage(
      name: _Paths.PROFILE_CREATION_DECISION,
      page: () => const ProfileCreationDecisionView(),
      binding: ProfileCreationBinding(),
      transitionDuration: const Duration(milliseconds: 800), // 👈 Add this
    ),
    GetPage(
      name: _Paths.VOICE_PROMPT_ONE,
      page: () => const VoicePromptOneView(),
      binding: ProfileCreationBinding(),
    ),
    GetPage(
      name: _Paths.VOICE_PROMPT_SECOND,
      page: () => const VoicePromptSecondView(),
      binding: ProfileCreationBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.MATCH_PROFILE,
      page: () => const MatchProfileView(),
      binding: MatchProfileBinding(),
    ),
    GetPage(
      name: _Paths.REDEEM,
      page: () => const RedeemView(),
      binding: RedeemBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_DETAILS,
      page: () => const BookingDetailsView(),
      binding: BookingDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_SYSTEM,
      page: () => const PaymentSystemView(),
      binding: PaymentSystemBinding(),
    ),
    GetPage(
      name: _Paths.MANUALLY_VERIFY,
      page: () => const ManuallyVerifyView(),
      binding: ManuallyVerifyBinding(),
    ),
    GetPage(
      name: _Paths.MANUALLY_VERIFY_SECOND,
      page: () => const ManuallyVerifySecondView(),
      binding: ManuallyVerifySecondBinding(),
    ),
    GetPage(
      name: _Paths.AI_AVATAR_PICK_IMAGE,
      page: () => const AiAvatarPickImageView(),
      binding: AiAvatarPickImageBinding(),
    ),
    GetPage(
      name: _Paths.MATCHES,
      page: () => const MatchesView(),
      binding: MatchesBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => const IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: _Paths.MATCH_MAKING_SETTING,
      page: () => const MatchMakingSettingView(),
      binding: MatchMakingSettingBinding(),
    ),
    GetPage(
      name: _Paths.CAFECONNECT_CONVERSATION,
      page: () => const CafeconnectConversationView(),
      binding: CafeconnectConversationBinding(),
    ),
    GetPage(
      name: _Paths.CAFECONNECT_BOOKING_DETAILS,
      page: () => const CafeconnectBookingDetailsView(),
      binding: CafeconnectBookingDetailsBinding(),
    ),
    GetPage(
      name: _Paths.MAKE_A_BOOKING,
      page: () => const MakeABookingView(),
      binding: MakeABookingBinding(),
    ),
    GetPage(
      name: _Paths.USER_BOOKING_DETAILS,
      page: () => const UserBookingDetailsView(),
      binding: UserBookingDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SYSTEM_CHAT,
      page: () => const SystemChatView(),
      binding: SystemChatBinding(),
    ),
    GetPage(
      name: _Paths.NEWSLETTER,
      page: () => const NewsletterView(),
      binding: NewsletterBinding(),
    ),
    GetPage(
      name: _Paths.VOUCHERS,
      page: () => const VouchersView(),
      binding: VouchersBinding(),
    ),
    GetPage(
      name: _Paths.NEWSLETTER_DETAIL,
      page: () => const NewsletterDetailView(),
      binding: NewsletterDetailBinding(),
    ),
    GetPage(
      name: _Paths.CAFECONNECT,
      page: () => const CafeConnectView(),
      binding: CafeconnectBinding(),
    ),
    GetPage(
      name: _Paths.CAFECONNECT_CHAT,
      page: () => const CafeconnectChatView(),
      binding: CafeconnectChatBinding(),
    ),
    GetPage(
      name: _Paths.RECEIVED_LIKES,
      page: () => const ReceivedLikesView(),
      binding: ReceivedLikesBinding(),
    ),
  ];
}
