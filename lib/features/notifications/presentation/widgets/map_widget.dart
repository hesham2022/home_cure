import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_cure/core/utils/map_utils/map_helper.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key, required this.latLong});
  final LatLng latLong;
  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late MapHelper _mapHelper;
  @override
  void initState() {
    _mapHelper = MapHelper()
      ..addMarker(widget.latLong)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      // initialCameraPosition: MapHelper().initialPosition,

      myLocationEnabled: true,

      markers: _mapHelper.markers,
      onMapCreated: _mapHelper.init,
      initialCameraPosition: CameraPosition(
        target: widget.latLong,
        zoom: 10,
      ),
    );
  }
}
