import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/core/widgets/common_header.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointment_params_cubit.dart/appointment_params_cubit.dart';
import 'package:home_cure/features/home/domain/entities/service.dart';
import 'package:home_cure/features/home/presentation/blocs/home_bloc/home_bloc.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({
    super.key,
    required this.service,
  });
  final ServiceEntity service;
  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    final _delegate = widget.service.children.length > 8
        ? SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 21.w,
            mainAxisExtent: 108.h,
          )
        : SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 30.2,
            crossAxisSpacing: 50.w,
            mainAxisExtent: 140,
          );
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeServicesLoaded) {
          return Padding(
            padding: EdgeInsets.all(30.sp),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: CommonHeader(
                    title: widget.service.title,
                  ),
                ),
                SliverGrid(
                  gridDelegate: _delegate,
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final mainService = state.services.firstWhere(
                        (element) =>
                            element.id ==
                            widget.service.children[index].ancestors.first,
                      );
                      final title = widget.service.children[index].title;
                      final titelWords = title.split(' ');

                      final firstPartOfTitle = titelWords.length < 2
                          ? title
                          : title.split(' ').sublist(0, 2).join(' ');
                      String? secondPartOfTitle;
                      if (widget.service.children[index].title
                              .split(' ')
                              .length >
                          2) {
                        secondPartOfTitle = widget.service.children[index].title
                            .split(' ')
                            .sublist(2)
                            .join(' ');
                      }

                      return InkWell(
                        onTap: () async {
                          // special case is elderly Care
                          // if (widget.service.children[index].mainService ==
                          if (mainService.title == 'Eldery Care') {
                            await context.router
                                .push<void>(
                              CreateAppointementSecondRoute(
                                service: widget.service.children[index],
                              ),
                            )
                                .then((value) {
                              AppointmentsParamsCubit.get(context).clear();
                            });
                            // finish the fucntion
                            return;
                          }

                          if (widget
                              .service.children[index].children.isNotEmpty) {
                            await context.router.push(
                              ServicesRoute(
                                service: widget.service.children[index],
                              ),
                            );
                          } else {
                            if (mainService.title == 'Our Doctors') {
                              await context.router.push<void>(
                                const DoctorsRoute(),
                              );
                            } else {
                              await context.router
                                  .push<void>(
                                CreateAppointementRoute(
                                  service: widget.service.children[index],
                                ),
                              )
                                  .then((value) {
                                AppointmentsParamsCubit.get(context).clear();
                              });
                            }
                          }
                        },
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: widget.service.children[index].photo
                                            .isNotEmpty
                                        ? SvgPicture.asset(
                                            widget
                                                .service.children[index].photo,
                                            color: const Color(0xff1aa9a0),
                                          )
                                        : const Icon(
                                            Icons.hourglass_top_outlined,
                                            size: 40,
                                            color: seocondColor,
                                          ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    height: .5,
                                    color: const Color(0xff1AA9A0),
                                  ),
                                  Text(
                                    firstPartOfTitle,
                                    style: TextStyle(
                                      fontSize:
                                          widget.service.children.length > 2
                                              ? 12.sp
                                              : 17.sp,
                                      color: const Color(0xff1AA9A0),
                                    ),
                                  ),
                                  if (secondPartOfTitle != null)
                                    Text(
                                      secondPartOfTitle,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: const Color(0xff1AA9A0),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            // if (widget.service.children[index].period != null)
                            //   Positioned(
                            //     right: 2.w,
                            //     top: 2.w,
                            //     child: CircleAvatar(
                            //       foregroundColor: Colors.white,
                            //       backgroundColor: primaryColor,
                            //       radius: 11,
                            //       child: Text(
                            //         widget.service.children[index].period.toString(),
                            //         textAlign: TextAlign.center,
                            //         style: TextStyle(
                            //           height: 1,
                            //           fontSize: 12.sp,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // if (widget.service.children[index].features != null &&
                            //     widget.service.children[index].features!['days'] !=
                            //         null)
                            // Positioned(
                            //   left: 2.w,
                            //   top: 2.w,
                            //   child: CircleAvatar(
                            //     foregroundColor: Colors.white,
                            //     backgroundColor: Colors.white,
                            //     radius: 11,
                            //     child: Text(
                            //       '${widget.service.children[index].features!['days']} d',
                            //       textAlign: TextAlign.center,
                            //       style: TextStyle(
                            //         height: 1,
                            //         color: primaryColor,
                            //         fontSize: 12.sp,
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      );
                    },
                    childCount: widget.service.children.length,
                  ),
                ),
                if (widget.service.title == 'Eldery Care')
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          widget.service.children[0].title,
                          style: textStyleWithPrimaryBold,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    ),
                  ),
                if (widget.service.title == 'Eldery Care')
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 21.w,
                      mainAxisExtent: 100.h,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return CommonContainer(
                          br: 10,
                          color: primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.service.children[0].children[index]
                                      .title,
                                  style: textStyleWithPrimaryBold.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '${widget.service.children[0].children[index].price} LE',
                                  style: textStyleWithSecondBold().copyWith(
                                    color: Colors.white.withOpacity(.5),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: widget.service.children[0].children.length,
                    ),
                  ),
                if (widget.service.title == 'Eldery Care')
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          widget.service.children[1].title,
                          style: textStyleWithPrimaryBold,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    ),
                  ),
                if (widget.service.title == 'Eldery Care')
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 21.w,
                      mainAxisExtent: 100.h,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return CommonContainer(
                          br: 10,
                          color: primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.service.children[1].children[index]
                                      .title,
                                  style: textStyleWithPrimaryBold.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '${widget.service.children[1].children[index].price} LE',
                                  style: textStyleWithSecondBold().copyWith(
                                    color: Colors.white.withOpacity(.5),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: widget.service.children[0].children.length,
                    ),
                  ),
                const SliverPadding(
                  padding: EdgeInsets.only(bottom: 80),
                )
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
