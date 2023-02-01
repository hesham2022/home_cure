import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/l10n/l10n.dart';

class SettingTap extends StatelessWidget {
  const SettingTap({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.lastPart = true,
    this.tail,
    this.iconTitle,
  });
  final Widget icon;
  final String title;
  final void Function()? onTap;
  final bool lastPart;
  final Widget? tail;
  final String? iconTitle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CommonContainer(
        br: 20,
        height: 130.h,
        width: 330,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              height: 22,
              width: 330,
              child: Center(
                child: iconTitle != null
                    ? Text(
                        iconTitle!,
                        textAlign: TextAlign.center,
                        style: textStyleWithPrimaryBold.copyWith(
                          color: Colors.white,
                          height: 1,
                          fontSize: 16,
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: icon,
                      ),
                      // const SizedBox(
                      //   width: 0,
                      // ),
                      // if (iconTitle != null)
                      //   Text(
                      //     iconTitle!,
                      //     style:
                      //         textStyleWithPrimaryBold.copyWith(fontSize: 12),
                      //   ),
                      // Container(
                      //   color: primaryColor,
                      //   width: 1,
                      // ),
                    ],
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
                        Text(
                          context.l10n.change,
                          style: const TextStyle(
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  if (tail != null) tail!
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
