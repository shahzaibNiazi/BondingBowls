import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class ImageItemWidget extends StatelessWidget {
  final dynamic img; // can be File or String (URL)
  final VoidCallback onRemove;

  const ImageItemWidget({super.key, required this.img, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Rounded corners for image
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: img is File
              ? Image.file(img, width: 80, height: 80, fit: BoxFit.cover)
              : Image.network(
                  img.toString(),
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Container(
                      width: 80,
                      height: 80,
                      alignment: Alignment.center,
                      child: const CupertinoActivityIndicator(
                        color: AppColors.black,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, color: Colors.grey),
                  ),
                ),
        ),

        // Remove Button
        Positioned(
          top: -6,
          right: -6,
          child: GestureDetector(
            onTap: onRemove,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(4),
              child: const Icon(Icons.close, color: Colors.white, size: 16),
            ),
          ),
        ),
      ],
    );
  }
}
