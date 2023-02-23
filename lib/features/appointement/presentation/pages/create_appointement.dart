// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/flags/global_flags.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/big_form_field.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_header.dart';
import 'package:home_cure/core/widgets/pick_widgt.dart';
import 'package:home_cure/features/Services/presentation/pages/services_page.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointment_params_cubit.dart/appointment_params_cubit.dart';
import 'package:home_cure/features/appointement/presentation/widgets/fees_widget.dart';
import 'package:home_cure/features/appointement/presentation/widgets/number_of_sessions.dart';
import 'package:home_cure/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:home_cure/features/home/domain/entities/service.dart';
import 'package:home_cure/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:home_cure/features/home/presentation/pages/home.dart';
import 'package:home_cure/l10n/l10n.dart';
import 'package:image_picker/image_picker.dart';
import 'package:overlay_support/overlay_support.dart';

class CreateAppointementPage extends StatefulWidget {
  const CreateAppointementPage({
    super.key,
    required this.service,
    this.customPrice,
  });
  final ServiceEntity service;
  final double? customPrice;

  @override
  State<CreateAppointementPage> createState() => _CreateAppointementPageState();
}

class _CreateAppointementPageState extends State<CreateAppointementPage> {
  final TextEditingController controller = TextEditingController();
  double? customPrice;
  double? customeDiscount;

