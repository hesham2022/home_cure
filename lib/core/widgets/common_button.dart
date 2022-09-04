import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';

class Button1 extends StatelessWidget {
  const Button1({
    super.key,
    required this.title,
    this.size,
    this.onPressed,
    this.titelStyle,
    this.br,
    this.color,
    this.child,
  });
  final String title;
  final Size? size;
  final Widget? child;

  final double? br;

  final VoidCallback? onPressed;
  final TextStyle? titelStyle;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: size != null ? MaterialStateProperty.all<Size?>(size) : null,
        backgroundColor: MaterialStateProperty.all<Color?>(
          color ?? primaryColor,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(br ?? 23),
          ),
        ),
      ),
      onPressed: onPressed,
      child: child ??
          Text(
            title,
            style: titelStyle ??
                TextStyle(
                  fontSize: 16.sp,
                  height: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
          ),
    );
  }
}
