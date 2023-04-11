import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:fluttertoast/fluttertoast.dart';
// ignore: unused_import
import 'package:geolocator/geolocator.dart';
import 'package:flutter_geocoder/geocoder.dart';
//import 'package:geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pickrun_new_client_app/pages/desti_page.dart';
// ignore: unused_import
import 'package:pickrun_new_client_app/pages/map_ui.dart';
import 'package:pickrun_new_client_app/widgets/button_widget.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';
import 'dart:collection';
// ignore: unused_import
import 'dart:convert';
// ignore: unused_import
import 'dart:developer';

// ignore: must_be_immutable
class DestinationMapScreen extends StatefulWidget {
  String category, pic_address, pic_time, email, pic_Instruct, pic_Mobno, pic_Smobno, pic_Name;
  double weight, pic_lat, pic_lng;
  DestinationMapScreen({super.key, this.category = " ", this.pic_address = " ", this.pic_time = " ", this.pic_lat = 0.0, this.weight = 0.0, this.pic_lng = 0.0, this.email = " ", this.pic_Instruct = " ", this.pic_Mobno = " ", this.pic_Name = " ", this.pic_Smobno = " "});

  @override
  State<DestinationMapScreen> createState() => _DestinationMapScreenState();
}

class _DestinationMapScreenState extends State<DestinationMapScreen> {
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
  var destiAddress;
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
      body: Container(
        child: Padding(
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
                    print(pos.latitude);
                    print(pos.longitude);
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
                      destiAddress = finalAddress;
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
                SizedBox(height: 600.0,
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
                  Align(alignment: Alignment.bottomCenter, child: Button_Widget(text: "Address", btn_width: 270, pressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => DestinationForm(category: widget.category, weight: widget.weight, pic_address: widget.pic_address, pic_lat: widget.pic_lat, pic_time: widget.pic_time, pic_lng: widget.pic_lng, desti_address: destiAddress, desti_lat: pos.latitude, desti_lng: pos.longitude, email: widget.email, pic_Mobno: widget.pic_Mobno, pic_Instruct: widget.pic_Instruct, pic_Name: widget.pic_Name, pic_Smobno: widget.pic_Smobno,)));
                  }))
                  ] 
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}