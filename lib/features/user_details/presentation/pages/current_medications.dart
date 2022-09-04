import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/widgets/big_form_field.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/core/widgets/common_header.dart';
import 'package:home_cure/core/widgets/pick_widgt.dart';
import 'package:home_cure/features/Services/presentation/pages/services_page.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointement.dart';
import 'package:intl/intl.dart';

class MedicalHestiory {
  MedicalHestiory({
    required this.date,
    required this.description,
  });
  final DateTime date;
  final String description;
}

class CurrentMedicationsPage extends StatefulWidget {
  const CurrentMedicationsPage({super.key});

  @override
  State<CurrentMedicationsPage> createState() => _CurrentMedicationsPageState();
}

class _CurrentMedicationsPageState extends State<CurrentMedicationsPage> {
  bool english = true;
  final List<MedicalHestiory> mdh = [
    MedicalHestiory(date: DateTime.now(), description: 'just ill and not good')
  ];
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            const CommonHeader(title: 'Current Medications'),
            SizedBox(
              height: 30.h,
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
                    Expanded(
                      child: BighFormField(
                        controller: controller,
                      ),
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
            const PickWidget(
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Button1(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      setState(() {
                        mdh.add(
                          MedicalHestiory(
                            description: controller.text,
                            date: DateTime.now(),
                          ),
                        );
                      });
                      controller.clear();
                    }
                  },
                  title: 'Done',
                ),
                const SizedBox(
                  width: 30,
                ),
                Button1(
                  onPressed: () {},
                  title: 'Cancel',
                ),
              ],
            ),
            const SizedBox(height: 40),
            Stack(
              clipBehavior: Clip.none,
              children: [
                CommonContainer(
                  constraints: const BoxConstraints(minHeight: 100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      offset: const Offset(0, 3),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ],
                  color: Colors.white,
                  width: double.infinity,
                  br: 10,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      ...mdh
                          .map(
                            (e) => Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        e.description,
                                        style:
                                            textStyleWithPrimaryBold.copyWith(
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        DateFormat.yMMMEd().format(e.date),
                                        style:
                                            textStyleWithPrimaryBold.copyWith(
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList()
                    ],
                  ),
                ),
                Positioned(
                  top: -25,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CommonContainer(
                      color: primaryColor,
                      height: 50,
                      br: 15,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Medication',
                                  style: textStyleWithPrimaryBold.copyWith(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Date',
                                  style: textStyleWithPrimaryBold.copyWith(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
