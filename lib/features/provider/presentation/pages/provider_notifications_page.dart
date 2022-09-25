import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/core/utils/fcm_utils.dart';
import 'package:home_cure/core/widgets/common_header.dart';
import 'package:home_cure/features/notifications/presentation/pages/notifications_page.dart';
import 'package:home_cure/features/provider/presentation/blocs/notifications_cubit/notifications_cubit.dart';

class ProviderNotificationsPage extends StatelessWidget {
  const ProviderNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.read<NotificationsBudgeCubit>().state > 0) {
      context.read<NotificationsBudgeCubit>().read();
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(35.w),
        child: Column(
          children: [
            // SizedBox(
            //   height: 50.h,
            // ),
            const CommonHeader(
              title: 'Notifications',
              bottom: 10,
            ),
            SizedBox(
              height: 10.h,
            ),
            BlocBuilder<NotificationsCubit, NotificationsCubitState>(
              builder: (context, state) {
                if (state is NotificationsCubitStateLoaded) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.appointments.length,
                    itemBuilder: (c, i) => Container(
                      margin: EdgeInsets.only(bottom: 30.h),
                      child: RequestInfoWidget(
                        request: state.appointments.reversed.toList()[i],
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}
