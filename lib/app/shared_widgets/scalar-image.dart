import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class ScalarImage extends StatelessWidget {
  final double? scalar;
  final String? image;
  const ScalarImage({super.key, this.scalar, this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: AppColors.white.withOpacity(0.1),
        child: image != null
            ? Image.network(
                image ?? "",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder:
                    (
                      BuildContext context,
                      Widget child,
                      ImageChunkEvent? loadingProgress,
                    ) {
                      if (loadingProgress == null) {
                        return child; // Image has finished loading
                      }
                      return SizedBox.shrink(); // Show loading indicator
                    },
                errorBuilder:
                    (
                      BuildContext context,
                      Object error,
                      StackTrace? stackTrace,
                    ) {
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.broken_image,
                              size: 100,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ); // Show "No Image Available"
                    },
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
