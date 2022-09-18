// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/features/user_details/presentation/widgets/small_text.dart';

class HeightWeightWidget extends StatefulWidget {
  const HeightWeightWidget({
    super.key,
    required this.height,
    required this.weight,
    required this.bloodType,
    required this.heightController,
    required this.weightController,
    required this.bloodTypeController,
  });
  final int height;
  final int weight;
  final String bloodType;
  final TextEditingController heightController;
  final TextEditingController weightController;
  final TextEditingController bloodTypeController;
  @override
  State<HeightWeightWidget> createState() => _HeightWeightWidgetState();
}

class _HeightWeightWidgetState extends State<HeightWeightWidget> {
  @override
  void initState() {
    widget.heightController.text = widget.height.toString();
    widget.weightController.text = widget.weight.toString();
    widget.bloodTypeController.text = widget.bloodType;
    // heightController.addListener(() {
    //   if (heightController.text.isEmpty) {
    //     heightController.text = '0';
    //   }
    // });
    // weightController.addListener(() {
    //   if (weightController.text.isEmpty) {
    //     weightController.text = '0';
    //   }
    // });
    // bloodTypeController.addListener(() {
    //   if (bloodTypeController.text.isEmpty) {
    //     bloodTypeController.text = 'A+';
    //   }
    // });
    super.initState();
  }

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
                    child: SmallTextFiel(
                      keyboardType: TextInputType.number,
                      controller: widget.heightController,
                    ),
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
                    child: SmallTextFiel(
                      keyboardType: TextInputType.number,
                      controller: widget.weightController,
                    ),
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
                    child: SmallTextFiel(
                      controller: widget.bloodTypeController,
                    ),
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
