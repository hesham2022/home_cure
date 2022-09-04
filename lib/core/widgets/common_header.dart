import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonHeader extends StatelessWidget {
  const CommonHeader({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
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
            height: 50.h,
          )
        ],
      ),
    );
  }
}
