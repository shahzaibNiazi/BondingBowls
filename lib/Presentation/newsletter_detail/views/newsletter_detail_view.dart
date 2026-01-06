import 'package:convo_hearts/Presentation/newsletter_detail/controllers/newsletter_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/utils/utils.dart';
import '../../../data/model/newsletter_model.dart';

class NewsletterDetailView extends GetView<NewsletterDetailController> {
  const NewsletterDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsletterDetailController>(
      init: NewsletterDetailController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFFFFEEDA),
          body: SafeArea(
            child: Column(
              children: [
                // Top Header Section
                SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[400]!),
                  ),
                  child: Center(
                    child: Text(
                      '~Slideshow Ads Space',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.sp,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),

                // Navigation Header

                // Main Content
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (controller.item != null &&
                            controller.item!.voucherDetails != null)
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFFEADBC8,
                              ), // light beige background
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black54),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    controller
                                            .item!
                                            .voucherDetails
                                            ?.description ??
                                        '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (controller.isRedeem.value == false) {
                                      await controller.redeemVoucher(
                                        controller.item!.voucherDetails?.id ??
                                            '',
                                        controller
                                                .item!
                                                .voucherDetails
                                                ?.voucherCode ??
                                            '',
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        controller.isRedeem.value == true
                                        ? AppColors.circleColor.withValues(
                                            alpha: 0.5,
                                          )
                                        : Color(0xFF1361E0), // Blue button
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: Text(
                                    "Claim",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Back button positioned on the left
                            IconButton(
                              icon: SvgPicture.asset(
                                "assets/icon/svg/back_arrow.svg",
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                            // Title centered
                            Expanded(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.item?.title ?? '',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),

                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFEEDA),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "assets/images/Rectangle 121.png",
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Food",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Visibility(
                              visible: false,
                              maintainAnimation: true,
                              maintainSize: true,
                              maintainState: true,
                              child: IconButton(
                                icon: SvgPicture.asset(
                                  "assets/icon/svg/back_arrow.svg",
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Location and Rating
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Text(
                                "Average Price: \$${controller.item?.averagePrice?.min}-${controller.item?.averagePrice?.max}",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "${controller.item?.viewCount} views",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            controller.item?.secondaryText1 ?? '',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ).paddingSymmetric(horizontal: 12),

                        const SizedBox(height: 16),

                        // Food Image 1
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              controller.item?.displayImage ?? '',
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator.adaptive(
                                        value:
                                            loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.image_not_supported,
                                          size: 48,
                                          color: Colors.grey[500],
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'No Image Available',
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Description Text
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            controller.item?.cafeDetails?.cafeDescription ?? '',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black87,
                              height: 1.5,
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        controller.item?.displayImage ?? '',
                                        fit: BoxFit.cover,
                                        loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;
                                          return Center(
                                            child: CircularProgressIndicator.adaptive(
                                              value:
                                                  loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                            .cumulativeBytesLoaded /
                                                        loadingProgress
                                                            .expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        },
                                        errorBuilder:
                                            (
                                              context,
                                              error,
                                              stackTrace,
                                            ) => Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: Colors.grey.shade400,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.image_not_supported,
                                                    size: 32,
                                                    color: Colors.grey[500],
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    'No Image',
                                                    style: TextStyle(
                                                      color: Colors.grey[600],
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(width: 40),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.item?.title ?? '',
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        const SizedBox(height: 4),

                                        // Rating row
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 16,
                                            ),
                                            const SizedBox(width: 18),
                                            Text(
                                              '${controller.item?.cafeDetails?.cafeReviews?.rating ?? ''}',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '(${controller.item?.cafeDetails?.cafeReviews?.reviewCount} reviews)',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 18),
                                        // Location
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              size: 14,
                                              color: Colors.grey[600],
                                            ),
                                            const SizedBox(width: 18),
                                            Text(
                                              '${controller.item?.location}',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 2),

                                        // Address link
                                        GestureDetector(
                                          onTap: () async {
                                            final url =
                                                controller.item?.locationLink ??
                                                '';
                                            if (url.isNotEmpty) {
                                              final uri = Uri.parse(url);
                                              if (await canLaunchUrl(uri)) {
                                                await launchUrl(
                                                  uri,
                                                  mode: LaunchMode
                                                      .externalApplication,
                                                );
                                              } else {
                                                // Handle error
                                                ScaffoldMessenger.of(
                                                  Get.context!,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Could not launch the map link',
                                                    ),
                                                  ),
                                                );
                                              }
                                            }
                                          },
                                          child: Text(
                                            controller.item?.locationLink ?? '',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.blue,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),

                              // Opening Hours section

                              // Opening hours list
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Opening Hours :',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(width: 40),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Opening Hours :',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            buildOpeningHoursTable(
                                              context,
                                              controller.item?.operatingHours,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 100,
                        ), // Extra space for bottom navigation
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Add the CurvedBottomNavigationBar here
        );
      },
    );
  }
}

Widget buildOpeningHoursTable(
  BuildContext context,
  List<OperatingHour>? operatingHours,
) {
  if (operatingHours == null || operatingHours.isEmpty) {
    return const SizedBox();
  }

  final openingHours = operatingHours.map((e) {
    final isClosed = e.isClosed ?? false;

    final hoursText = isClosed
        ? 'Closed'
        : '${Utils.formatTime(e.opening)} - ${Utils.formatTime(e.closing)}';

    return [e.day ?? '', hoursText, isClosed];
  }).toList();

  final longestTime = openingHours
      .map((e) => e[1] as String)
      .reduce((a, b) => a.length > b.length ? a : b);

  final textPainter = TextPainter(
    text: TextSpan(
      text: longestTime,
      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
    ),
    textDirection: TextDirection.ltr,
  )..layout();

  final timeColumnWidth = textPainter.width + 4;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: openingHours.map((row) {
      final day = row[0] as String;
      final hours = row[1] as String;
      final isClosed = row[2] as bool;

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                day,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff000000),
                ),
              ),
            ),
            SizedBox(
              width: timeColumnWidth,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  hours,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: isClosed
                        ? Colors.redAccent
                        : const Color(0xff000000),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }).toList(),
  );
}
