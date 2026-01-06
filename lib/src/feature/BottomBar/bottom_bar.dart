import 'package:convo_hearts/Presentation/matches/views/matches_view.dart';
import 'package:convo_hearts/src/feature/BottomBar/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Presentation/cafeconnect/views/cafeconnect_view.dart';
import '../../../Presentation/newsletter/views/newsletter_view.dart';
import '../food-discount/discount-profile.dart';
import 'chat/chats.dart';

// Enhanced Controller with smooth performance - no UI changes
class BottomNavController extends ChangeNotifier {
  int _selectedIndex = 0;
  bool _showBottomBar = true;

  int get selectedIndex => _selectedIndex;
  bool get showBottomBar => _showBottomBar;

  void changeTabIndex(int index) {
    if (_selectedIndex == index) return; // Prevent unnecessary rebuilds
    _selectedIndex = index;
    notifyListeners();
  }

  void setInitialIndex(int index) {
    _selectedIndex = index;
  }

  void setBottomBarVisibility(bool show) {
    _showBottomBar = show;
    notifyListeners();
  }

  void hideBottomBar() {
    _showBottomBar = false;
    notifyListeners();
  }

  void showBottomBar1() {
    _showBottomBar = true;
    notifyListeners();
  }
}

// Main Widget - same UI, improved performance
class BottomNavBar extends StatefulWidget {
  final int initialIndex;
  final bool showDiscountProfile;
  final bool showBottomBar;

  const BottomNavBar({
    super.key,
    this.initialIndex = 0,
    this.showDiscountProfile = false,
    this.showBottomBar = true,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late final BottomNavController controller;

  @override
  void initState() {
    super.initState();
    controller = BottomNavController();
    controller.setInitialIndex(widget.initialIndex);
    controller.setBottomBarVisibility(widget.showBottomBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return _getSelectedPage(controller.selectedIndex);
        },
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          if (!controller.showBottomBar) {
            return SizedBox.shrink();
          }
          return CurvedBottomNavigationBar(
            currentIndex: controller.selectedIndex,
            onTap: controller.changeTabIndex,
          );
        },
      ),
    );
  }

  Widget _getSelectedPage(int index) {
    List<Widget> pages = [
      MatchesView(),
      NewsletterView(),
      CafeConnectView(),
      ChatsScreen(),
      widget.showDiscountProfile ? ProfileDiscount() : MyProfileScreen(),
    ];

    return pages[index];
  }
}

