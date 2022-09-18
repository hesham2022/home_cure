// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/widgets/big_form_field.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointement.dart';
import 'package:home_cure/features/login/presentation/widgets/register_field.dart';
import 'package:home_cure/gen/assets.gen.dart';

final reasons = <String>[
  'Installment request',
  'High / low pressure',
  'Increased sweating',
  'Dizziness',
  'Cough',
  'Breathing difficulties',
  'Flaky skin'
];
final selectedList = <String>[];

class ContactMethod {
  ContactMethod({required this.icon, this.info});

  final String icon;
  final String? info;
}

class CallingPage extends StatefulWidget {
  const CallingPage({super.key});

  @override
  State<CallingPage> createState() => _CallingPageState();
}

class _CallingPageState extends State<CallingPage> {
  final contactMethods = [
    ContactMethod(icon: Assets.svg.mail.path),
    ContactMethod(icon: Assets.svg.web.path),
    ContactMethod(icon: Assets.svg.facebook.path),
    ContactMethod(icon: Assets.svg.insta.path),
    ContactMethod(icon: Assets.svg.twitter.path),
    ContactMethod(icon: Assets.svg.whatsapp.path),
  ];
 

  int current = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            // CommonContainer(
            //   height: 40.h,
            //   color: Colors.white.withOpacity(.6),
            // ),

            SizedBox(height: 50.h),
            CommonContainer(
              height: 170.h,
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: Assets.svg.phone.svg()),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 1,
                      color: seocondColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(
                        //   'SUPPORT SERVICE',
                        //   textAlign: TextAlign.center,
                        //   style: textStyleWithSecondSemiBold.copyWith(
                        //     fontSize: 12.sp,
                        //     fontFamily: 'Oswald',
                        //     height: 1,
                        //     color: const Color(0xff1AA9A0),
                        //   ),
                        // ),
                        Text(
                          ' Contact Us',
                          textAlign: TextAlign.center,
                          style: textStyleWithPrimarySemiBold.copyWith(
                            fontSize: 30.sp,
                            fontFamily: 'Oswald',
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),

            SizedBox(
              height: 250,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20.w,
                  childAspectRatio: 141 / 124,
                ),
                itemCount: contactMethods.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => setState(() {
                      current = index;
                    }),
                    child: CommonContainer(
                      color: current == index ? primaryColor : Colors.white,
                      br: 23,
                      height: 92.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              contactMethods[index].icon,
                              color: current == index ? Colors.white : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // ,
            const AddCompliant(),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}

class AddCompliant extends StatelessWidget {
  const AddCompliant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        RegisterField(
          hint: 'Name',
        ),
        SizedBox(
          height: 15,
        ),
        RegisterField(
          hint: 'E-mail',
        ),
        SizedBox(
          height: 15,
        ),
        RegisterField(
          hint: 'Phone Number',
        ),
        SizedBox(
          height: 15,
        ),
        BighFormField(
          fillColor: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        Button1(title: 'Add Complaint')
      ],
    );
  }
}
  //  for (var i in reasons)
  //             Container(
  //               margin: EdgeInsets.only(bottom: 20.h),
  //               child: Row(
  //                 children: [
  //                   Expanded(
  //                     child: CommonContainer(
  //                       height: 38.h,
  //                       color: Colors.white,
  //                       child: Padding(
  //                         padding: const EdgeInsets.symmetric(horizontal: 16),
  //                         child: Row(
  //                           children: [
  //                             Text(
  //                               i,
  //                               textAlign: TextAlign.start,
  //                               style: TextStyle(
  //                                 fontSize: 16.sp,
  //                                 fontWeight: FontWeight.w400,
  //                                 color: const Color(0xffD74B7F),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     width: 5,
  //                   ),
  //                   Transform.scale(
  //                     scale: 1.7,
  //                     child: Checkbox(
  //                       side: const BorderSide(
  //                         color: Colors.white,
  //                       ),
  //                       shape: const RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.all(
  //                           Radius.circular(50),
  //                         ),
  //                       ),
  //                       value: selectedList.contains(i),
  //                       onChanged: (_) {
  //                         if (selectedList.contains(i)) {
  //                           setState(() {
  //                             selectedList.remove(i);
  //                           });
  //                         } else {
  //                           setState(() {
  //                             selectedList.add(i);
  //                           });
  //                         }
  //                       },
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),

  //           /// end of list
  //           TextFormField(
  //             minLines: 5,
  //             maxLines: 20,
  //             decoration: InputDecoration(
  //               contentPadding: const EdgeInsets.all(5),
  //               hintText: 'Other symptoms',
  //               hintStyle: TextStyle(
  //                 fontSize: 16.sp,
  //                 color: const Color(0xff1AA9A0),
  //                 fontWeight: FontWeight.w400,
  //               ),
  //               fillColor: Colors.white,
  //               filled: true,
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //               enabledBorder: OutlineInputBorder(
  //                 borderSide: const BorderSide(
  //                   color: Color(0xff3636364d),
  //                   width: 0,
  //                 ),
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //               disabledBorder: OutlineInputBorder(
  //                 borderSide: const BorderSide(
  //                   color: Color(0xff3636364d),
  //                   width: 0,
  //                 ),
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //               focusedBorder: OutlineInputBorder(
  //                 borderSide: const BorderSide(
  //                   color: Color(0xff3636364d),
  //                   width: 0,
  //                 ),
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //               errorBorder: OutlineInputBorder(
  //                 borderSide: const BorderSide(
  //                   color: Color(0xff3636364d),
  //                   width: 0,
  //                 ),
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //             ),
  //           ),Row(
            //   children: [
            //     const Spacer(),
            //     Button1(
            //       size: Size(110.w, 35.h),
            //       title: '',
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             'Next',
            //             style: textStyleWithPrimaryBold.copyWith(
            //               color: Colors.white,
            //               height: 1,
            //             ),
            //           ),
            //           const Icon(
            //             Icons.arrow_forward_ios_outlined,
            //             color: Colors.white,
            //           )
            //         ],
            //       ),
            //     ),
            //   ],
            // )
