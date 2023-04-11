import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pickrun_new_client_app/pages/order_summary.dart';
import 'package:pickrun_new_client_app/utils/colors.dart';
import 'package:pickrun_new_client_app/widgets/big_text.dart';
import 'package:pickrun_new_client_app/widgets/button_widget.dart';
import 'package:pickrun_new_client_app/widgets/radio_widget.dart';

// ignore: must_be_immutable
class PriceCalculate extends StatefulWidget {
  String category, pic_address, p_time, desti_address, desti_time, email, pic_Instruct, pic_Mobno, pic_Name, pic_Smobno, deti_Mobno, desti_Instruct, desti_Smobno, desti_name;
  double weight, pic_lat, pic_lng, desti_lat, desti_lng;
  PriceCalculate(
      {Key? key,
        this.category = " ",
        this.weight = 0.0,
        this.pic_address = " ",
        this.p_time = " ",
        this.pic_lat = 0.0,
        this.pic_lng = 0.0,
        this.desti_address = " ",
        this.desti_lat = 0.0,
        this.desti_lng = 0.0,
        this.desti_time = " ",
        this.desti_Instruct = " ",
         this.desti_Smobno = " ",
         this.desti_name = " ",
         this.deti_Mobno = " ",
          this.email = " ",
          this.pic_Instruct = " ",
          this.pic_Mobno = " ",
          this.pic_Name = " ",
          this.pic_Smobno = " ",
      })
      : super(key: key);

  @override
  State<PriceCalculate> createState() => _PriceCalculateState();
}

class _PriceCalculateState extends State<PriceCalculate> {

    GoogleMapController? mapController; //contrller for Google map
    PolylinePoints polylinePoints = PolylinePoints();

    String googleAPiKey = "AIzaSyBLdWndJ3LzSROLrd-e3Mo_AaaeP6WwOCk";
    
    Set<Marker> markers = Set(); //markers for google map
    Map<PolylineId, Polyline> polylines = {}; //polylines to show direction

    late LatLng startLocation = LatLng(widget.pic_lat, widget.pic_lng);  
    late LatLng endLocation = LatLng(widget.desti_lat, widget.desti_lng); 

    double distance = 0.0;
    double _price = 0.0;
    double dit = 0.0;
    double wet = 0.0;
    String? cod;
    String? _orderId;

    late double weight = widget.weight;

