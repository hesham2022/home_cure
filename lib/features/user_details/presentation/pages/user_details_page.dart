// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/features/user_details/presentation/widgets/height_weight_widget.dart';
import 'package:home_cure/features/user_details/presentation/widgets/profile_header.dart';
import 'package:home_cure/features/user_details/presentation/widgets/smoking_alchol_widget.dart';
import 'package:home_cure/features/user_details/presentation/widgets/user_details_tap.dart';
import 'package:home_cure/gen/assets.gen.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProfileHeader(),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.all(20.0.sp),
            child: Column(
              children: [
                const HeightWeightWidget(),
                SizedBox(
                  height: 10.h,
                ),
                const SmookingAlchol(),
                SizedBox(
                  height: 10.h,
                ),
                UserDetailsTap(
                  onTap: () => context.router.push(
                    SharedListRouter(
                      title: 'Main Complaint',
                      subTitle: 'Complaint',
                    ),
                  ),
                  icon: Assets.img.noteBook.image(
                    height: 100,
                  ),
                  title: 'Main Complaint',
                ),
                SizedBox(
                  height: 40.h,
                ),
                UserDetailsTap(
                  onTap: () => context.router.push(
                    SharedListRouter(
                      title: 'Current medications',
                      subTitle: 'Medications',
                    ),
                  ),
                  icon: Assets.img.cartAgainRemovebgPreview.image(
                    height: 90,
                    width: 90,
                  ),
                  title: 'Current medications',
                ),
                SizedBox(
                  height: 40.h,
                ),
                UserDetailsTap(
                  onTap: () => context.router.push(
                    SharedListRouter(
                      title: 'Chronic Diseases',
                      subTitle: 'Disease',
                    ),
                  ),
                  icon: Assets.img.dna.image(
                    height: 80,
                    width: 70,
                  ),
                  title: 'Chronic Diseases',
                ),
                SizedBox(
                  height: 40.h,
                ),
                UserDetailsTap(
                  onTap: () => context.router.push(
                    SharedListRouter(
                      title: 'Previous Surgeries',
                      subTitle: 'Surgery',
                    ),
                  ),
                  icon: Assets.img
                      .physicianSurgeonSurgeryIconPngFavpngMVCp5prtMkKhW6FvSyJky1nWhRemovebgPreview
                      .image(
                    height: 80,
                    width: 70,
                  ),
                  title: 'Previous Surgeries',
                ),
                SizedBox(
                  height: 40.h,
                ),
                UserDetailsTap(
                  onTap: () => context.router.push(
                    SharedListRouter(
                      title: 'Allergy',
                      subTitle: 'Allergy',
                    ),
                  ),
                  icon: Assets.img.allergyRemovebgPreview.image(
                    height: 80,
                    width: 90,
                  ),
                  title: 'Allergy',
                ),
                SizedBox(
                  height: 40.h,
                ),
                UserDetailsTap(
                  onTap: () =>
                      context.router.push(const AttachmentsPageRouter()),
                  icon: Assets.img.fileRemovebgPreview.image(
                    height: 90,
                    width: 80,
                  ),
                  title: 'Attatchments',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
