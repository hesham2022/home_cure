// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/features/user_details/presentation/widgets/user_details_tap.dart';
import 'package:home_cure/gen/assets.gen.dart';

class SmookingAlchol extends StatefulWidget {
  const SmookingAlchol({super.key});

  @override
  State<SmookingAlchol> createState() => _SmookingAlcholState();
}

class _SmookingAlcholState extends State<SmookingAlchol> {
  bool smooking = false;
  bool alcoholics = false;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('Smooking', style: textStyleWithPrimarySemiBold),
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    value: smooking,
                    onChanged: (v) {
                      setState(() {
                        smooking = v!;
                      });
                    },
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text('Alcoholics', style: textStyleWithPrimarySemiBold),
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    value: alcoholics,
                    onChanged: (v) {
                      setState(() {
                        alcoholics = v!;
                      });
                    },
                  ),
                )
              ],
            )
          ],
        ),
      );
}
