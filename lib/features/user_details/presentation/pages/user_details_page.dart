// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit_state.dart';
import 'package:home_cure/features/user_details/presentation/widgets/height_weight_widget.dart';
import 'package:home_cure/features/user_details/presentation/widgets/profile_header.dart';
import 'package:home_cure/features/user_details/presentation/widgets/smoking_alchol_widget.dart';
import 'package:home_cure/features/user_details/presentation/widgets/user_details_tap.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:home_cure/l10n/l10n.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

bool showSave = false;

class _UserDetailsPageState extends State<UserDetailsPage> {
  final heighController = TextEditingController();
  final weightController = TextEditingController();
  final bloodTypeontroller = TextEditingController();

  bool dirty = false;
  String _previousHeight = '';
  String _previousHWeight = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    showSave = false;

    // heighController.clear();
    // weightController.clear();
    // heighController.dispose();
    // weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isAr = l10n.localeName == 'ar';

    return SingleChildScrollView(
      child: BlocConsumer<UserCubit, UserCubitState>(
        listener: (context, state) {
          if (state is UserCubitStateLoaded) {
            dirty = false;
          }
        },
        builder: (context, state) {
          return BlocBuilder<UserCubit, UserCubitState>(
            buildWhen: (previous, current) => current is UserCubitStateLoaded,
            builder: (context, state) {
              // if (state is UserCubitStateLoading) {
              //   return const Center(
              //     child: CircularProgressIndicator(),
              //   );
              // }
              // if (state is UserCubitStateError) {
              //   return Center(
              //     child: Text(state.error.errorMessege),
              //   );
              // }
              if (state is UserCubitStateLoaded) {
                final user = state.user;
                var details = user.details;
                _previousHeight = state.user.details.height.toString();
                _previousHWeight = state.user.details.weight.toString();

                return Column(
                  children: [
                    const ProfileHeader(),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Row(
                        mainAxisAlignment: isAr
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0.sp),
                      child: Column(
                        children: [
                          HeightWeightWidget(
                            onChanged: (p0) {
                              setState(() {
                                dirty = true;
                              });
                            },
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
                              setState(() {
                                dirty = true;
                              });
                            },
                            onAlcholChange: (value) {
                              details = details.copyWith(alcohol: value);
                              setState(() {
                                dirty = true;
                              });
                            },
                          ),
                          if (dirty)
                            Button1(
                              size: Size(300.w, 20.h),
                              onPressed: () {
                                if (heighController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(l10n.pleaseaddvalidheight),
                                    ),
                                  );
                                  return;
                                }
                                if (weightController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(l10n.pleaseaddvalidweight),
                                    ),
                                  );
                                  return;
                                }
                                // if (bloodTypeontroller.text.isEmpty) {
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(
                                //       content: SizedBox(
                                //         height: 20,
                                //         child: Row(
                                //           children: [
                                //             const SizedBox(
                                //               width: 80,
                                //             ),
                                //             Center(
                                //               child: Text(
                                //                 l10n.pleaseaddvalidbloodtype,
                                //                 textAlign: TextAlign.center,
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //   );
                                //   return;
                                // }
                                context.read<UserCubit>().updateUserDeatilsFunc(
                                      details.copyWith(
                                        height: int.parse(heighController.text),
                                        weight:
                                            int.parse(weightController.text),
                                        bloodType: bloodTypeontroller.text,
                                      ),
                                    );
                              },
                              title: context.l10n.save,
                            ),
                          SizedBox(
                            height: 50.h,
                          ),
                          UserDetailsTap(
                            onTap: () => context.router.push(
                              const MainComplainmentPageRouter(),
                            ),
                            icon: Assets.img.noteBook.image(
                              height: 100,
                            ),
                            title: context.l10n.mainComplaint,
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
                            title: context.l10n.currentMedications,
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
                            title: context.l10n.chronicDiseases,
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
                            title: context.l10n.previousSurgeries,
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
                            title: context.l10n.allergy,
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          UserDetailsTap(
                            onTap: () => context.router
                                .push(const AttachmentsPageRouter()),
                            icon: Assets.img.fileRemovebgPreview.image(
                              height: 90,
                              width: 80,
                            ),
                            title: context.l10n.attachments,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          );
        },
      ),
    );
  }
}
