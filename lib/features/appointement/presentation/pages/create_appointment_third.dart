import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointement.dart';
import 'package:home_cure/features/home/presentation/pages/home_data.dart';
import 'package:home_cure/gen/assets.gen.dart';

enum EveningMorning { evening, morning }

class CreateAppointementThirdPage extends StatefulWidget {
  const CreateAppointementThirdPage({super.key, required this.service});
  final Service service;
  @override
  State<CreateAppointementThirdPage> createState() =>
      _CreateAppointementThirdPageState();
}

class _CreateAppointementThirdPageState
    extends State<CreateAppointementThirdPage> {
  EveningMorning? period;
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
                SizedBox(
                  height: 35.h,
                ),
                CommonContainer(
                  height: 77.h,
                  br: 23,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Assets.svg.sun.svg(),
                        const Spacer(),
                        Text(
                          'Morning',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 20.sp,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 40.h,
                ),

                ///
              ],
            ),
          ),
          Center(
            child: Text(
              'Select Time',
              style: TextStyle(
                fontSize: 20.sp,
                color: primaryColor,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                vertical: 20.h,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (ctx, index) => Container(
                margin: EdgeInsets.only(bottom: 25.h),
                height: 77.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(23),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 3),
                      color: Colors.black.withOpacity(.1),
                      spreadRadius: 2,
                      blurRadius: 6,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            'From :',
                            style: textStyleWithSecondBold(),
                          ),
                          Text(
                            ' 10 am',
                            style: textStyleWithPrimaryBold.copyWith(
                              color: const Color(0xff31ADE0),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            'To :',
                            style: textStyleWithSecondBold(),
                          ),
                          Text(
                            ' 10 pm',
                            style: textStyleWithPrimaryBold.copyWith(
                              color: const Color(0xff31ADE0),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
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
                    context.router.push(
                      CreateAppointementFourthRoute(
                        service: widget.service,
                      ),
                    );
                  },
                  title: 'Next',
                )
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
