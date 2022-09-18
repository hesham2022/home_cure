import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/utils/to_tree.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointment_params_cubit.dart/appointment_params_cubit.dart';
import 'package:home_cure/features/appointement/presentation/blocs/get_appointments_cubit/my_appointments_cubit..dart';
import 'package:home_cure/features/home/presentation/blocs/ads_cubit/ads_cubit.dart';
import 'package:home_cure/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:home_cure/features/home/presentation/widgets/cutomer_service.dart';
import 'package:home_cure/features/home/presentation/widgets/horizontal_item.dart';
import 'package:home_cure/features/home/presentation/widgets/offers_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<MyAppointmentsCubit>().getMyAppointsFunc();
    AppointmentsParamsCubit.get(context).clear();
    context.read<AdsCubit>().getAdsFunc();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(40.sp),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            // const CommingSoon(),
            const OffersWidget(),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeServicesLoaded) {
                  final _services = toTreeHierarchy(state.services);
                  return SizedBox(
                    height: 300,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 37.w,
                        childAspectRatio: 141 / 124,
                      ),
                      itemCount: _services.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => _services[index].children.isNotEmpty
                              ? context.router.push(
                                  ServicesRoute(service: _services[index]),
                                )
                              : context.router.push(
                                  CreateAppointementRoute(
                                    service: _services[index],
                                  ),
                                ),
                          child: HorizontalListItem(
                            service: _services[index],
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
            const SizedBox(
              height: 30,
            ),
            const CustomerServiceHeader(),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
