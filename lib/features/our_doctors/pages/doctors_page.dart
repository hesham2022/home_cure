import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/core/widgets/common_header.dart';
import 'package:home_cure/core/widgets/common_scaffold.dart';
import 'package:home_cure/features/Services/presentation/pages/services_page.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  const CommonHeader(title: 'Our Doctors'),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20.w,
                childAspectRatio: 200 / 250,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                return InkWell(
                  onTap: () => context.router.push(
                    const DoctorProfile(),
                  ),
                  child: CommonContainer(
                    height: 200,
                    width: 200,
                    br: 15,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuOH-gYd6No-lHkjkrDZ61YRvOimizsL5GZw&usqp=CAU',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        // Expanded(
                        //   child: Image.network(
                        //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuOH-gYd6No-lHkjkrDZ61YRvOimizsL5GZw&usqp=CAU',
                        //   ),
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            'Dr.Ahmed Ibrahim',
                            style: textStyleWithPrimaryBold.copyWith(
                              fontSize: 18.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Center(
                          child: Text(
                            'Neurologist',
                            style: textStyleWithSecondBold().copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10)
                        // Row(
                        //   children: [
                        //     SizedBox(
                        //       width: 20.w,
                        //     ),
                        //     Center(
                        //       child: Text(
                        //         'Ahmed Ibrahim',
                        //         style: textStyleWithPrimaryBold.copyWith(
                        //           fontSize: 16.sp,
                        //           color: Colors.black,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
