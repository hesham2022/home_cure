// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

class SmallTextFiel extends StatelessWidget {
  const SmallTextFiel({
    super.key,
    this.color,
    this.keyboardType,
    this.enabled,
    this.controller,
    this.validator,
    this.isPhoneNumber = false,
    this.scrollPadding=const EdgeInsets.all(20),
    this.onChanged,
  });
  final EdgeInsets scrollPadding;
  final Color? color;
  final bool? enabled;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPhoneNumber;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) => TextFormField(
        onChanged: onChanged,
        validator: validator,
        enabled: enabled,
        scrollPadding: scrollPadding,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          prefixText: isPhoneNumber == true ? '+2' : null,
          prefixStyle: Theme.of(context).textTheme.titleMedium,
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
