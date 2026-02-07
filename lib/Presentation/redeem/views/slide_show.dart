import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlideShow extends StatefulWidget {
  final VoidCallback onRedeem;
  final bool redeemed;

  const SlideShow({super.key, required this.onRedeem, required this.redeemed});

  @override
  _SlideShowState createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {
  double sliderX = 0;

  final double containerHeight = 80;
  final double handleSize = 70.0; // Remove .w from here

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxSlide = constraints.maxWidth - handleSize - 12.w * 2;

        return AnimatedContainer(
          height: containerHeight,
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: (!widget.redeemed)
                  ? Color(0xffFB4B16)
                  : Colors.transparent,
            ),
            boxShadow: [
              (!widget.redeemed)
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
                  child: widget.redeemed
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
                      : Padding(
                          key: ValueKey("normal"),
                          padding: EdgeInsets.only(
                            left:
                                handleSize + 20.w, // Space for handle + margin
                            right: 12.w,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                "assets/images/forward.png",
                                width: 15.w,
                                height: 15.w,
                              ),
                              SizedBox(width: 8.w),
                              Flexible(
                                child: Text(
                                  "ONLY SLIDE WHEN PRESENTING TO CASHIER!",
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xff000000).withOpacity(0.5),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ),

              /// SLIDING IMAGE HANDLE
              if (!widget.redeemed)
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
                        widget.onRedeem();
                        if (!widget.redeemed) {
                          setState(() => sliderX = 0);
                        }
                      } else {
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
