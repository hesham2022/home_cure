import 'package:flutter/material.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/widgets/common_container.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.child,
    required this.title,
    this.color,
    this.titleColor,
  });
  final Widget child;
  final Color? color;
  final String title;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      br: 10,
      color: color ?? Colors.blue,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: textStyleWithSecondSemiBold.copyWith(
                height: 1,
                fontSize: 18,
                color: titleColor ?? Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
