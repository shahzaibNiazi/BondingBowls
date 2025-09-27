import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class RoundedImage extends StatelessWidget {
  final String image;
  final double? radius;
  const RoundedImage({super.key, required this.image, this.radius});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 18,
      child: ClipOval(
        child: Container(
          decoration: BoxDecoration(color: AppColors.black),
          child: Image.network(
            image ?? '',
            width: 100, // Width matches the CircleAvatar size
            height: 100,
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
                  return Center(
                    child: CupertinoActivityIndicator(
                      color: AppColors.white,
                      radius: 12,
                    ),
                  ); // Show loading indicator
                },
            errorBuilder:
                (BuildContext context, Object error, StackTrace? stackTrace) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.person, size: 20, color: Colors.grey),
                      ],
                    ),
                  ); // Show "No Image Available"
                },
          ),
        ),
      ),
    );
  }
}
