import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_scaffold.dart';
import 'package:home_cure/di/get_it.dart';
import 'package:home_cure/features/login/presentation/bloc/login_bloc.dart';
import 'package:home_cure/features/login/presentation/bloc/login_event.dart';
import 'package:home_cure/features/login/presentation/bloc/login_state.dart';
import 'package:home_cure/features/login/presentation/widgets/register_field.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool agreed = false;
  late TextEditingController dateOfBirthController;
  late SingUpBloc _bloc;
  @override
  void initState() {
    _bloc = getIt();
    _bloc.add(const LoginGenderhanged('male'));
    super.initState();
    dateOfBirthController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SingUpBloc>(
      create: (context) => _bloc,
      child: CommonScaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: BlocListener<SingUpBloc, LoginState>(
              listener: (context, state) {
                if (state.status.isSubmissionFailure) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(content: Text(state.failureMessege)),
                    );
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(child: Assets.img.logo.image()),
                  const SizedBox(
                    height: 50,
                  ),
                  BlocBuilder<SingUpBloc, LoginState>(
                    builder: (context, state) {
                      return RegisterField(
                        errorText: state.name.invalid
                            ? state.name.errorText(state.name.error)
                            : null,
                        onChanged: (p0) => context
                            .read<SingUpBloc>()
                            .add(LoginNameChanged(p0)),
                      );
                    },
                  ),
                  // const RegisterField(),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<SingUpBloc, LoginState>(
                    builder: (context, state) {
                      return RegisterField(
                        hint: 'E-mail',
                        keyboardType: TextInputType.emailAddress,
                        errorText: state.username.invalid
                            ? state.username.errorText(state.username.error)
                            : null,
                        onChanged: (p0) => context
                            .read<SingUpBloc>()
                            .add(LoginUsernameChanged(p0)),
                      );
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<SingUpBloc, LoginState>(
                    builder: (context, state) {
                      return RegisterField(
                        isPhoneNumber: true,
                        hint: 'Mobile Number',
                        keyboardType: TextInputType.phone,
                        errorText: state.phoneNumber.invalid
                            ? state.phoneNumber
                                .errorText(state.phoneNumber.error)
                            : null,
                        onChanged: (p0) => context
                            .read<SingUpBloc>()
                            .add(LoginPhoneNumberChanged(p0)),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<SingUpBloc, LoginState>(
                    builder: (context, state) {
                      return RegisterField(
                        isPassword: true,
                        hint: 'Password',
                        icon: Icon(
                          Icons.lock_outlined,
                          color: primaryColor.withOpacity(.5),
                        ),
                        errorText: state.password.invalid
                            ? state.password.errorText(state.password.error)
                            : null,
                        onChanged: (p0) => context
                            .read<SingUpBloc>()
                            .add(LoginPasswordChanged(p0)),
                      );
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      'Password should contain letters & numbers',
                      style: TextStyle(
                        color: const Color(0xffD74B7F),
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<SingUpBloc, LoginState>(
                    builder: (context, state) {
                      return RegisterField(
                        isPassword: true,
                        hint: 'Re-Password',
                        icon: Icon(
                          Icons.lock_outlined,
                          color: primaryColor.withOpacity(.5),
                        ),
                        errorText: state.confirmPassword.invalid
                            ? state.confirmPassword
                                .errorText(state.confirmPassword.error)
                            : null,
                        onChanged: (p0) => context
                            .read<SingUpBloc>()
                            .add(LoginConfirmPasswordChanged(p0)),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<SingUpBloc, LoginState>(
                    builder: (context, state) {
                      return RegisterField(
                        hint: 'Date Of Birth',
                        errorText: state.birth.invalid
                            ? state.birth.errorText(state.birth.error)
                            : null,
                        readOnly: true,
                        controller: dateOfBirthController,
                        onTap: () async {
                          final pickedDate = await showDatePicker(
                            context: context, initialDate: DateTime.now(),
                            firstDate: DateTime(
                              1900,
                            ), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime.now(),
                          );

                          if (pickedDate != null) {
                            final formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);

                            setState(() {
                              dateOfBirthController.text =
                                  formattedDate; //set output date to TextField value.
                            });
                            context
                                .read<SingUpBloc>()
                                .add(LoginBirthChanged(pickedDate));
                            // Future.delayed(Duration.zero, () {});
                          } else {}
                        },
                      );
                    },
                  ),

                  Builder(
                    builder: (context) {
                      return GenderWidget(
                        onChange: (value) {
                          context
                              .read<SingUpBloc>()
                              .add(LoginGenderhanged(value));
                        },
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          value: agreed,
                          onChanged: (v) {
                            setState(() {
                              agreed = v!;
                            });
                          },
                        ),
                        Text(
                          'I agree to terms and conditions',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: const Color(0xffD74B7F),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: BlocBuilder<SingUpBloc, LoginState>(
                      buildWhen: (previous, current) =>
                          previous.status != current.status,
                      builder: (context, state) {
                        return state.status == FormzStatus.submissionInProgress
                            ? const Center(child: CircularProgressIndicator())
                            : Button1(
                                onPressed: state.status == FormzStatus.invalid
                                    ? null
                                    : () {
                                        context.read<SingUpBloc>().add(
                                              const LoginRegisterSubmitted(),
                                            );
                                      },
                                titelStyle: TextStyle(
                                  fontSize: 19.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                                size: const Size(200, 50),
                                title: 'Create new account',
                              );
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: InkWell(
                      onTap: context.router.pop,
                      child: Text(
                        'you have an account',
                        style: TextStyle(
                          fontSize: 19.sp,
                          color: primaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GenderWidget extends StatefulWidget {
  const GenderWidget({super.key, required this.onChange});
  final Function(String value) onChange;
  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

enum GenderEnum { male, femal }

class _GenderWidgetState extends State<GenderWidget> {
  GenderEnum gender = GenderEnum.male;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('Male', style: textStyleWithPrimarySemiBold),
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    value: gender == GenderEnum.male,
                    onChanged: (v) {
                      if (v! == true) {
                        setState(() {
                          gender = GenderEnum.male;
                        });
                        widget.onChange('male');
                      }
                    },
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text('Femal', style: textStyleWithPrimarySemiBold),
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    value: gender == GenderEnum.femal,
                    onChanged: (v) {
                      if (v! == true) {
                        setState(() {
                          gender = GenderEnum.femal;
                        });
                        widget.onChange('female');
                      }
                    },
                  ),
                )
              ],
            )
          ],
        ),
      );
}