// Enhanced CurvedBottomNavigationBar with more prominent oval center button
class CurvedBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final bool isVisible;
  final Duration animationDuration;

  const CurvedBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.isVisible = true,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final bottomNavHeight = isTablet ? 120.0 : 90.0;

    return AnimatedContainer(
      duration: animationDuration,
      height: isVisible ? bottomNavHeight : 0,
      child: AnimatedOpacity(
        duration: animationDuration,
        opacity: isVisible ? 1.0 : 0.0,
        child: SizedBox(
          height: bottomNavHeight,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              // Background with curved shape
              CustomPaint(
                size: Size(screenWidth, bottomNavHeight),
                painter: SmoothCurvedBottomBarPainter(),
              ),
              // Enhanced Center elevated coffee cup with more prominent oval shape
              Positioned(
                bottom: 35,
                left:
                    (screenWidth / 2) -
                    _getResponsiveCoffeeButtonWidth(screenWidth) / 2,
                child: ClipOval(
                  child: Container(
                    width: _getResponsiveCoffeeButtonWidth(screenWidth),
                    height: _getResponsiveCoffeeButtonHeight(screenWidth),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.12),
                          blurRadius: 12.0,
                          offset: Offset(0, 4),
                          spreadRadius: 2,
                        ),
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 6.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () => onTap(2),
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(
                          _getResponsiveCoffeeButtonWidth(screenWidth) / 2,
                          _getResponsiveCoffeeButtonHeight(screenWidth) / 2,
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/cup_coffee1.jpg",
                          width: _getResponsiveCoffeeImageSize(screenWidth),
                          height: _getResponsiveCoffeeImageSize(screenWidth),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width:
                                  _getResponsiveCoffeeImageSize(screenWidth) *
                                  0.6,
                              height:
                                  _getResponsiveCoffeeImageSize(screenWidth) *
                                  0.6,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.orange.shade400,
                                    Colors.orange.shade600,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Icon(
                                Icons.local_cafe,
                                size:
                                    _getResponsiveCoffeeImageSize(screenWidth) *
                                    0.4,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Navigation items with proper alignment
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Row(
                  children: [
                    // Matches
                    Expanded(
                      child: _buildNavItem(
                        0,
                        "assets/icon/svg/herats.svg",
                        "assets/icon/svg/hearts_blue.svg",
                        "Matches",
                        screenWidth,
                        Icons.favorite_outline,
                      ),
                    ),
                    // Newsletter
                    Expanded(
                      child: _buildNavItem(
                        1,
                        "assets/icon/svg/newsletter.svg",
                        "assets/icon/svg/newsletter_blue.svg",
                        "NewsLetter",
                        screenWidth,
                        Icons.article_outlined,
                      ),
                    ),
                    // Center space for elevated button
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 30,
                          ), // Adjusted space for larger oval button
                          Text(
                            'CafeConnect',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: currentIndex == 2
                                  ? const Color(0xff3771C8)
                                  : const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    // Chats
                    Expanded(
                      child: _buildNavItem(
                        3,
                        "assets/icon/svg/message.svg",
                        "assets/icon/svg/message_blue.svg",
                        "Chats",
                        screenWidth,
                        Icons.chat_bubble_outline,
                      ),
                    ),
                    // Profile
                    Expanded(
                      child: _buildNavItem(
                        4,
                        "assets/icon/svg/profile.svg",
                        "assets/icon/svg/profile_blue.svg",
                        "Profile",
                        screenWidth,
                        Icons.person_outline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    String normalIcon,
    String selectedIcon,
    String label,
    double screenWidth,
    IconData fallbackIcon,
  ) {
    bool isSelected = currentIndex == index;

    return GestureDetector(
      behavior: HitTestBehavior.translucent, // ✅ Makes invisible area clickable

      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 6,
        ), // ✅ Add vertical padding for bigger hit area

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              isSelected ? selectedIcon : normalIcon,
              width: _getResponsiveIconSize(screenWidth),
              height: _getResponsiveIconSize(screenWidth),
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  fallbackIcon,
                  size: _getResponsiveIconSize(screenWidth),
                  color: isSelected ? const Color(0xff3771C8) : Colors.grey,
                );
              },
            ),
            SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                color: isSelected
                    ? const Color(0xff3771C8)
                    : const Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  // Enhanced responsive methods for oval button
  double _getResponsiveIconSize(double screenWidth) {
    if (screenWidth > 600) return 26;
    if (screenWidth > 400) return 22;
    return 20;
  }

  // Width for oval button (wider)
  double _getResponsiveCoffeeButtonWidth(double screenWidth) {
    if (screenWidth <= 360) return 75.0;
    if (screenWidth >= 600) return 95.0;
    return 85.0;
  }

  // Height for oval button (taller than original circle)
  double _getResponsiveCoffeeButtonHeight(double screenWidth) {
    if (screenWidth <= 360) return 65.0;
    if (screenWidth >= 600) return 85.0;
    return 75.0;
  }

  // Coffee image size
  double _getResponsiveCoffeeImageSize(double screenWidth) {
    if (screenWidth <= 360) return 50.0;
    if (screenWidth >= 600) return 65.0;
    return 70.0;
  }

  // double _getResponsiveFontSize(double screenWidth, double baseFontSize) {
  //   if (screenWidth > 600) return baseFontSize - 2;
  //   if (screenWidth > 400) return baseFontSize;
  //   return baseFontSize - 12;
  // }
}

// Standalone BottomNavBar Widget
class StandaloneBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final bool show;

  const StandaloneBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.show = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!show) {
      return SizedBox.shrink();
    }

    return CurvedBottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      isVisible: show,
    );
  }
}

// // Enhanced Custom painter with larger oval cutout to accommodate the new oval button
// class SmoothCurvedBottomBarPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill
//       ..isAntiAlias = true;

//     final path = Path();

//     final double screenWidth = size.width;
//     final double centerX = size.width / 2;
//     final double cornerRadius = 20.0;
//     final double ovalWidth = 160.0; // Increased for larger oval button
//     final double ovalDepth = 28.0;   // Increased depth for better oval accommodation

//     // Create path with enhanced oval cutout
//     path.moveTo(0, size.height);
//     path.lineTo(0, cornerRadius);
//     path.quadraticBezierTo(0, 0, cornerRadius, 0);
//     path.lineTo(centerX - ovalWidth / 2, 0);

//     // Enhanced oval cutout curves for better oval button fit
//     path.quadraticBezierTo(
//       centerX - ovalWidth / 2,
//       -ovalDepth * 0.45,
//       centerX - ovalWidth / 2.8,
//       -ovalDepth * 0.95,
//     );

//     path.quadraticBezierTo(
//       centerX - ovalWidth / 6,
//       -ovalDepth - 4,
//       centerX,
//       -ovalDepth - 3,
//     );

//     path.quadraticBezierTo(
//       centerX + ovalWidth / 6,
//       -ovalDepth - 4,
//       centerX + ovalWidth / 2.8,
//       -ovalDepth * 0.95,
//     );

//     path.quadraticBezierTo(
//       centerX + ovalWidth / 2,
//       -ovalDepth * 0.45,
//       centerX + ovalWidth / 2,
//       0,
//     );

//     path.lineTo(size.width - cornerRadius, 0);
//     path.quadraticBezierTo(size.width, 0, size.width, cornerRadius);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     // Enhanced shadow for better depth perception
//     canvas.drawShadow(path, Colors.black.withOpacity(0.1), 6.0, false);
//     canvas.drawPath(path, paint);

//     // Draw border
//     final borderPaint = Paint()
//       ..color = const Color.fromARGB(255, 0, 0, 0)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 0.5;
//     canvas.drawPath(path, borderPaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

class SmoothCurvedBottomBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final path = Path();

    final double centerX = size.width / 2;
    final double cornerRadius = 20.0;
    // final double ovalWidth = 150.0;  // Width of the oval cutout
    // final double ovalDepth = 25.0;   // Shallow depth for subtle curve

    final double ovalWidth = size.width * .360; // 30% of total width
    final double ovalDepth = size.height * 0.27; // 40% of bar height

    // Create main rectangle with rounded corners
    path.moveTo(0, size.height);
    path.lineTo(0, cornerRadius);
    path.quadraticBezierTo(0, 0, cornerRadius, 0);

    // Left side approaching the oval cutout
    path.lineTo(centerX - ovalWidth / 2, 0);

    // Create smooth oval cutout using a perfect elliptical curve
    // Left curve into oval
    path.quadraticBezierTo(
      centerX - ovalWidth / 2,
      -ovalDepth * 0.7,
      centerX - ovalWidth / 4,
      -ovalDepth,
    );

    // Center curve of oval (deepest part)
    path.quadraticBezierTo(
      centerX,
      -ovalDepth * 1.4,
      centerX + ovalWidth / 4,
      -ovalDepth,
    );

    // Right curve out of oval
    path.quadraticBezierTo(
      centerX + ovalWidth / 2,
      -ovalDepth * 0.6,
      centerX + ovalWidth / 2,
      0,
    );

    // Right side after oval
    path.lineTo(size.width - cornerRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, cornerRadius);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // Draw shadow for subtle depth
    canvas.drawShadow(path, Colors.black.withValues(alpha: 0.06), 4.0, false);
    canvas.drawPath(path, paint);

    // Very subtle border
    final borderPaint = Paint()
      ..color = const Color(0xff05050566).withValues(alpha: 0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
