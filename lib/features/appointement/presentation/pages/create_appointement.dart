// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/big_form_field.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_header.dart';
import 'package:home_cure/core/widgets/pick_widgt.dart';
import 'package:home_cure/features/appointement/presentation/widgets/fees_widget.dart';
import 'package:home_cure/features/appointement/presentation/widgets/number_of_sessions.dart';
import 'package:home_cure/features/home/presentation/pages/home_data.dart';

class CreateAppointementPage extends StatelessWidget {
  const CreateAppointementPage({
    super.key,
    required this.service,
    this.customPrice,
  });
  final Service service;
  final double? customPrice;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonHeader(title: service.mainService),

                if (service.price != null || customPrice != null)
                  FessContainer(
                    price: customPrice ?? service.price!,
                    isPackage: service.isPackage,
                  ),
                SizedBox(
                  height: 35.h,
                ),
                if (service.isPackage != false)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Features',
                        style: textStyleWithSecondBold(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ...service.features!.values
                          .map(
                            (dynamic e) => Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.check,
                                    color: primaryColor,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    e.toString(),
                                    style: textStyleWithPrimaryBold,
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList()
                    ],
                  ),
                SizedBox(
                  height: 35.h,
                ),
                Container(
                  height: 287.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        Text(
                          'Descripe What  You Feel',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: const Color(0xff1AA9A0),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        const Expanded(
                          child: BighFormField(),
                        )
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'Attach images, Medical reports,\n X-rays or Lab tests',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff1AA9A0),
                    ),
                  ),
                ),

                ///
              ],
            ),
          ),
          SizedBox(
            height: 120.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (contex, index) => PickWidget(
                fromRight: index == 9,
              ),
            ),
          ),
          if (service.numberOfSessions) const NumberOfSessionsWidget(),
          if (service.numberOfSessions)
            const SizedBox(
              height: 20,
            ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button1(
                  onPressed: () {
                    context.router.pop();
                  },
                  title: 'Back',
                ),
                Button1(
                  onPressed: () {
                    if (service.mainService == 'Eldery Care') {
                      context.router.push(
                        CreateAppointementThirdRoute(
                          service: service,
                        ),
                      );
                      return;
                    }
                    context.router.push(
                      CreateAppointementSecondRoute(
                        service: service,
                      ),
                    );
                  },
                  title: 'Next',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
        ],
      ),
    );
  }
}
