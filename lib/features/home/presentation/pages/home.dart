import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/core/flags/global_flags.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/utils/to_tree.dart';
import 'package:home_cure/di/get_it.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointment_params_cubit.dart/appointment_params_cubit.dart';
import 'package:home_cure/features/appointement/presentation/blocs/get_appointments_cubit/my_appointments_cubit..dart';
import 'package:home_cure/features/home/presentation/blocs/ads_cubit/ads_cubit.dart';
import 'package:home_cure/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:home_cure/features/home/presentation/widgets/horizontal_item.dart';
import 'package:home_cure/features/home/presentation/widgets/offers_widget.dart';
import 'package:home_cure/features/provider/presentation/blocs/notifications_cubit/notifications_cubit.dart';
import 'package:home_cure/gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

StackRouter getRouter() => getIt();

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<MyAppointmentsCubit>().getMyAppointsFunc();
    AppointmentsParamsCubit.get(context).clear();
    context.read<AdsCubit>().getAdsFunc();
    context.read<NotificationsCubit>().getUserNotifications();
    context.router;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Center(child: Assets.img.logo.image(height: 70, width: 70)),

                const SizedBox(
                  height: 25,
                ),
                // const CommingSoon(),
                const OffersWidget(),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeServicesLoaded) {
                      final _services = toTreeHierarchy(state.services);
                      // _services.add(getOurDoctors());
                      final filttered = _services
                          .where((element) => element.active == true)
                          .toList();
                      return SizedBox(
                        height: 450.h,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 30.w,
                            childAspectRatio: 120 / 124,
                          ),
                          itemCount: filttered.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => filttered[index].children.isNotEmpty
                                  ? context.router.push(
                                      ServicesRoute(service: _services[index]),
                                    )
                                  : context.router.push(
                                      CreateAppointementRoute(
                                        service: filttered[index],
                                      ),
                                    ),
                              child: HorizontalListItem(
                                service: filttered[index],
                              ),
                            );
                          },
                        ),
                      );
                    }
                    if (state is HomeServicesError) {
                      return Center(
                        child: Text(state.error.errorMessege),
                      );
                    }
                    if (state is HomeServicesLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key, this.buttonColor});
  final Color? buttonColor;
  @override
  Widget build(BuildContext context) {
    return (!Platform.isIOS)
        ? Container()
        : InkWell(
            // padding: const EdgeInsets.all(0).copyWith(top: 10),
            onTap: () {
              shouldPop = true;
              context.router.pop();
              shouldPop = false;
            },
            child: Icon(
              Icons.arrow_back_ios_sharp,
              size: 20,
              color: buttonColor ?? Colors.black,
            ),
          );
  }
}

void backFunc(BuildContext context) {
  shouldPop = true;
  context.router.pop();
  shouldPop = false;
}
