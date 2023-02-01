import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/api_config/api_constants.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/core/widgets/common_header.dart';
import 'package:home_cure/core/widgets/common_scaffold.dart';
import 'package:home_cure/features/home/domain/entities/service.dart';
import 'package:home_cure/features/home/presentation/blocs/our_doctors_cubit/our_doctors_cubit.dart';
import 'package:home_cure/l10n/l10n.dart';

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({super.key, required this.service});
  final ServiceEntity service;
  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  @override
  void initState() {
    final cubit = context.read<OurDoctorsCubit>();
    final state = cubit.state;
    if (state is OurDoctorsCubitStateIntial) {
      cubit.getOurDoctorssFunc();
    }
    super.initState();
  }

  final spcializaions = [
    'Cardiology',
    'INTERNAL MEDICINE',
    'OEB/GYN',
    'E.N.T',
    'PEDIATRICS',
    'GERIATRICS',
    'CHEST',
  ];
  final spcializaionsAr = [
    'القلب',
    'الباطنه',
    'التوليد وأمراض النساء',
    'الأنف والأن والحنجرة',
    'الأطفال',
    'امراض الشيخوخه',
    'الرئه',
  ];

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<OurDoctorsCubit, OurDoctorsCubitState>(
          builder: (context, state) {
            if (state is OurDoctorsCubitStateLoaded) {
              final ourDoctors = state.ourDoctors
                  .where(
                    (element) =>
                        element.specialization == widget.service.title &&
                        element.photo != null &&
                        element.photo!.isNotEmpty,
                  )
                  .toList();
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        CommonHeader(title: context.l10n.ourDoctors),
                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    ),
                  ),
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20.w,
                      childAspectRatio: 200 / 250,
                    ),
                    delegate: SliverChildBuilderDelegate(
                        childCount: ourDoctors.length, (context, index) {
                      return InkWell(
                        onTap: () => context.router.push(
                          DoctorProfile(
                            user: ourDoctors[index],
                          ),
                        ),
                        child: CommonContainer(
                          height: 200,
                          width: 200,
                          br: 15,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        '$domain/img/attachments/${ourDoctors[index].photo!}',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              // Expanded(
                              //   child: Image.network(
                              //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuOH-gYd6No-lHkjkrDZ61YRvOimizsL5GZw&usqp=CAU',
                              //   ),
                              // ),
                              const SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Text(
                                  '${App.isAr(context) ? 'د.' : 'Dr'}.${ourDoctors[index].name}',
                                  style: textStyleWithPrimaryBold.copyWith(
                                    fontSize: 18.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),

                              Center(
                                child: Text(
                                  App.isAr(context)
                                      ? (widget.service.arTitle ??
                                          widget.service.title)
                                      : widget.service.title,
                                  style: textStyleWithSecondBold().copyWith(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10)
                              // Row(
                              //   children: [
                              //     SizedBox(
                              //       width: 20.w,
                              //     ),
                              //     Center(
                              //       child: Text(
                              //         'Ahmed Ibrahim',
                              //         style: textStyleWithPrimaryBold.copyWith(
                              //           fontSize: 16.sp,
                              //           color: Colors.black,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                        ),
                      );
                    }),
                  )
                ],
              );
            }
            if (state is OurDoctorsCubitStateError) {
              return Center(
                child: Text(state.error.errorMessege),
              );
            }
            if (state is OurDoctorsCubitStateLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
