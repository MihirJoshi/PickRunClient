import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:fluttertoast/fluttertoast.dart';
// ignore: unused_import
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pickrun_new_client_app/pages/map_screen.dart';
// ignore: unused_import
import 'package:pickrun_new_client_app/utils/colors.dart';
import 'package:pickrun_new_client_app/widgets/button_widget.dart';
import 'package:pickrun_new_client_app/widgets/map_text_field.dart';
// ignore: unused_import
import 'package:pickrun_new_client_app/widgets/order_text_field.dart';
// ignore: unused_import
import 'package:pickrun_new_client_app/widgets/text_field_widget.dart';
// ignore: unnecessary_import
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class MapUi extends StatefulWidget {
  String category;
  double weight;
  MapUi({super.key, this.category = " ", this.weight = 0.0});

  @override
  State<MapUi> createState() => _MapUiState();
}

class _MapUiState extends State<MapUi> {
  // ignore: unused_field
  GoogleMapController? _mapController;
  // ignore: unused_field
  String? _locationMessage;
  
  
  final LatLng _position = const LatLng(19.218330, 72.978088);
  @override
  Widget build(BuildContext context) {
    //print("Fetched address:"+widget.address);
  // ignore: unused_local_variable
  TextEditingController myController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            const SizedBox(height: 40,),
            Center(
              child: Container(
                width: 300,
              height: 200,
              //BoxDecoration Widget
              decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2,
              ), //Border.all
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(
                    2.0,
                    2.0,
                  ), //Offset
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
              ),
              child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: Stack(
                children: <Widget>[
                  GoogleMap(
                  onMapCreated: (GoogleMapController mapController)
                  {
                    _mapController = mapController;
                  },
                  initialCameraPosition: CameraPosition(target: _position, zoom: 10.0),
                ),
                Container(
                  padding:const EdgeInsets.only(right: 10, top: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    // add your floating action button
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen(category: widget.category, weight: widget.weight,)));
                      },
                      child:const Icon(Icons.location_searching),
                    ),
                  ),
                ),
                ] ,
              ),
              ),
              ),
            ),
            const SizedBox(height: 25,),
            MapTextField(text: "Address",
            control: myController,
            valid: (String? value){
                  if (value!.isEmpty) {
                    return ("Address Mandatory *");
                  }
                  return null;
                },),
            const SizedBox(height: 30,),
            Button_Widget(text: "Get Address", btn_width: 270, pressed: (){}),
            const SizedBox(height: 50,),
            
          ],
        ),
      ),
    );
  }
  
}

 