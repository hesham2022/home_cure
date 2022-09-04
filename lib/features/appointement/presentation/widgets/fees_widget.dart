import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/gen/assets.gen.dart';

class FessContainer extends StatelessWidget {
  const FessContainer({super.key, required this.price, this.isPackage = false});
  final double price;
  final bool isPackage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${isPackage == true ? 'Package' : 'Service'} Fees',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: const Color(0xff1AA9A0),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Starts from $price EGP',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff1AA9A0),
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            const Spacer(),
            //
            Container(
              color: const Color(0xff1AA9A0),
              width: 1,
              margin: const EdgeInsets.symmetric(horizontal: 4),
            ),
            Assets.svg.fees.svg()
          ],
        ),
      ),
    );
  }
}
