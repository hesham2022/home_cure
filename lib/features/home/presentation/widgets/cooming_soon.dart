import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/gen/assets.gen.dart';

class CommingSoon extends StatelessWidget {
  const CommingSoon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const textFactor = .97;
    return Container(
      height: 160.h,
      width: 340.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xffFFFFFF).withOpacity(.5),
      ),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            height: 170,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      Text(
                        'Cooming...',
                        textScaleFactor: textFactor,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: const Color(0xff1AA9A0),
                        ),
                      ),
                      Text(
                        '  Soon',
                        textScaleFactor: textFactor,
                        style: TextStyle(
                          height: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 50.sp,
                          color: const Color(0xff3F9CE6),
                        ),
                      ),
                    ],
                  ),
                  Assets.img.girl.image(
                    height: 185.h,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
