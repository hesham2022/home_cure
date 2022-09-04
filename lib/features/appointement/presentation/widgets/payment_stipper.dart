import 'package:flutter/material.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/gen/assets.gen.dart';

class PaymentStipper extends StatelessWidget {
  const PaymentStipper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Text(
                'Payment method',
                style: textStyleWithPrimarySemiBold.copyWith(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),

            /// Stipper
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Assets.svg.checkSvg.svg(
                      color: primaryColor,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Assets.svg.checkSvg.svg(
                      color: primaryColor,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Assets.svg.checkSvg.svg(
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
