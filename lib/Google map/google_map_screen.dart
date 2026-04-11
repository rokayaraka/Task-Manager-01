import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        trafficEnabled: true,
        mapType: MapType.hybrid,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,

        initialCameraPosition: CameraPosition(
          zoom: 16,
          target: LatLng(23.85762119445905, 90.30724167812177),
        ),
        onMapCreated: (GoogleMapController controller) {
        },
        onTap: (LatLng latlag) {
          log(latlag.toString());
        },
        markers: <Marker>{
          Marker(
            markerId: MarkerId('Office'),
            position: LatLng(23.85762119445905, 90.30724167812177),
            onTap: () {},
            visible: true,
            infoWindow: InfoWindow(title: 'Office', onTap: () {}),
          ),

          Marker(
            markerId: MarkerId('Home'),
            position: LatLng(23.812323567599083, 90.11491410219287),
            onTap: () {},
            visible: true,
            infoWindow: InfoWindow(title: 'Home', onTap: () {}),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueBlue,
            ),
          ),

          Marker(
            markerId: MarkerId('Market'),
            position: LatLng(23.812323567599083, 90.11491410219287),
            onTap: () {},
            visible: true,
            infoWindow: InfoWindow(title: 'Market', onTap: () {}),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueCyan,
            ),
          ),
        },

        polylines: {
          Polyline(
            polylineId: PolylineId('Office to Home'),
            points: [
              LatLng(23.85762119445905, 90.30724167812177),
              LatLng(23.812323567599083, 90.11491410219287),
              LatLng(23.812323567599083, 90.11491410219287),
            ],
            visible: true,
            color: Colors.green,
            width: 20,
            endCap: Cap.roundCap,
            startCap: Cap.squareCap,
            jointType: JointType.round,
          ),
          Polyline(
            polylineId: PolylineId('Office to Market'),
            points: [
              LatLng(23.85762119445905, 90.30724167812177),

              LatLng(23.812323567599083, 90.11491410219287),
            ],
            visible: true,
            color: Colors.green,
            width: 20,
            endCap: Cap.roundCap,
            startCap: Cap.squareCap,
            jointType: JointType.round,
          ),
          Polyline(
            polylineId: PolylineId('Home to Market'),
            points: [
              LatLng(23.812323567599083, 90.11491410219287),
              LatLng(23.812323567599083, 90.11491410219287),
            ],
            visible: true,
            color: Colors.green,
            width: 20,
            endCap: Cap.roundCap,
            startCap: Cap.squareCap,
            jointType: JointType.round,
          ),
        },
        circles: {
          Circle(
            circleId: CircleId('Zone 1'),
            center: LatLng(23.812323567599083, 90.11491410219287),
            radius: 20,
            strokeWidth: 2,
            strokeColor: Colors.orange,
            fillColor: Colors.orangeAccent,
          ),
        },
        polygons: {
          Polygon(
            polygonId: PolygonId('Zone'),
            points: [
              LatLng(23.812323567599083, 90.11491410219287),
              LatLng(23.812323567599083, 90.11491410219287),
              LatLng(23.812323567599083, 90.11491410219287),
            ],
            fillColor: Colors.blueAccent,
            strokeColor: Colors.pink,
            onTap: () {},
          ),
        },
      ),
    );
  }
}
