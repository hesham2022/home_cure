import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointement.dart';
import 'package:home_cure/features/user_details/presentation/widgets/small_text.dart';

class ChangeDialouge extends StatelessWidget {
  const ChangeDialouge({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      // backgroundColor: Colors.white.withOpacity(.8),
      insetPadding: const EdgeInsets.all(20),
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
        height: 340,
        width: 380,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              height: 48,
              width: 380,
              child: Text(
                'Change Name',
                style: textStyleWithPrimaryBold.copyWith(
                  color: Colors.white,
                ),
              ),
            ),

            /// TextFields
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Name',
                    style: textStyleWithSecondSemiBold,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SmallTextFiel(
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'New Name',
                    style: textStyleWithSecondSemiBold,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SmallTextFiel(
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Button1(
                      onPressed: context.router.pop,
                      title: 'Done',
                      size: const Size(170, 5),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
