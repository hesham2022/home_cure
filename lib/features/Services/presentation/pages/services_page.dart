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
import 'package:home_cure/gen/assets.gen.dart';

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
    final isAr = App.isAr(context);
    final filterred = widget.service.children
        .where((element) => element.active == true)
        .toList();
    final _delegate = filterred.length > 8
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
    List<Widget> getElderyDays() {
      final list = <Widget>[];
      for (final i in filterred) {
        list
          ..add(
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    isAr && (i.arTitle != null) ? i.arTitle! : i.title,
                    style: textStyleWithPrimaryBold,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          )
          ..add(
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
                            isAr && (i.children[index].arTitle != null)
                                ? i.children[index].arTitle!
                                : i.children[index].title,
                            style: textStyleWithPrimaryBold.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '${i.children[index].price} LE',
                            style: textStyleWithSecondBold().copyWith(
                              color: Colors.white.withOpacity(.5),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                childCount: i.children.length,
              ),
            ),
          );
      }
      return list;
    }

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeServicesLoaded) {
          return Padding(
            padding: EdgeInsets.all(30.sp),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonHeader(
                      title: widget.service.getTitle(context),
                    ),
                    InfoButton(
                      info: App.isAr(context)
                          ? (widget.service.arDescription ??
                              widget.service.description)
                          : widget.service.description,
                    )
                  ],
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      // SliverToBoxAdapter(
                      //   child: CommonHeader(
                      //     title: widget.service.getTitle(context),
                      //   ),
                      // ),
                      SliverGrid(
                        gridDelegate: _delegate,
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final mainService = state.services.firstWhere(
                              (element) =>
                                  element.id ==
                                  filterred[index].ancestors.first,
                            );
                            final title =
                                (isAr && (filterred[index].arTitle != null))
                                    ? filterred[index].arTitle!
                                    : filterred[index].title;
                            final titelWords = title.split(' ');

                            final firstPartOfTitle = titelWords.length < 2
                                ? title
                                : title.split(' ').sublist(0, 2).join(' ');
                            String? secondPartOfTitle;
                            if (titelWords.length > 2) {
                              secondPartOfTitle =
                                  title.split(' ').sublist(2).join(' ');
                            }

                            return InkWell(
                              onTap: () async {
                                // special case is elderly Care
                                // if (widget.service.children[index].mainService ==
                                // if (mainService.title == 'Eldery Care'
                                //     // ||
                                //     //     filterred[index].hasRangOfDays()
                                //     ) {
                                //   await context.router
                                //       .push<void>(
                                //     CreateAppointementSecondRoute(
                                //       service: filterred[index],
                                //     ),
                                //   )
                                //       .then((value) {
                                //     AppointmentsParamsCubit.get(context)
                                //         .clear();
                                //   });
                                //   // finish the fucntion
                                //   return;
                                // }

                                if (filterred[index].children.isNotEmpty) {
                                  await context.router.push(
                                    ServicesRoute(
                                      service: filterred[index],
                                    ),
                                  );
                                } else {
                                  if (mainService.title == 'Our Doctors') {
                                    await context.router.push<void>(
                                      DoctorsRoute(
                                        service: filterred[index],
                                      ),
                                    );
                                  } else {
                                    await context.router
                                        .push<void>(
                                      CreateAppointementRoute(
                                        service: filterred[index],
                                      ),
                                    )
                                        .then((value) {
                                      AppointmentsParamsCubit.get(context)
                                          .clear();
                                    });
                                  }
                                }
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFFFFFF),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: filterred[index]
                                                  .photo
                                                  .isNotEmpty
                                              ? SvgPicture.asset(
                                                  filterred[index].photo,
                                                  color:
                                                      const Color(0xff1aa9a0),
                                                )
                                              : Assets.img.logo.image(),
                                          // const Icon(
                                          //     Icons.hourglass_top_outlined,
                                          //     size: 40,
                                          //     color: seocondColor,
                                          //   ),
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
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: filterred.length > 2
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
                          childCount: filterred.length,
                        ),
                      ),
                      // if (widget.service.title == 'Eldery Care')
                      //   ...getElderyDays(),
                      const SliverPadding(
                        padding: EdgeInsets.only(bottom: 80),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class InfoButton extends StatelessWidget {
  const InfoButton({
    super.key,
    required this.info,
  });
  final String info;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog<void>(
          context: context,
          builder: (context) => Dialog(
            insetPadding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              // height: 500, // Change as per your requirement
              // width: 500, // Change as per your requirement
              child: Text(
                info,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
      icon: const Icon(
        Icons.info,
        color: primaryColor,
      ),
    );
  }
}
