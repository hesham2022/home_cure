// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/gen/assets.gen.dart';

class LoginField extends StatefulWidget {
  const LoginField({
    super.key,
    this.hint,
    this.icon,
    this.isPassword = false,
    this.onChanged,
    this.controller,
    this.errorText,
    this.isPhoneNumber = false,
  });
  final String? hint;
  final Widget? icon;
  final String? errorText;
  final bool isPassword;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool isPhoneNumber;

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  bool obsecure = false;
  @override
  void initState() {
    if (widget.isPassword) {
      setState(() {
        obsecure = true;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isAr = App.isAr(context);
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            DecoratedBox(
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
                obscureText: obsecure,
                controller: widget.controller,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                  prefixStyle: Theme.of(context).textTheme.subtitle1,

                  suffixIcon: widget.isPassword
                      ? InkWell(
                          onTap: () => setState(() {
                            obsecure = !obsecure;
                          }),
                          child: Icon(
                            obsecure ? Icons.visibility : Icons.visibility_off,
                            color: primaryColor.withOpacity(.5),
                          ),
                        )
                      : null,
                  contentPadding: isAr
                      ? const EdgeInsets.only(right: 75)
                      : const EdgeInsets.only(left: 75),
                  hintStyle: textStyleWithSecondSemiBold.copyWith(
                    fontSize: 16.sp,
                  ),
                  hintText: widget.hint ?? 'E-mail or Phone Number',
                  // contentPadding: const EdgeInsets.all(5),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.errorText != null
                          ? Colors.red
                          : const Color(0xff3636364d),
                      width: widget.errorText != null ? .5 : 0,
                    ),
                    borderRadius: BorderRadius.circular(26),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.errorText != null
                          ? Colors.red
                          : const Color(0xff3636364d),
                      width: widget.errorText != null ? .5 : 0,
                    ),
                    borderRadius: BorderRadius.circular(26),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.errorText != null
                          ? Colors.red
                          : const Color(0xff3636364d),
                      width: widget.errorText != null ? .5 : 0,
                    ),
                    borderRadius: BorderRadius.circular(26),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.errorText != null
                          ? Colors.red
                          : const Color(0xff3636364d),
                      width: widget.errorText != null ? .5 : 0,
                    ),
                    borderRadius: BorderRadius.circular(26),
                  ),

                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.errorText != null
                          ? Colors.red
                          : const Color(0xff3636364d),
                      width: widget.errorText != null ? .5 : 0,
                    ),
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
              ),
            ),
            Positioned(
              left: isAr ? null : 0,
              right: !isAr ? null : 0,
              top: 0,
              bottom: 0,
              child: Transform.scale(
                scale: 1.4,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff137ca733).withOpacity(.3),
                        offset: const Offset(0, 3),
                        blurRadius: 6,
                      )
                    ],
                  ),
                  height: 60.h,
                  width: 66.h,
                  child: widget.icon ??
                      Assets.svg.userPersonIcon.svg(
                        color: primaryColor.withOpacity(1),
                      ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        if (widget.errorText != null)
          Row(
            children: [
              SizedBox(
                width: 60.h,
              ),
              Text(widget.errorText!),
            ],
          )
        else
          const SizedBox()
      ],
    );
  }
}
