import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_scaffold.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointement.dart';
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
  @override
  void initState() {
    super.initState();
    dateOfBirthController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
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
              const RegisterField(),
              const SizedBox(
                height: 20,
              ),
              const RegisterField(
                hint: 'E-mail',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              const RegisterField(
                hint: 'Mobile Number',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 20,
              ),
              RegisterField(
                isPassword: true,
                hint: 'Password',
                icon: Icon(
                  Icons.lock_outlined,
                  color: primaryColor.withOpacity(.5),
                ),
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
              RegisterField(
                isPassword: true,
                hint: 'Re-Password',
                icon: Icon(
                  Icons.lock_outlined,
                  color: primaryColor.withOpacity(.5),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RegisterField(
                hint: 'Date Of Birth',
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
                  } else {}
                },
              ),
              const Gender(),
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
                child: Button1(
                  titelStyle: TextStyle(
                    fontSize: 19.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  size: const Size(200, 50),
                  title: 'Create new account',
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
    );
  }
}

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

enum GenderEnum { male, femal }

class _GenderState extends State<Gender> {
  // bool male = false;
  // bool femal = false;
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
