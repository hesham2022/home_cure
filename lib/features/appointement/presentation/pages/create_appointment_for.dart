// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/utils/map_utils/location_service.dart';
import 'package:home_cure/core/utils/map_utils/map_helper.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_header.dart';
import 'package:home_cure/features/appointement/domain/entities/create_appointment_params.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointment_params_cubit.dart/appointment_params_cubit.dart';
import 'package:home_cure/features/home/domain/entities/service.dart';
import 'package:home_cure/gen/assets.gen.dart';

class CreateAppointementFourthPage extends StatefulWidget {
  const CreateAppointementFourthPage({super.key, required this.service});
  final ServiceEntity service;
  @override
  State<CreateAppointementFourthPage> createState() =>
      _CreateAppointementFourthPageState();
}

class _CreateAppointementFourthPageState
    extends State<CreateAppointementFourthPage> {
  final mapHelper = MapHelper();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 30.h,
                // ),
                const CommonHeader(
                  title: 'Home Doctor',
                ),

                Center(
                  child: Text(
                    'Add You Address',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: primaryColor,
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  controller: controller,
                  minLines: 3,
                  maxLines: 20,
                  decoration: InputDecoration(
                    // contentPadding: const EdgeInsets.all(5),
                    // hintText: 'Descripe What  You Feel',
                    hintStyle: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff1AA9A0),
                      fontWeight: FontWeight.w400,
                    ),
                    fillColor: const Color(0x00ffffff).withOpacity(1),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff3636364d),
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff3636364d),
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff3636364d),
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff3636364d),
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),

                Container(
                  height: 330.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        Assets.img.map.path,
                      ),
                    ),
                  ),
                  child: MapWidget(
                    mapHelper: mapHelper,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Button1(
                  onPressed: mapHelper.getMyLocation,
                  titelStyle: textStyleWithPrimaryBold.copyWith(
                    color: Colors.white,
                    height: 1,
                    fontSize: 18.sp,
                  ),
                  size: Size(MediaQuery.of(context).size.width, 45.h),
                  title: 'Get Your Current Location',
                ),

                ///
              ],
            ),
          ),
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
                            content: Text('please enter an adress'),
                          ),
                        );
                    } else {
                      context.read<AppointmentsParamsCubit>().addLocation(
                            Location(
                              address: controller.text,
                              coordinates: [
                                mapHelper.markers.first.position.latitude,
                                mapHelper.markers.first.position.longitude,
                              ],
                            ),
                          );

                      context.router.push(
                        CreateAppointmentPayment(
                          service: widget.service,
                        ),
                      );
                    }
                  },
                  title: 'Next',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MapWidget extends StatefulWidget {
  const MapWidget({super.key, required this.mapHelper});
  final MapHelper mapHelper;
  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late MapHelper _mapHelper;
  @override
  void initState() {
    _mapHelper = widget.mapHelper;
    _mapHelper.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(LocationService.position);
    print(widget.mapHelper.initialPosition);

    return Column(
      children: [
        Expanded(
          child: GoogleMap(
            // initialCameraPosition: MapHelper().initialPosition,
            onCameraMove: (position) {
              _mapHelper.addMarker(position.target);
            },
            myLocationEnabled: true,
            onTap: (point) async {
              setState(() {
                _mapHelper.addMarker(point);
              });
            },
            markers: _mapHelper.markers,
            onMapCreated: _mapHelper.init,
            initialCameraPosition: _mapHelper.initialPosition(),
          ),
        ),
      ],
    );
  }
}
