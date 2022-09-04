import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BighFormField extends StatelessWidget {
  const BighFormField({
    super.key,
    this.fillColor,
    this.controller,
    this.focusNode,
  });
  final TextEditingController? controller;
  final Color? fillColor;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      minLines: 10,
      maxLines: 20,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(5),
        hintText: 'Descripe What  You Feel',
        hintStyle: TextStyle(
          fontSize: 12.sp,
          color: const Color(0xff1AA9A0),
          fontWeight: FontWeight.w400,
        ),
        fillColor: fillColor ?? const Color(0xff1AA9A0).withOpacity(.1),
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
}
