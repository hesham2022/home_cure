// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit_state.dart';
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
  final heighController = TextEditingController();
  final weightController = TextEditingController();
  final bloodTypeontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<UserCubit, UserCubitState>(
        builder: (context, state) {
          if (state is UserCubitStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserCubitStateError) {
            return Center(
              child: Text(state.error.errorMessege),
            );
          }
          if (state is UserCubitStateLoaded) {
            final user = state.user;
            var details = user.details;
            return Column(
              children: [
                const ProfileHeader(),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          if (heighController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('please add valid height'),
                              ),
                            );
                            return;
                          }
                          if (weightController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('please add valid weight'),
                              ),
                            );
                            return;
                          }
                          if (bloodTypeontroller.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: SizedBox(
                                  height: 20,
                                  child: Row(
                                    children: const [
                                      SizedBox(
                                        width: 80,
                                      ),
                                      Center(
                                        child: Text(
                                          'please add valid blood type',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                            return;
                          }
                          context.read<UserCubit>().updateUserDeatilsFunc(
                                details.copyWith(
                                  height: int.parse(heighController.text),
                                  weight: int.parse(weightController.text),
                                  bloodType: bloodTypeontroller.text,
                                ),
                              );
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.save),
                            Text('Save', style: textStyleWithPrimaryBold),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: Column(
                    children: [
                      HeightWeightWidget(
                        weightController: weightController,
                        heightController: heighController,
                        bloodTypeController: bloodTypeontroller,
                        bloodType: details.bloodType,
                        weight: details.weight,
                        height: details.height,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SmookingAlchol(
                        alcoholics: details.alcohol,
                        smooking: details.smoke,
                        onSmookingChange: (value) {
                          details = details.copyWith(smoke: value);
                        },
                        onAlcholChange: (value) {
                          details = details.copyWith(alcohol: value);
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      UserDetailsTap(
                        onTap: () => context.router.push(
                          const MainComplainmentPageRouter(),
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
                          const CurrentMedicationsPageRouter(),
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
                          const ChronicDiseasesPageouter(),
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
                          const PreviousSurgeriesPageRouter(),
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
                          const AllergyPageRouter(),
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
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
