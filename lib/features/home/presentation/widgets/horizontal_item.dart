import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/features/home/domain/entities/service.dart';

class HorizontalListItem extends StatelessWidget {
  const HorizontalListItem({
    super.key,
    required this.service,
  });

  final ServiceEntity service;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124.h,
      width: 141.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  stops: const [
                    -1,
                    .6,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    const Color(0xff208EE2).withOpacity(.7),
                    const Color(0xff0A84E1).withOpacity(.1),
                  ],
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: Image.asset(
                service.photo,
                height: 27,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(),
                ),
                Container(
                  width: 160,
                  height: 30,
                  decoration: const BoxDecoration(
                    //  BorderRadius.circular(30),
                    color: Color(0xff218FE4),
                  ),
                  child: Center(
                    child: Text(
                      service.getTitle(context),
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
