import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/utils/validation_regx.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/features/authentication/domain/entities/update_user_params.dart';
import 'package:home_cure/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit_state.dart';
import 'package:home_cure/features/setting/presentation/widgets/change_dialouge.dart';
import 'package:home_cure/features/setting/presentation/widgets/setting_tap.dart';
import 'package:home_cure/features/user_details/presentation/widgets/profile_header.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:home_cure/l10n/l10n.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool english = true;
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        english = Localizations.localeOf(context).toString() == 'en';
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProfileHeader(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: BlocListener<UserCubit, UserCubitState>(
              listener: (context, state) {
                if (state is UserCubitStateError) {
                  EasyLoading.showError(state.error.errorMessege);
                }
              },
              child: BlocConsumer<UserCubit, UserCubitState>(
                buildWhen: (previous, current) =>
                    current is UserCubitStateLoaded,
                listener: (context, state) {
                  if (state is UserCubitStateError) {
                    EasyLoading.showError(state.error.errorMessege);
                  }
                },
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

                    return Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SettingTap(
                          iconTitle: context.l10n.name,
                          lastPart: false,
                          // onTap: () {
                          //   showDialog<void>(
                          //     context: context,
                          //     builder: (_) => ChangeDialouge(
                          //       title: 'Name',
                          //       current: user.name,
                          //       validator: (value) {
                          //         if (value!.isEmpty) {
                          //           return 'Name is empty';
                          //         }
                          //         if (value.length < 2) {
                          //           return 'Name is too short';
                          //         }
                          //         return null;
                          //       },
                          //       onDone: (value) {
                          //         context.read<UserCubit>().updateUserFunc(
                          //               UpdateUserParams(name: value),
                          //             );
                          //       },
                          //     ),
                          //   );
                          // },
                          icon:
                              Assets.svg.personAvatar.svg(color: Colors.white),
                          title: user.name,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SettingTap(
                          lastPart: false,
                          onTap: () {
                            context.router.push(const PrivacyPageRouter());
                          },
                          icon: Assets.svg.noteSvg.svg(color: Colors.white),
                          title: context.l10n.privacy,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        CommonContainer(
                          height: 82.h,
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () => setState(() {
                                    english = false;
                                    App.changeLanguage(context, 'ar');
                                  }),
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: english == true
                                          ? Colors.white
                                          : primaryColor,
                                      borderRadius: !english
                                          ? const BorderRadius.only(
                                              bottomRight: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            )
                                          : const BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                            ),
                                    ),
                                    child: Text(
                                      'عربي',
                                      style:
                                          textStyleWithPrimarySemiBold.copyWith(
                                        color: english == true
                                            ? primaryColor
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () => setState(() {
                                    english = true;
                                    App.changeLanguage(context, 'en');
                                  }),
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          english ? primaryColor : Colors.white,
                                      borderRadius: english
                                          ? const BorderRadius.only(
                                              bottomRight: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            )
                                          : const BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                            ),
                                    ),
                                    child: Text(
                                      'English',
                                      style:
                                          textStyleWithPrimarySemiBold.copyWith(
                                        color: english
                                            ? Colors.white
                                            : primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        // if (user.email != null)
                        //   SettingTap(
                        //     icon: const Icon(
                        //       Icons.email,
                        //       color: Colors.white,
                        //     ),
                        //     title: user.email!,
                        //     onTap: () {
                        //       showDialog<void>(
                        //         context: context,
                        //         builder: (_) => ChangeDialouge(
                        //           keyboardType: TextInputType.emailAddress,
                        //           title: 'E-mail',
                        //           current: user.email!,
                        //           validator: (value) {
                        //             if (value!.isEmpty) {
                        //               return 'E-mail is empty';
                        //             }
                        //             if (!ValidationsPatterns.emailValidate
                        //                 .hasMatch(value)) {
                        //               return 'Inavlid E-mail';
                        //             }
                        //             return null;
                        //           },
                        //           onDone: (value) {
                        //             context.read<UserCubit>().updateUserFunc(
                        //                   UpdateUserParams(email: value),
                        //                 );
                        //           },
                        //         ),
                        //       );
                        //     },
                        //   ),
                        // SizedBox(
                        //   height: 30.h,
                        // ),
                        // const Text('+20106606289'),
                        SettingTap(
                          iconTitle: context.l10n.phone,
                          icon: Assets.svg.phone.svg(color: Colors.white),
                          title: App.isAr(context)
                              ? '${user.phoneNumber.replaceAll('+', '')}+'
                              : user.phoneNumber,
                          onTap: () {
                            context.router.push(
                              const ChangePhoneNumberFirebasePageRoute(),
                            );
                            // showDialog<void>(
                            //   context: context,
                            //   builder: (_) => ChangeDialouge(
                            //     keyboardType: TextInputType.phone,
                            //     title: 'Phone Number',
                            //     current: user.phoneNumber,
                            //     validator: (value) {
                            //       const patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                            //       final regExp = RegExp(patttern);
                            //       if (value!.isEmpty) {
                            //         return 'Phone Number is empty';
                            //       }
                            //       if (!regExp.hasMatch(value)) {
                            //         return 'Inavlid Phone Number';
                            //       }
                            //       return null;
                            //     },
                            //     onDone: (value) {
                            //       context.read<UserCubit>().updateUserFunc(
                            //             UpdateUserParams(phoneNumber: value),
                            //           );
                            //     },
                            //   ),
                            // );
                          },
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SettingTap(
                          iconTitle: context.l10n.email,
                          lastPart: false,
                          tail: Row(
                            children: [
                              Container(
                                color: primaryColor,
                                width: 1,
                              ),
                              Container(
                                width: 10,
                              ),
                              Text(
                                ((user.email ?? '').isEmpty)
                                    ? context.l10n.add
                                    : context.l10n.change,
                                style: const TextStyle(
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                          icon: const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          title: user.email ?? context.l10n.notFound,
                          onTap: () {
                            showDialog<void>(
                              context: context,
                              builder: (_) => ChangeDialouge(
                                keyboardType: TextInputType.emailAddress,
                                title: context.l10n.email,
                                current: user.email ?? '',
                                validator: (value) {
                                  const patttern =
                                      r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                  final regExp = RegExp(patttern);
                                  if (value!.isEmpty) {
                                    return context.l10n.eMailisempty;
                                  }
                                  if (!ValidationsPatterns.emailValidate
                                      .hasMatch(value)) {
                                    return context.l10n.invalidEmail;
                                  }
                                  if (value.contains('@homecure.com')) {
                                    return 'email should not contain @homecure.com';
                                  }
                                  return null;
                                },
                                onDone: (value) {
                                  context.read<UserCubit>().updateUserFunc(
                                        UpdateUserParams(email: value),
                                      );
                                },
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SettingTap(
                          onTap: () => context.router
                              .push(const UserDetailsPageRouter()),
                          icon: Column(
                            children: const [
                              Expanded(
                                child: Icon(
                                  Icons.health_and_safety_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          title: context.l10n.medicalDetails,
                          lastPart: false,
                          tail: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Button1(
                          onPressed: () {
                            context
                                .read<AuthenticationBloc>()
                                .add(AuthenticationLogoutRequested());
                            // context.router.pushAndPopUntil(
                            //   const LoginPagePageRouter(),
                            //   predicate: (predicate) => false,
                            // );
                          },
                          color: seocondColor,
                          title: context.l10n.logout,
                          size: const Size(120, 40),
                        ),
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
