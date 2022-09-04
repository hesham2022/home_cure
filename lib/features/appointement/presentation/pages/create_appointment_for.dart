// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_header.dart';
import 'package:home_cure/features/Services/presentation/pages/services_page.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointement.dart';
import 'package:home_cure/features/home/presentation/pages/home_data.dart';
import 'package:home_cure/gen/assets.gen.dart';

class CreateAppointementFourthPage extends StatefulWidget {
  const CreateAppointementFourthPage({super.key, required this.service});
  final Service service;
  @override
  State<CreateAppointementFourthPage> createState() =>
      _CreateAppointementFourthPageState();
}

class _CreateAppointementFourthPageState
    extends State<CreateAppointementFourthPage> {
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
                  height: 30.h,
                ),
                const CommonHeader(title: 'Home Doctor'),

                Center(
                  child: Text(
                    'Add You Address',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: primaryColor,
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  minLines: 3,
                  maxLines: 20,
                  decoration: InputDecoration(
                    // contentPadding: const EdgeInsets.all(5),
                    // hintText: 'Descripe What  You Feel',
                    hintStyle: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff1AA9A0),
                      fontWeight: FontWeight.w400,
                    ),
                    fillColor: const Color(0x00ffffff).withOpacity(1),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff3636364d),
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff3636364d),
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff3636364d),
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff3636364d),
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),

                Container(
                  height: 330.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        Assets.img.map.path,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Button1(
                  titelStyle: textStyleWithPrimaryBold.copyWith(
                    color: Colors.white,
                    height: 1,
                    fontSize: 18.sp,
                  ),
                  size: Size(MediaQuery.of(context).size.width, 45.h),
                  title: 'Change Your Location',
                ),

                ///
              ],
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
                      CreateAppointmentPayment(
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
            height: 250.h,
          ),
        ],
      ),
    );
  }
}
