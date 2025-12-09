import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlideShow extends StatefulWidget {
  @override
  _SlideShowState createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {
  double sliderX = 0; // drag position of handle
  bool redeemed = false; // if redeemed or not

  final double containerHeight = 85.h;
  final double handleSize = 70.w; // width & height of the sliding handle

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxSlide = constraints.maxWidth - handleSize - 12.w * 2;
        // container width minus handle width minus horizontal padding

        return AnimatedContainer(
          height: containerHeight,
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: (!redeemed) ? Color(0xffFB4B16) : Colors.transparent,
            ),
            boxShadow: [
              (!redeemed)
                  ? BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    )
                  : BoxShadow(),
            ],
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              /// TEXT WITH ICON
              Center(
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: redeemed
                      ? Row(
                          key: ValueKey("redeemed"),
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "REDEEMED!",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp,
                              ),
                            ),
                          ],
                        )
                      : Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            key: ValueKey("normal"),
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/images/forward.png",
                                width: 15.w,
                                height: 15.w,
                              ),
                              SizedBox(width: 12.w),
                              Flexible(
                                child: Text(
                                  "ONLY SLIDE WHEN PRESENTING TO CASHIER!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12.w),
                            ],
                          ),
                        ),
                ),
              ),

              /// SLIDING IMAGE HANDLE
              if (!redeemed)
                Positioned(
                  left: sliderX,
                  top: (containerHeight - handleSize) / 2,
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      setState(() {
                        sliderX += details.delta.dx;

                        if (sliderX < 0) sliderX = 0;
                        if (sliderX > maxSlide) sliderX = maxSlide;
                      });
                    },
                    onHorizontalDragEnd: (_) {
                      if (sliderX >= maxSlide) {
                        // Only redeem when fully slid
                        setState(() => redeemed = true);
                      } else {
                        // return handle back smoothly
                        setState(() => sliderX = 0);
                      }
                    },
                    child: Container(
                      width: handleSize,
                      height: handleSize,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffE7E7E7),
                      ),
                      child: Image.asset(
                        "assets/images/bow.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
