import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
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

class ProviderSettingPage extends StatefulWidget {
  const ProviderSettingPage({super.key});

  @override
  State<ProviderSettingPage> createState() => _ProviderSettingPageState();
}

class _ProviderSettingPageState extends State<ProviderSettingPage> {
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
    return RefreshIndicator(
      onRefresh: () async {
        context
            .read<UserCubit>()
            .addNewUser(context.read<AuthenticationBloc>().state.user);
      },
      child: ListView(
        children: [
          Column(
            children: [
              const ProfileHeader(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: BlocBuilder<UserCubit, UserCubitState>(
                  builder: (context, state) {
                    if (state is UserCubitStateLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is UserCubitStateError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(state.error.errorMessege),
                            const SizedBox(
                              height: 30,
                            ),
                            Button1(
                              title: 'Try Again',
                              onPressed: () {
                                context.read<UserCubit>().addNewUser(
                                      context
                                          .read<AuthenticationBloc>()
                                          .state
                                          .user,
                                    );
                              },
                            )
                          ],
                        ),
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
                            lastPart: false,
                            onTap: () {
                              showDialog<void>(
                                context: context,
                                builder: (_) => ChangeDialouge(
                                  title: 'Name',
                                  current: user.name,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Name is empty';
                                    }
                                    if (value.length < 2) {
                                      return 'Name is too short';
                                    }
                                    return null;
                                  },
                                  onDone: (value) {
                                    context.read<UserCubit>().updateUserFunc(
                                          UpdateUserParams(name: value),
                                        );
                                  },
                                ),
                              );
                            },
                            icon: Assets.svg.personAvatar
                                .svg(color: Colors.white),
                            title: user.name,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          SettingTap(
                            lastPart: false,
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
                                                bottomRight:
                                                    Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              )
                                            : const BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                topLeft: Radius.circular(20),
                                              ),
                                      ),
                                      child: Text(
                                        'عربي',
                                        style: textStyleWithPrimarySemiBold
                                            .copyWith(
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
                                        color: english
                                            ? primaryColor
                                            : Colors.white,
                                        borderRadius: english
                                            ? const BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              )
                                            : const BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                topLeft: Radius.circular(20),
                                              ),
                                      ),
                                      child: Text(
                                        'English',
                                        style: textStyleWithPrimarySemiBold
                                            .copyWith(
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
                          SettingTap(
                            icon: Assets.svg.phone.svg(color: Colors.white),
                            title: user.phoneNumber,
                            onTap: () {
                              showDialog<void>(
                                context: context,
                                builder: (_) => ChangeDialouge(
                                  keyboardType: TextInputType.phone,
                                  title: 'Phone Number',
                                  current: user.phoneNumber,
                                  validator: (value) {
                                    const patttern =
                                        r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                    final regExp = RegExp(patttern);
                                    if (value!.isEmpty) {
                                      return 'Phone Number is empty';
                                    }
                                    if (!regExp.hasMatch(value)) {
                                      return 'Inavlid Phone Number';
                                    }
                                    return null;
                                  },
                                  onDone: (value) {
                                    context.read<UserCubit>().updateUserFunc(
                                          UpdateUserParams(phoneNumber: value),
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
                                .push(const ProviderQualificationsRouter()),
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
                            title: 'Qualifications',
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
                            title: 'Log out',
                            size: const Size(120, 40),
                          ),
                        ],
                      );
                    }
                    return const SizedBox();
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
