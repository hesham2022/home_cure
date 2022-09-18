import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonHeader extends StatelessWidget {
  const CommonHeader({
    super.key,
    required this.title,
    this.top,
    this.bottom,
  });
  final String title;
  final double? top;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: top ?? 50.h,
          ),
          Container(
            width: 250.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xff218FE4),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  height: 1,
                ),
              ),
            ),
          ),
          SizedBox(
            height: bottom ?? 50.h,
          )
        ],
      ),
    );
  }
}
