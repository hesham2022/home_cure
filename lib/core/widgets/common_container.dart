import 'package:flutter/material.dart';
import 'package:home_cure/app/view/app.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({
    super.key,
    this.height,
    this.width,
    this.child,
    this.color,
    this.br,
    this.boxShadow,
    this.gradient,
    this.constraints,
  });
  final double? height;
  final double? width;
  final Color? color;

  final double? br;
  final Gradient? gradient;
  final Widget? child;
  final List<BoxShadow>? boxShadow;
  final BoxConstraints? constraints;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      constraints: constraints,
      width: width,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        color: color ?? primaryColor,
        borderRadius: BorderRadius.circular(br ?? 30),
        gradient: gradient,
      ),
      child: child,
    );
  }
}
