import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/widgets/big_form_field.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/features/appointement/domain/entities/appointment.dart';

class ApppointmentActionDiaouge extends StatefulWidget {
  const ApppointmentActionDiaouge({
    super.key,
    required this.title,
    required this.onDone,
    required this.appointment,
    this.keyboardType,
    this.validator,
  });
  final TextInputType? keyboardType;
  final Appointment appointment;
  final String title;
  final Function(String value) onDone;
  final String? Function(String?)? validator;
  @override
  State<ApppointmentActionDiaouge> createState() =>
      _ApppointmentActionDiaougeState();
}

class _ApppointmentActionDiaougeState extends State<ApppointmentActionDiaouge> {
  final TextEditingController controller = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      // backgroundColor: Colors.white.withOpacity(.8),
      insetPadding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: CommonContainer(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomRight,
          end: FractionalOffset.topLeft,
          colors: [
            const Color(0xffF8E5E8).withOpacity(.8),
            const Color(0xffE6DAF5).withOpacity(.8),
            const Color(0xffE4F0FC).withOpacity(.8),
            const Color(0xffE8EEF2).withOpacity(.8),
          ],
        ),
        height: widget.appointment.isOnPeocessing ? 450 : 150,
        // width: 300,
        child: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// TextFields
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: textStyleWithPrimaryBold.copyWith(),
                    ),
                  ],
                ),
                if (widget.appointment.isOnPeocessing)
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      BighFormField(
                        hint: 'Leave Your Note',
                        controller: controller,
                        validator: widget.validator,
                        // color: Colors.white,
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button1(
                      onPressed: () {
                        context.router.pop();
                      },
                      title: 'Cancle',
                      size: const Size(140, 5),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Button1(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          widget.onDone(controller.text);
                          context.router.pop();
                        }
                      },
                      title: 'Yes',
                      size: const Size(140, 5),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
