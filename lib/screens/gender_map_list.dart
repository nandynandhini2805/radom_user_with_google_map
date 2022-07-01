// @dart=2.9
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task1/model/radom_users.dart';
import 'package:http/http.dart' as http;

class GenderMap extends StatefulWidget {

  @override
  _GenderMapState createState() => _GenderMapState();
}

class _GenderMapState extends State<GenderMap> {
  GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  static const LatLng showLocation = const LatLng(27.7089427, 85.3086209);
  final Set<Marker> markers = new Set();

  RadomUsers radomUsers;

  List<Results> list;


  Future getDataFromApi() async {
    final url = Uri.parse('https://randomuser.me/api/?results=10');
    final response = await http.get(url);
    radomUsers = RadomUsers.fromJson(jsonDecode(response.body));
    return radomUsers.results;
  }

  @override
  void initState() {
    // TODO: implement initState

    getDataFromApi().then((value) {
      setState(() {
        list  = value;
        getAllMarkers();
      });
    });
    super.initState();
  }

  getAllMarkers() {
    for (int i = 0; i < list.length; i++) {
      double lat = double.parse(list[i].location.coordinates.latitude);
      double lon = double.parse(list[i].location.coordinates.longitude);
      markers.add(Marker(
        //add first marker
        markerId: MarkerId(list[i].id.value.toString()),
        position: LatLng(lat, lon), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: list[i].name.first+" "+list[i].name.last,
          snippet:list[i].location.street.number.toString()+" "+list[i].location.street.name+" "+list[i].location.city,
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
      ),
      body: GoogleMap(
        //Map widget from google_maps_flutter package
        zoomGesturesEnabled: true, //enable Zoom in, out on map
        initialCameraPosition: CameraPosition(
          target: showLocation,
          zoom: 15.0,
        ),
        markers: markers, //markers to show on map
        mapType: MapType.normal, //map type
        onMapCreated: (controller) {
          //method called when map is created
          setState(() {
            googleMapController = controller;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Position position = await _determinePosition();

          googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 14)));

          markers.clear();

          markers.add(Marker(
              markerId: MarkerId('currentLocation'),
              position: LatLng(position.latitude, position.longitude)));

          setState(() {});
        },
        label: const Text("Current Location"),
        icon: const Icon(Icons.location_history),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}