  @override
  void initState() {
    if (widget.customPrice != null) customPrice = widget.customPrice;
    final user = context.read<AuthenticationBloc>().state.user;
    context.read<AppointmentsParamsCubit>().addUser(user.id);
    context.read<AppointmentsParamsCubit>().addService(widget.service.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Platform.isIOS) {
          return shouldPop;
        } else {
          return true;
        }
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MyBackButton(),
                Row(
                  children: [
                    CommonHeader(
                      title: widget.service.getTitle(context),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InfoButton(
                      info: App.isAr(context)
                          ? (widget.service.arDescription ??
                              widget.service.description)
                          : widget.service.description,
                    ),
                  ],
                ),
                Container()
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeServicesLoaded) {
                    final mainService = widget.service.ancestors.isNotEmpty
                        ? state.services.firstWhere(
                            (element) =>
                                element.id == widget.service.ancestors.first,
                          )
                        : widget.service;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (widget.service.price != null ||
                                  widget.customPrice != null)
                                FessContainer(
                                  discount: customeDiscount == null
                                      ? widget.service.priceDiscount
                                      : customeDiscount!.toInt(),
                                  price: customPrice ??
                                      widget.service.price.toDouble(),
                                  isPackage: widget.service.isPackage!,
                                ),
                              SizedBox(
                                height: 35.h,
                              ),
                              if (widget.service.isPackage != false)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Features',
                                      style: textStyleWithSecondBold(),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ...widget.service.features!
                                        .map(
                                          (dynamic e) => Container(
                                            margin: const EdgeInsets.only(
                                              bottom: 20,
                                            ),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.check,
                                                  color: primaryColor,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  e.toString(),
                                                  style:
                                                      textStyleWithPrimaryBold,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList()
                                  ],
                                ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context.l10n.areYouAllergic,
                                    style:
                                        textStyleWithPrimarySemiBold.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          BlocBuilder<AppointmentsParamsCubit,
                                              AppointmentsParamsState>(
                                            builder: (context, state) {
                                              return Radio<bool>(
                                                value: true,
                                                groupValue:
                                                    state.allergic ?? false,
                                                onChanged: (bool? v) {
                                                  context
                                                      .read<
                                                          AppointmentsParamsCubit>()
                                                      .addAllergic(v!);
                                                },
                                              );
                                              // Checkbox(
                                              //   value: state.allergic ?? false,
                                              //   onChanged: (v) {
                                              //     context
                                              //         .read<AppointmentsParamsCubit>()
                                              //         .addAllergic(v!);

                                              //     print(
                                              //       context
                                              //           .read<AppointmentsParamsCubit>()
                                              //           .state
                                              //           .allergic,
                                              //     );
                                              //   },
                                              // );
                                            },
                                          ),
                                          Text(
                                            context.l10n.yes,
                                            style: textStyleWithPrimarySemiBold,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          BlocBuilder<AppointmentsParamsCubit,
                                              AppointmentsParamsState>(
                                            builder: (context, state) {
                                              return Radio<bool>(
                                                value: state.allergic == null
                                                    ? true
                                                    : false,
                                                groupValue:
                                                    state.allergic ?? false,
                                                onChanged: (bool? v) {
                                                  if (state.allergic == null) {
                                                    context
                                                        .read<
                                                            AppointmentsParamsCubit>()
                                                        .addAllergic(false);
                                                    return;
                                                  }
                                                  context
                                                      .read<
                                                          AppointmentsParamsCubit>()
                                                      .addAllergic(v!);
                                                },
                                              );
                                              // Checkbox(
                                              //   value: state.allergic ?? false,
                                              //   onChanged: (v) {
                                              //     context
                                              //         .read<AppointmentsParamsCubit>()
                                              //         .addAllergic(v!);

                                              //     print(
                                              //       context
                                              //           .read<AppointmentsParamsCubit>()
                                              //           .state
                                              //           .allergic,
                                              //     );
                                              //   },
                                              // );
                                            },
                                          ),
                                          Text(
                                            context.l10n.no,
                                            style: textStyleWithPrimarySemiBold,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                height: 287.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      Text(
                                        context.l10n.select_what_you_feel,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: const Color(0xff1AA9A0),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      Expanded(
                                        child: BighFormField(
                                          controller: controller,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  context.l10n.attachimages,
                                  //   'Attach images, Medical reports,\n X-rays or Lab tests',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff1AA9A0),
                                  ),
                                ),
                              ),

                              ///
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100.h,
                          child: BlocBuilder<AppointmentsParamsCubit,
                              AppointmentsParamsState>(
                            builder: (context, state) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (contex, index) => InkWell(
                                  onTap: (state.attachments != null &&
                                          state.attachments![index] != null)
                                      ? null
                                      : () async {
                                          await EasyLoading.show();
                                          // final result = await FilePicker.platform
                                          //     .pickFiles();
                                          final _picker = ImagePicker();
                                          // Pick an image
                                          final result =
                                              await _picker.pickImage(
                                            source: ImageSource.gallery,
                                          );
                                          await EasyLoading.dismiss();

                                          if (result != null) {
                                            Future.delayed(Duration.zero, () {
                                              context
                                                  .read<
                                                      AppointmentsParamsCubit>()
                                                  .addFile(
                                                    result.path,
                                                    index,
                                                  );
                                            });
                                            // final file = File(result.files.single.path!);
                                          }
                                        },
                                  child: PickWidget(
                                    onTap: () {
                                      Future.delayed(Duration.zero, () {
                                        context
                                            .read<AppointmentsParamsCubit>()
                                            .deleteFile(
                                              index,
                                            );
                                      });
                                    },
                                    fromRight: index == 9,
                                    file: state.attachments != null
                                        ? state.attachments![index]
                                        : null,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        if (widget.service.numberOfSessions)
                          NumberOfSessionsWidget(
                            onChange: (v) {
                              setState(() {
                                customPrice =
                                    v * widget.service.price.toDouble();
                                customeDiscount =
                                    widget.service.priceDiscount == null
                                        ? 0
                                        : v *
                                            widget.service.priceDiscount!
                                                .toDouble();

                                context
                                    .read<AppointmentsParamsCubit>()
                                    .addPrice(customPrice!.toInt());
                                if (customeDiscount != 0) {
                                  context
                                      .read<AppointmentsParamsCubit>()
                                      .addDiscount(customeDiscount!.toInt());
                                }
                              });
                            },
                          ),
                        if (widget.service.numberOfSessions)
                          const SizedBox(
                            height: 20,
                          ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Button1(
                                onPressed: () {
                                  backFunc(context);
                                },
                                title: context.l10n.back,
                              ),
                              Button1(
                                onPressed: () {
                                  if (controller.text.isEmpty) {
                                    showSimpleNotification(
                                      Text(
                                        context.l10n.select_what_you_feel,
                                      ),
                                      background: Colors.red,
                                    );

                                    return;
                                  }
                                  if (context
                                          .read<AppointmentsParamsCubit>()
                                          .state
                                          .allergic ==
                                      null) {
                                    showSimpleNotification(
                                      Text(
                                        context.l10n
                                            .pleaseSelectIfYouAllergicOrNot,
                                      ),
                                      background: Colors.red,
                                    );

                                    return;
                                  }
                                  context
                                      .read<AppointmentsParamsCubit>()
                                      .addReason(controller.text);

                                  if (widget.service.priceDiscount != null &&
                                      widget.service.priceDiscount != 0 &&
                                      widget.service.numberOfSessions ==
                                          false) {
                                    context
                                        .read<AppointmentsParamsCubit>()
                                        .addDiscount(
                                          widget.service.priceDiscount!.toInt(),
                                        );
                                  }

                                  context.router.push(
                                    CreateAppointementSecondRoute(
                                      service: widget.service,
                                    ),
                                  );
                                },
                                title: context.l10n.next,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
