// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

class SmallTextFiel extends StatelessWidget {
  const SmallTextFiel({
    super.key,
    this.color,
    this.keyboardType,
    this.controller,
  });
  final Color? color;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) => TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(5),
          fillColor: color ?? const Color(0xff1AA9A0).withOpacity(.1),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff3636364d),
              width: 0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff3636364d),
              width: 0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff3636364d),
              width: 0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff3636364d),
              width: 0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
}
