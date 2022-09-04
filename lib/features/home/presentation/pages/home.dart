// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:home_cure/core/routing/routing.gr.dart';
// import 'package:home_cure/features/home/presentation/pages/home_data.dart';
// import 'package:home_cure/features/home/presentation/widgets/cooming_soon.dart';
// import 'package:home_cure/features/home/presentation/widgets/cutomer_service.dart';
// import 'package:home_cure/features/home/presentation/widgets/horizontal_item.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(40.sp),
//       child: CustomScrollView(
//         slivers: [
//           SliverToBoxAdapter(
//             child: Column(
//               children: const [
//                 SizedBox(
//                   height: 50,
//                 ),
//                 CommingSoon(),
//                 SizedBox(
//                   height: 30,
//                 ),
//               ],
//             ),
//           ),
//           SliverGrid(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               mainAxisSpacing: 20,
//               crossAxisSpacing: 37.w,
//               childAspectRatio: 141 / 124,
//             ),
//             delegate: SliverChildBuilderDelegate(
//               (context, index) {
//                 return InkWell(
//                   onTap: () => services[index].children.isNotEmpty
//                       ? context.router
//                           .push(ServicesRoute(service: services[index]))
//                       : context.router.push(
//                           CreateAppointementRoute(service: services[index]),
//                         ),
//                   child: HorizontalListItem(
//                     service: services[index],
//                   ),
//                 );
//               },
//               childCount: services.length,
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Column(
//               children: const [
//                 SizedBox(
//                   height: 30,
//                 ),
//                 CustomerServiceHeader(),
//                 SizedBox(
//                   height: 30,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/features/home/presentation/pages/home_data.dart';
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
            SizedBox(
              height: 300,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 37.w,
                  childAspectRatio: 141 / 124,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => services[index].children.isNotEmpty
                        ? context.router
                            .push(ServicesRoute(service: services[index]))
                        : context.router.push(
                            CreateAppointementRoute(service: services[index]),
                          ),
                    child: HorizontalListItem(
                      service: services[index],
                    ),
                  );
                },
              ),
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
