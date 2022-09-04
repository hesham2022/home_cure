// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/app.dart';

class RegisterField extends StatefulWidget {
  const RegisterField({
    super.key,
    this.hint,
    this.icon,
    this.isPassword = false,
    this.enabled = true,
    this.controller,
    this.onTap,
    this.readOnly = false,
    this.keyboardType,
  });
  final String? hint;
  final Widget? icon;
  final bool isPassword;
  final bool enabled;
  final bool readOnly;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function()? onTap;

  @override
  State<RegisterField> createState() => _RegisterFieldState();
}

class _RegisterFieldState extends State<RegisterField> {
  @override
  void initState() {
    if (widget.isPassword == true) {
      setState(() {
        showText = true;
      });
    }
    super.initState();
  }

  bool showText = false;
  Widget visibilityIcon() => showText
      ? InkWell(
          onTap: () => setState(() {
            showText = !showText;
          }),
          child: Icon(
            Icons.remove_red_eye_outlined,
            color: primaryColor.withOpacity(.5),
          ),
        )
      : InkWell(
          onTap: () => setState(() {
            showText = !showText;
          }),
          child: Icon(
            Icons.visibility_off_outlined,
            color: primaryColor.withOpacity(.5),
          ),
        );
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff137ca733).withOpacity(.3),
            offset: const Offset(0, 3),
            blurRadius: 6,
          )
        ],
      ),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        onTap: widget.onTap,
        readOnly: widget.readOnly,
        obscureText: showText,
        enabled: widget.enabled,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword ? visibilityIcon() : null,
          contentPadding: const EdgeInsets.only(left: 16, right: 16),
          hintStyle: textStyleWithSecondSemiBold.copyWith(
            fontSize: 16.sp,
          ),
          hintText: widget.hint ?? 'Name',
          // contentPadding: const EdgeInsets.all(5),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff3636364d),
              width: 0,
            ),
            borderRadius: BorderRadius.circular(26),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff3636364d),
              width: 0,
            ),
            borderRadius: BorderRadius.circular(26),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff3636364d),
              width: 0,
            ),
            borderRadius: BorderRadius.circular(26),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff3636364d),
              width: 0,
            ),
            borderRadius: BorderRadius.circular(26),
          ),
        ),
      ),
    );
  }
}