  @override
  void initState() {

     markers.add(Marker( //add start location marker
        markerId: MarkerId(startLocation.toString()),
        position: startLocation, //position of marker
        infoWindow: InfoWindow( //popup info 
          title: 'Starting Point ',
          snippet: 'Start Marker',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add distination location marker
        markerId: MarkerId(endLocation.toString()),
        position: endLocation, //position of marker
        infoWindow: InfoWindow( //popup info 
          title: 'Destination Point ',
          snippet: 'Destination Marker',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      
      getDirections(); //fetch direction polylines from Google API
      
    super.initState();
  }

  getDirections() async {
      List<LatLng> polylineCoordinates = [];
     
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          googleAPiKey,
          PointLatLng(startLocation.latitude, startLocation.longitude),
          PointLatLng(endLocation.latitude, endLocation.longitude),
          travelMode: TravelMode.driving,
      );

      if (result.points.isNotEmpty) {
            result.points.forEach((PointLatLng point) {
                polylineCoordinates.add(LatLng(point.latitude, point.longitude));
            });
      } else {
         print(result.errorMessage);
      }

      //polulineCoordinates is the List of longitute and latidtude.
      double totalDistance = 0;
      for(var i = 0; i < polylineCoordinates.length-1; i++){
           totalDistance += calculateDistance(
                polylineCoordinates[i].latitude, 
                polylineCoordinates[i].longitude, 
                polylineCoordinates[i+1].latitude, 
                polylineCoordinates[i+1].longitude);
      }
      print(totalDistance);

      setState(() {
         distance = totalDistance;
      });

      //add to the list of poly line coordinates
      addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
    _price = calculateParcelPrice(distance, weight);
    _orderId = generateOrderId();
  }

  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p)/2 + 
          cos(lat1 * p) * cos(lat2 * p) * 
          (1 - cos((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
    
  }

double calculateParcelPrice(double distanceKm, double weightKg) {
  // Define custom constants for price calculation
  final double basePrice = 40.0; // Custom base price for parcels
  final double pricePerKm = 8.0; // Custom price per kilometer
  final double pricePerKg = 10.0; // Custom price per kilogram for weight > 5kg

  // Calculate the distance price
  double distancePrice = distanceKm * pricePerKm;

  // Calculate the weight price if weight is greater than 5kg
  double weightPrice = 0.0;
  if (weightKg > 5) {
    double additionalWeightKg = weightKg - 5;
    weightPrice = additionalWeightKg * pricePerKg;
  }

  // Calculate the total price
  double totalPrice = distancePrice + weightPrice;

  // Check if total price is less than base price and apply base price if needed
  if (totalPrice < basePrice) {
    totalPrice = basePrice;
  }

  return totalPrice;
}

String generateOrderId() {
  String orderIdTemplate = "#%07d";
  int orderIdSuffix = generateRandomNumber(1000000, 9999999);
  return orderIdTemplate.replaceAll("%07d", orderIdSuffix.toString());
}

int generateRandomNumber(int min, int max) {
  final _random = Random();
  return min + _random.nextInt(max - min);
}

  @override
  Widget build(BuildContext context) {
 
    return  Scaffold(
          appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: BigText(text: "Payment Method")
      ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Stack(
                    children: [
                      Expanded(
                        child: Container(
                        width: 315,
                        height: 400,
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
                          child: GoogleMap( //Map widget from google_maps_flutter package
                                  zoomGesturesEnabled: true, //enable Zoom in, out on map
                                  initialCameraPosition: CameraPosition( //innital position in map
                                    target: startLocation, //initial position
                                    zoom: 9.5, //initial zoom level
                                  ),
                                  markers: markers, //markers to show on map
                                  polylines: Set<Polyline>.of(polylines.values), //polylines
                                  mapType: MapType.normal, //map type
                                  onMapCreated: (controller) { //method called when map is created
                                    setState(() {
                                      mapController = controller; 
                                    });
                                  },
                            ),
                        ),
                        ),
                      ),
                      Positioned(
                        bottom: 310,
                        left: 15,
                        right: 15,
                        child: Card( 
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Text("Total Distance: " + distance.toStringAsFixed(2) + " KM",
                                        style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold))
                          ),
                        )
                      ),
                    ] 
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: const BoxDecoration(
                  color: AppColors.ordercolor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(2.0, 2.0),
                        color: AppColors.ordercolor)
                  ]),
                height: 70,
                width: 300,
                child: Column(
                children: [
                   Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20, left: 25),
                      child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Total Price:- ",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.only(top: 20, right: 35),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: BigText(text: 'Rs. ${_price.toStringAsFixed(2)}', color: Colors.black54, size: 20,)
                        ),
                    ),
                  ],
                ),
              ],
            ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: const BoxDecoration(
                    color: AppColors.ordercolor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(2.0, 2.0),
                          color: AppColors.shadow)
                    ]),
                height: 200,
                width: 300,
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    BigText(
                     text: "Cash on Delivery", size: 20, color: Colors.black,),
                    Radio_Widget(
                      item: "Pickup Point", 
                      change: (value){
                        setState(() {
                            cod = value.toString();
                          });
                      }, 
                      cat: cod.toString(),
                      val: "Pickup Point", 
                    ),
                    Radio_Widget(
                      item: "Destination Point",
                      change: (value){
                        setState(() {
                            cod = value.toString();
                          });
                      }, 
                      cat: cod.toString(),
                      val: "Destination Point"),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Button_Widget(text: "Next", btn_width: 270, pressed: (){
                if(cod != null)
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OrderSummary(category: widget.category, cod: cod!, pic_address: widget.pic_address, pic_lat: widget.pic_lat, pic_lng: widget.pic_lng, pic_time: widget.p_time, weight: weight, desti_address: widget.desti_address, desti_lat: widget.desti_lat, desti_lng: widget.desti_lng, desti_time: widget.desti_time, orderId: _orderId!, cost: _price, distance: distance, email: widget.email, pic_Mobno: widget.pic_Mobno, pic_Instruct: widget.pic_Instruct, pic_Name: widget.pic_Name, pic_Smobno: widget.pic_Smobno, destiMobno: widget.deti_Mobno, desti_Instruct: widget.desti_Instruct, desti_Smobno: widget.desti_Smobno, desti_name: widget.desti_name)));
                }
                else
                {
                  Fluttertoast.showToast(msg: "Please select the COD Type");
                }
              }),
              const SizedBox(height: 15,),
          ],
        ),
      ),
  );
}
}
