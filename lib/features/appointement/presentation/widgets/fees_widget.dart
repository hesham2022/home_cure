import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:home_cure/l10n/l10n.dart';

class FessContainer extends StatelessWidget {
  const FessContainer({
    super.key,
    required this.price,
    required this.discount,
    this.isPackage = false,
  });
  final double price;
  final bool isPackage;
  final int? discount;

  @override
  Widget build(BuildContext context) {
    final isAr = context.l10n.localeName == 'ar';

    return Container(
      // height: App.isAr(context) ? 135 : 130.h,
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isAr
                      ? ' ${context.l10n.fees} ${isPackage == true ? context.l10n.package : context.l10n.service}'
                      : '${isPackage == true ? context.l10n.package : context.l10n.service} ${context.l10n.fees}',
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
                  '${context.l10n.price} : $price ${context.l10n.egp}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff1AA9A0),
                    fontWeight: FontWeight.w400,
                    decoration: (discount != null && discount! > 0)
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                if (discount != null && discount! > 0)
                  Column(
                    children: [
                      Text(
                        '${context.l10n.discount}: $discount',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xff1AA9A0),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                if (discount != null && discount! > 0)
                  Column(
                    children: [
                      Text(
                        '${context.l10n.totla}: ${price - discount!.toDouble()}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xff1AA9A0),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
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

class FessContainerForDays extends StatelessWidget {
  const FessContainerForDays({
    super.key,
    required this.price,
    required this.days,
    required this.discount,
    this.isPackage = false,
  });
  final double price;
  final int? discount;

  final bool isPackage;
  final int days;
  @override
  Widget build(BuildContext context) {
    //context.read<AppointmentsParamsCubit>()
    final isAr = context.l10n.localeName == 'ar';

    return Container(
      // height: App.isAr(context) ? 160.h : 130.h,
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isAr
                      ? ' ${context.l10n.fees} ${isPackage == true ? context.l10n.package : context.l10n.service}'
                      : '${isPackage == true ? context.l10n.package : context.l10n.service} ${context.l10n.fees}',
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
                  '${context.l10n.price} : ${price * days.toDouble()} ${context.l10n.egp}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff1AA9A0),
                    fontWeight: FontWeight.w400,
                    decoration: (discount != null && discount! > 0)
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                if (days > 0)
                  Column(
                    children: [
                      Text(
                        '${context.l10n.daysNumber}: $days',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xff1AA9A0),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                if (discount != null && discount! > 0)
                  Column(
                    children: [
                      Text(
                        '${context.l10n.discount}: $discount',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xff1AA9A0),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                if (days > 0)
                  Column(
                    children: [
                      Text(
                        '${context.l10n.totla}: ${price * days.toDouble() - (discount ?? 0)}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xff1AA9A0),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
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
