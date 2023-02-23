// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/utils/validation_regx.dart';
import 'package:home_cure/core/widgets/big_form_field.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit_state.dart';
import 'package:home_cure/features/calling/data/models/comapny_settings_model.dart';
import 'package:home_cure/features/calling/data/models/compliantment_model.dart';
import 'package:home_cure/features/calling/presentation/bloc/calling_bloc.dart';
import 'package:home_cure/features/calling/presentation/bloc/comlainment_cubit.dart';
import 'package:home_cure/features/login/presentation/widgets/register_field.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:home_cure/l10n/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

final reasons = <String>[
  'Installment request',
  'High / low pressure',
  'Increased sweating',
  'Dizziness',
  'Cough',
  'Breathing difficulties',
  'Flaky skin'
];
final selectedList = <String>[];

class ContactMethod {
  ContactMethod({required this.icon, this.info, required this.url, this.func});
  final String url;
  final String icon;
  final String? info;
  final Function? func;
}

class CallingPage extends StatefulWidget {
  const CallingPage({super.key});

  @override
  State<CallingPage> createState() => _CallingPageState();
}

class _CallingPageState extends State<CallingPage> {
  List<ContactMethod> contactMethods(ComapnySettingsModel model) => [
        ContactMethod(icon: Assets.svg.mail.path, url: 'mailto:${model.email}'),
        ContactMethod(icon: Assets.svg.web.path, url: model.website),
        ContactMethod(icon: Assets.svg.facebook.path, url: model.facebook),
        ContactMethod(
          icon: Assets.svg.insta.path,
          url: model.insta,
        ),
        ContactMethod(icon: Assets.svg.twitter.path, url: model.twitter),
        ContactMethod(
          icon: Assets.svg.whatsapp.path,
          url: 'https://wa.me/${model.phone}',
        ),
        ContactMethod(
          icon: Assets.svg.phone.path,
          url: 'tel:${model.phone}',
          func: (BuildContext context, List<String> phones) {
            showDialog<void>(
              context: context,
              builder: (context) {
                return Dialog(
                  insetPadding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: 500, // Change as per your requirement
                    width: 500, // Change as per your requirement
                    child: phones.isEmpty
                        ? const Center(
                            child: Text('No Phone Number'),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: phones.length,
                            itemBuilder: (BuildContext context, int index) {
                              final phone = phones[index];
                              return Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      launchUrl(
                                        Uri.parse('tel:$phone'),
                                      );
                                    },
                                    title: Text(
                                      phone,
                                      style: textStyleWithPrimaryBold,
                                    ),
                                    trailing: SvgPicture.asset(
                                      Assets.svg.phone.path,
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 2,
                                  )
                                ],
                              );
                            },
                          ),
                  ),
                );
              },
            );
          },
        ),
      ];
  @override
  void initState() {
    final bloc = context.read<CallingBloc>();
    final state = bloc.state;
    if (state is CallingInitial) {
      bloc.add(GetComapnySettingsEvent());
    }
    super.initState();
  }

  int current = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: BlocBuilder<CallingBloc, CallingState>(
              builder: (context, state) {
                if (state is CallingLoaded) {
                  return Column(
                    children: [
                      Center(
                          child: Assets.img.logo.image(height: 70, width: 70)),

                      // CommonContainer(
                      //   height: 40.h,
                      //   color: Colors.white.withOpacity(.6),
                      // ),

                      SizedBox(height: 25.h),
                      CommonContainer(
                        height: 150.h,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child:
                                    Assets.svg.phone.svg(height: 30, width: 30),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 1,
                                color: seocondColor,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Text(
                                  //   'SUPPORT SERVICE',
                                  //   textAlign: TextAlign.center,
                                  //   style: textStyleWithSecondSemiBold.copyWith(
                                  //     fontSize: 12.sp,
                                  //     fontFamily: 'Oswald',
                                  //     height: 1,
                                  //     color: const Color(0xff1AA9A0),
                                  //   ),
                                  // ),
                                  Text(
                                    ' ${context.l10n.contactUs}',
                                    textAlign: TextAlign.center,
                                    style:
                                        textStyleWithPrimarySemiBold.copyWith(
                                      fontSize: 20.sp,
                                      fontFamily: 'Oswald',
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),

                      SizedBox(
                        height: 350,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20.w,
                            childAspectRatio: 141 / 124,
                          ),
                          itemCount:
                              contactMethods(state.comapnySettingsModel).length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => setState(() {
                                current = index;
                                print(
                                  contactMethods(
                                    state.comapnySettingsModel,
                                  )[index]
                                      .url,
                                );
                                if (contactMethods(
                                      state.comapnySettingsModel,
                                    )[index]
                                        .func !=
                                    null) {
                                  contactMethods(
                                    state.comapnySettingsModel,
                                  )[index]
                                      .func!(
                                    context,
                                    state.comapnySettingsModel.phones,
                                  );
                                } else {
                                  launchUrl(
                                    Uri.parse(
                                      contactMethods(
                                        state.comapnySettingsModel,
                                      )[index]
                                          .url,
                                    ),
                                  );
                                }
                              }),
                              child: CommonContainer(
                                color: current == index
                                    ? primaryColor
                                    : Colors.white,
                                br: 23,
                                height: 92.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: SvgPicture.asset(
                                        contactMethods(
                                          state.comapnySettingsModel,
                                        )[index]
                                            .icon,
                                        color: current == index
                                            ? Colors.white
                                            : null,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        context.l10n.addCompliant,
                        style: textStyleWithPrimaryBold,
                      ), //
                      const SizedBox(
                        height: 10,
                      ),
                      const AddCompliant(),
                      SizedBox(
                        height: 40.h,
                      ),
                    ],
                  );
                }
                if (state is CallingFailed) {
                  return Center(
                    child: Text(state.error.errorMessege),
                  );
                }
                if (state is CallingLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return const Center();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AddCompliant extends StatefulWidget {
  const AddCompliant({
    super.key,
  });

  @override
  State<AddCompliant> createState() => _AddCompliantState();
}

class _AddCompliantState extends State<AddCompliant> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final complaintmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ComplaintCubit, ComplaintState>(
      listener: (context, state) {
        print(state);
        if (state is ComplaintSuccess) {
          EasyLoading.dismiss();

          nameController.clear();
          emailController.clear();
          phoneController.clear();
          complaintmentController.clear();
          showDialog<void>(
            context: context,
            builder: (_) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              child: SizedBox(
                height: ScreenUtil().setHeight(440),
                width: ScreenUtil().setWidth(440),
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 330.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    context.l10n.complaintSend,
                                    textAlign: TextAlign.center,
                                    style: textStyleWithPrimaryBold.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    state.complaintment.number ?? '',
                                    style: textStyleWithPrimaryBold.copyWith(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 150.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: primaryColor,
                                      ),
                                    ),
                                    child: Container(
                                      height: 150.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: primaryColor,
                                        ),
                                      ),
                                      child: Assets.svg.checkMark.svg(
                                        height: 50.h,
                                        width: 50.h,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    context.l10n.thankyou,
                                    style:
                                        textStyleWithPrimarySemiBold.copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          Button1(
                            onPressed: context.router.pop,
                            title: context.l10n.done,
                            size: const Size(142, 30),
                            titelStyle: textStyleWithPrimarySemiBold.copyWith(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
          // EasyLoading.showInfo(
          //   'Your Complaint has been Send And Complaint Number is 62178367} ',
          // );
        }
        if (state is ComplaintFailure) {
          EasyLoading.dismiss();
          EasyLoading.showError(state.error.errorMessege);
        }
        if (state is ComplaintLoading) {
          EasyLoading.show();
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            RegisterField(
              hint: context.l10n.name,
              controller: nameController,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return context.l10n.nameisinvaild;
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            RegisterField(
              hint: context.l10n.email,
              controller: emailController,
              validator: (email) {
                if (email!.isNotEmpty) {
                  if (!ValidationsPatterns.emailValidate.hasMatch(email)) {
                    return context.l10n.invalidEmail;
                  } else {
                    return null;
                  }
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            RegisterField(
              hint: context.l10n.phoneNumber,
              controller: phoneController,
              validator: (phoneNumber) {
                const patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                final phoneRegx = RegExp(patttern);
                if (!phoneRegx.hasMatch(phoneNumber!)) {
                  return context.l10n.inavlidPhonenumber;
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            BighFormField(
              hint: App.isAr(context)
                  ? 'برجاء ادخال الشكوى الخاصه بك'
                  : 'Enter Your Complaint',
              controller: complaintmentController,
              validator: (name) {
                if (name!.isEmpty) {
                  return context.l10n.writeDownYourComplaint;
                }
                return null;
              },
              fillColor: Colors.white,
            ),
            const SizedBox(
              height: 15,
            ),
            Button1(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<ComplaintCubit>().addCompliantment(
                        ComplaintModel(
                          name: nameController.text,
                          email: emailController.text,
                          phoneNumber: phoneController.text,
                          complaintment: complaintmentController.text,
                          userPhoneNumber: (context.read<UserCubit>().state
                                  as UserCubitStateLoaded)
                              .user
                              .phoneNumber,
                        ),
                      );
                }
              },
              title: context.l10n.addCompliant,
            )
          ],
        ),
      ),
    );
  }
}
//  for (var i in reasons)
//             Container(
//               margin: EdgeInsets.only(bottom: 20.h),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: CommonContainer(
//                       height: 38.h,
//                       color: Colors.white,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: Row(
//                           children: [
//                             Text(
//                               i,
//                               textAlign: TextAlign.start,
//                               style: TextStyle(
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.w400,
//                                 color: const Color(0xffD74B7F),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   Transform.scale(
//                     scale: 1.7,
//                     child: Checkbox(
//                       side: const BorderSide(
//                         color: Colors.white,
//                       ),
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(50),
//                         ),
//                       ),
//                       value: selectedList.contains(i),
//                       onChanged: (_) {
//                         if (selectedList.contains(i)) {
//                           setState(() {
//                             selectedList.remove(i);
//                           });
//                         } else {
//                           setState(() {
//                             selectedList.add(i);
//                           });
//                         }
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             ),

//           /// end of list
//           TextFormField(
//             minLines: 5,
//             maxLines: 20,
//             decoration: InputDecoration(
//               contentPadding: const EdgeInsets.all(5),
//               hintText: 'Other symptoms',
//               hintStyle: TextStyle(
//                 fontSize: 16.sp,
//                 color: const Color(0xff1AA9A0),
//                 fontWeight: FontWeight.w400,
//               ),
//               fillColor: Colors.white,
//               filled: true,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(
//                   color: Color(0xff3636364d),
//                   width: 0,
//                 ),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               disabledBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(
//                   color: Color(0xff3636364d),
//                   width: 0,
//                 ),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(
//                   color: Color(0xff3636364d),
//                   width: 0,
//                 ),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               errorBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(
//                   color: Color(0xff3636364d),
//                   width: 0,
//                 ),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//           ),Row(
//   children: [
//     const Spacer(),
//     Button1(
//       size: Size(110.w, 35.h),
//       title: '',
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'Next',
//             style: textStyleWithPrimaryBold.copyWith(
//               color: Colors.white,
//               height: 1,
//             ),
//           ),
//           const Icon(
//             Icons.arrow_forward_ios_outlined,
//             color: Colors.white,
//           )
//         ],
//       ),
//     ),
//   ],
// )

void d() {
  try {} catch (e) {
    print(e);
  }
}
