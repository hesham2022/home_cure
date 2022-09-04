import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/widgets/common_container.dart';

class SettingTap extends StatelessWidget {
  const SettingTap({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.lastPart = true,
    this.tail,
  });
  final Widget icon;
  final String title;
  final void Function()? onTap;
  final bool lastPart;
  final Widget? tail;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CommonContainer(
        height: 82,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                child: icon,
              ),
              Expanded(
                child: Text(
                  title,
                  style: textStyleWithPrimaryBold.copyWith(
                    fontSize: lastPart == true
                        ? (title.length > 16 ? 16.sp : 20.sp)
                        : 20.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              if (lastPart)
                Row(
                  children: [
                    Container(
                      color: primaryColor,
                      width: 1,
                    ),
                    Container(
                      width: 10,
                    ),
                    const Text(
                      'Change',
                      style: TextStyle(
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              if (tail != null) tail!
            ],
          ),
        ),
      ),
    );
  }
}
