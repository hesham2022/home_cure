import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/gen/assets.gen.dart';

class PickWidget extends StatelessWidget {
  const PickWidget({
    super.key,
    this.height,
    this.width,
    this.fromRight = false,
    this.file,
  });
  final bool fromRight;
  final double? height;
  final double? width;
  final String? file;
  @override
  Widget build(BuildContext context) => Column(
        children: [
          if (file != null)
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(
                    File(file!),
                  ),
                ),
              ),
              height: height ?? 65.h,
              width: 100.w,
            )
          else
            Container(
              margin: fromRight
                  ? const EdgeInsets.only(right: 40, left: 40)
                  : const EdgeInsets.only(left: 40),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 8),
                    blurRadius: 6,
                    color: Colors.black.withOpacity(.1),
                  )
                ],
                borderRadius: BorderRadiusDirectional.circular(
                  8,
                ),
              ),
              height: height ?? 65.h,
              width: width ?? 87.w,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Assets.svg.image.svg(),
                  ),
                  Positioned(
                    bottom: -5.sp,
                    right: -15.sp,
                    child: Container(
                      height: 40.h,
                      width: 40.h,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.2),
                            blurRadius: 6,
                            offset: const Offset(
                              -3,
                              1,
                            ), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: const [
                          Expanded(
                            child: Icon(
                              Icons.edit,
                              color: Color(0xff1AA9A0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
        ],
      );
}
