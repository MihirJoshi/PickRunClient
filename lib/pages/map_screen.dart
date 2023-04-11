import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:fluttertoast/fluttertoast.dart';
// ignore: unused_import
import 'package:geolocator/geolocator.dart';
import 'package:flutter_geocoder/geocoder.dart';
//import 'package:geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// ignore: unused_import
import 'package:pickrun_new_client_app/pages/map_ui.dart';
import 'package:pickrun_new_client_app/pages/pickup.dart';
import 'package:pickrun_new_client_app/widgets/button_widget.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';
import 'dart:collection';
// ignore: unused_import
import 'dart:convert';
// ignore: unused_import
import 'dart:developer';

class MapScreen extends StatefulWidget {
  String category;
  double weight;
  MapScreen({super.key, this.category = " ", this.weight = 0.0});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const double _defaultLat = 21.1458;
  static const double _defaultLng = 79.0882;

  static const CameraPosition _defaultLocation = CameraPosition(zoom: 15.0, target: LatLng(_defaultLat, _defaultLng));
  
  GoogleMapController? mapController;
  var myMarkers = HashSet<Marker>();
  // ignore: prefer_typing_uninitialized_variables
  var pos;
  // ignore: prefer_typing_uninitialized_variables
  var myPlace;
  // ignore: prefer_typing_uninitialized_variables
  var myAddress;
  Address? first;
  // ignore: unused_field
  final GeocodingPlatform _geocoding = GeocodingPlatform.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      elevation: 0,
      title: const Text("Google Search Places Api"),
    ),
    body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchMapPlaceWidget(
              textColor: Colors.black,
              bgColor: Colors.white,
              hasClearButton: true,
              placeType: PlaceType.address,
              placeholder: 'Enter the location',
              apiKey: 'AIzaSyBLdWndJ3LzSROLrd-e3Mo_AaaeP6WwOCk',
              onSelected: (Place place) async {
                Geolocation? geolocation = await place.geolocation;
                mapController?.animateCamera(
                  CameraUpdate.newLatLng(geolocation?.coordinates),
                );
                mapController?.animateCamera(
                  CameraUpdate.newLatLngBounds(geolocation?.bounds, 0),
                );
                pos = geolocation?.coordinates;
                final coordinates = Coordinates(pos.latitude, pos.longitude);
                
                List<Address> address =
                    await Geocoder.local.findAddressesFromCoordinates(
                        coordinates);
                if (address.isNotEmpty) {
                  first = address.first;
                }
                var addressLine = first?.addressLine;
                var subLocality = first?.subLocality;
                var locality = first?.locality;
                var postalCode = first?.postalCode;
                var countryName = first?.countryName;
              
                var addressWithoutBuilding =
                    addressLine!.replaceFirst(RegExp(subLocality!), '');
                var finalAddress = '$subLocality, $addressWithoutBuilding, $locality $postalCode, $countryName';
              
                setState(() {
                  myAddress = finalAddress;
                  myMarkers.add(
                    Marker(
                      markerId: const MarkerId('pickupLocation'),
                      position: pos,
                      icon: BitmapDescriptor.defaultMarker,
                      infoWindow: const InfoWindow(
                        title: 'Pickup Address',
                      ),
                    ),
                  );
                });
              },
            ),
            SizedBox(
              height: 600.0,
              child: Stack(
                children:[
                  GoogleMap(
                    onMapCreated: (GoogleMapController googleMapController){
                      setState(() {  
                        mapController = googleMapController;
                      });
                    },
                    initialCameraPosition: _defaultLocation,
                    mapType: MapType.normal,
                    markers: myMarkers,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Button_Widget(
                      text: "Address",
                      btn_width: 270,
                      pressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PickupForm(pic_address: myAddress, pic_lat: pos.latitude, pic_lng: pos.longitude, category: widget.category, weight: widget.weight,)));
                      }
                    )
                  )
                ] 
              ),
            ),
          ],
        ),
      ),
    ),
  );
  }
}