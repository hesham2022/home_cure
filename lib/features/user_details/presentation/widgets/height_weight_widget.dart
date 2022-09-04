// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/features/user_details/presentation/widgets/small_text.dart';

class HeightWeightWidget extends StatelessWidget {
  const HeightWeightWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      color: Colors.white,
      height: 144.h,
      br: 25,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Height',
                    style: textStyleWithPrimarySemiBold,
                  ),
                  SizedBox(
                    height: 40.h,
                    width: 90.w,
                    child: const SmallTextFiel(),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Weight',
                    style: textStyleWithPrimarySemiBold,
                  ),
                  SizedBox(
                    height: 40.h,
                    width: 90.w,
                    child: const SmallTextFiel(),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Blood Type',
                    style: textStyleWithPrimarySemiBold,
                  ),
                  SizedBox(
                    height: 40.h,
                    width: 90.w,
                    child: const SmallTextFiel(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
