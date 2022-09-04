import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/widgets/common_container.dart';

class UserDetailsTap extends StatelessWidget {
  const UserDetailsTap({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
  });
  final void Function()? onTap;
  final Widget icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CommonContainer(
        color: Colors.white,
        height: 65.h,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                child: icon,
              ),
              Align(
                child: Text(
                  title,
                  style: textStyleWithSecondBold(),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                width: 40,
                bottom: 0,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: seocondColor,
                  ),
                  child: Transform.scale(
                    scale: 1.3,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
