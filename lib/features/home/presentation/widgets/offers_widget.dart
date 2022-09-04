import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/gen/assets.gen.dart';

class OffersWidget extends StatelessWidget {
  const OffersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200.h,
          viewportFraction: .65,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return InkWell(
                child: CommonContainer(
                  height: 200,
                  width: 200,
                  br: 15,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                Assets.img.girl.path,
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Discount 50%',
                                style: textStyleWithPrimaryBold.copyWith(
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'get discount for 50% to make appointment fro 20 Feb to Jun',
                                style: textStyleWithSecondBold().copyWith(
                                  fontSize: 14.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
      //  ListView.builder(
      //   scrollDirection: Axis.horizontal,
      //   itemBuilder: (context, index) => Container(
      //     margin: const EdgeInsets.only(right: 20),
      //     child:
      // InkWell(
      //       child: CommonContainer(
      //         height: 200,
      //         width: 200,
      //         br: 15,
      //         color: Colors.white,
      //         child: Column(
      //           children: [
      //             Expanded(
      //               child: Container(
      //                 decoration: BoxDecoration(
      //                   image: DecorationImage(
      //                     image: AssetImage(
      //                       Assets.img.girl.path,
      //                     ),
      //                     fit: BoxFit.contain,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(10),
      //               child: Column(
      //                 children: [
      //                   Center(
      //                     child: Text(
      //                       'Discount 50%',
      //                       style: textStyleWithPrimaryBold.copyWith(
      //                         fontSize: 18.sp,
      //                       ),
      //                     ),
      //                   ),
      //                   Center(
      //                     child: Text(
      //                       'get discount for 50% to make appointment fro 20 Feb to Jun',
      //                       style: textStyleWithSecondBold().copyWith(
      //                         fontSize: 14.sp,
      //                       ),
      //                       textAlign: TextAlign.center,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
