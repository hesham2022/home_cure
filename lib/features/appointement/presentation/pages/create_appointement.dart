// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/big_form_field.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_header.dart';
import 'package:home_cure/core/widgets/pick_widgt.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointment_params_cubit.dart/appointment_params_cubit.dart';
import 'package:home_cure/features/appointement/presentation/widgets/fees_widget.dart';
import 'package:home_cure/features/appointement/presentation/widgets/number_of_sessions.dart';
import 'package:home_cure/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:home_cure/features/home/domain/entities/service.dart';
import 'package:home_cure/features/home/presentation/blocs/home_bloc/home_bloc.dart';

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
  @override
  void initState() {
    final user = context.read<AuthenticationBloc>().state.user;
    context.read<AppointmentsParamsCubit>().addUser(user.id);
    context.read<AppointmentsParamsCubit>().addService(widget.service.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeServicesLoaded) {
            final mainService = widget.service.ancestors.isNotEmpty
                ? state.services.firstWhere(
                    (element) => element.id == widget.service.ancestors.first,
                  )
                : widget.service;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonHeader(title: mainService.title),

                      if (widget.service.price != null ||
                          widget.customPrice != null)
                        FessContainer(
                          price: widget.customPrice ??
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
                                    margin: const EdgeInsets.only(bottom: 20),
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
                                          style: textStyleWithPrimaryBold,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList()
                          ],
                        ),
                      SizedBox(
                        height: 35.h,
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
                                height: 40.h,
                              ),
                              Text(
                                'Descripe What  You Feel',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: const Color(0xff1AA9A0),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 40.h,
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
                          'Attach images, Medical reports,\n X-rays or Lab tests',
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
                  height: 120.h,
                  child: BlocBuilder<AppointmentsParamsCubit,
                      AppointmentsParamsState>(
                    builder: (context, state) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (contex, index) => InkWell(
                          onTap: () async {
                            final result =
                                await FilePicker.platform.pickFiles();

                            if (result != null) {
                              Future.delayed(Duration.zero, () {
                                context
                                    .read<AppointmentsParamsCubit>()
                                    .addFile(result.files.single.path!, index);
                              });
                              // final file = File(result.files.single.path!);
                            }
                          },
                          child: PickWidget(
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
                  const NumberOfSessionsWidget(),
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
                          context.router.pop();
                        },
                        title: 'Back',
                      ),
                      Button1(
                        onPressed: () {
                          if (controller.text.isEmpty) {
                            ScaffoldMessenger.of(context)
                              ..clearSnackBars()
                              ..showSnackBar(
                                const SnackBar(
                                  content: Text('please enter description'),
                                ),
                              );
                            return;
                          }
                          context
                              .read<AppointmentsParamsCubit>()
                              .addReason(controller.text);
                          if (mainService.title == 'Eldery Care') {
                            context.router.push(
                              CreateAppointementThirdRoute(
                                service: widget.service,
                              ),
                            );
                            return;
                          }
                          context.router.push(
                            CreateAppointementSecondRoute(
                              service: widget.service,
                            ),
                          );
                        },
                        title: 'Next',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100.h,
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
