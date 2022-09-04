// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/gen/assets.gen.dart';

class LoginField extends StatelessWidget {
  const LoginField({
    super.key,
    this.hint,
    this.icon,
    this.isPassword = false,
  });
  final String? hint;
  final Widget? icon;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff137ca733).withOpacity(.3),
                offset: const Offset(0, 3),
                blurRadius: 6,
              )
            ],
          ),
          child: TextFormField(
            decoration: InputDecoration(
              suffixIcon: isPassword
                  ? Icon(
                      Icons.remove_red_eye_outlined,
                      color: primaryColor.withOpacity(.5),
                    )
                  : null,
              contentPadding: const EdgeInsets.only(left: 75),
              hintStyle: textStyleWithSecondSemiBold.copyWith(
                fontSize: 16.sp,
              ),
              hintText: hint ?? 'E-mail or Phone Number',
              // contentPadding: const EdgeInsets.all(5),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff3636364d),
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(26),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff3636364d),
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(26),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff3636364d),
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(26),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff3636364d),
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(26),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: Transform.scale(
            scale: 1.4,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff137ca733).withOpacity(.3),
                    offset: const Offset(0, 3),
                    blurRadius: 6,
                  )
                ],
              ),
              height: 60.h,
              width: 66.h,
              child: icon ??
                  Assets.svg.userPersonIcon.svg(
                    color: primaryColor.withOpacity(1),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
