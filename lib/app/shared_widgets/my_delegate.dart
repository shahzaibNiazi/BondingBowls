import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class MyDelegate extends SliverPersistentHeaderDelegate {
  final TabBar? tabBar; // Declare tabBar as nullable

  MyDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    if (tabBar == null) {
      return const SizedBox.shrink();
    }
    return Container(color: AppColors.white, child: tabBar!);
  }

  @override
  double get maxExtent => tabBar!.preferredSize.height;

  @override
  double get minExtent => maxExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
