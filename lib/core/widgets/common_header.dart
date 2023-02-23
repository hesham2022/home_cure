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
            // height: 40.h,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xff218FE4),
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  height: 1,
                ),
                textAlign: TextAlign.center,
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
