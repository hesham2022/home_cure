
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/gen/assets.gen.dart';


class CeckCircl extends StatelessWidget {
  const CeckCircl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: primaryColor,
        ),
      ),
      child: Container(
        height: 200.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: primaryColor,
          ),
        ),
        child: Assets.svg.checkMark.svg(),
      ),
    );
  }
}
