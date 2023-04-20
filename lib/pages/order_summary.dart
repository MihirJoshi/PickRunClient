import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pickrun_new_client_app/models/order_model.dart';
import 'package:pickrun_new_client_app/pages/order_code.dart';
import 'package:pickrun_new_client_app/utils/colors.dart';
import 'package:pickrun_new_client_app/widgets/big_text.dart';
import 'package:pickrun_new_client_app/widgets/button_widget.dart';

// ignore: must_be_immutable
class OrderSummary extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String category, pic_address, pic_time, desti_address, desti_time, orderId, cod, pic_Mobno, email, pic_Instruct, pic_Name, pic_Smobno, destiMobno, desti_Instruct, desti_name, desti_Smobno;
  // ignore: non_constant_identifier_names
  double weight, pic_lat, pic_lng, desti_lat, desti_lng, cost, distance;
  OrderSummary(
      {Key? key,
        required this.category,
        required this.cod,
        // ignore: non_constant_identifier_names
        required this.pic_address, 
        // ignore: non_constant_identifier_names
        required this.pic_lat,
        // ignore: non_constant_identifier_names
        required this.pic_lng, 
        // ignore: non_constant_identifier_names
        required this.pic_time,
        required this.weight,
        // ignore: non_constant_identifier_names
        required this.desti_address,
        // ignore: non_constant_identifier_names
        required this.desti_lat,
        // ignore: non_constant_identifier_names
        required this.desti_lng,
        // ignore: non_constant_identifier_names
        required this.desti_time,
        required this.orderId,
        required this.distance,
        required this.cost,
        required this.destiMobno,
        this.desti_Instruct = " ",
        this.desti_Smobno = " ",
        this.desti_name = " ",
        required this.email,
        this.pic_Instruct = " ",
        required this.pic_Mobno,
        this.pic_Name = " ",
        this.pic_Smobno = " ",
      })
      : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  final _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  OrderModel orders = OrderModel();
  @override
  Widget build(BuildContext context) {
    double price = widget.cost;
    return Scaffold(
      //extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
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
                height: 160,
                width: 300,
                child: Column(children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20, left: 25),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: BigText(text: "Item Deliver :-", size: 20, color: Colors.grey,),
                          ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.only(top: 20, right: 35),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: BigText(text: widget.category, size: 20, color: Colors.black,),
                          ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20, left: 25),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: BigText(text: "Item Weight :-", size: 20, color: Colors.grey,),
                          ),
                      ),
                      const Spacer(),
                      Container(
                        padding: EdgeInsets.only(top: 20, right: 35),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: BigText(text: '${widget.weight}' ' ''KG', size: 20, color: Colors.black,),
                          ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20, left: 25),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: BigText(text: "Payment :-", size: 20, color: Colors.grey,)
                          ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.only(top: 20, right: 35),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: BigText(text: widget.cod, size: 20, color: Colors.black,)
                          ),
                      ),
                    ],
                  ),
                ]),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.only(left: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: BigText(text: "From", size: 20, color: Colors.black,),
                ),
              ),
              const Divider(
                indent: 40,
                endIndent: 40,
                thickness: 1,
                color: Colors.black,
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 55, top: 25),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: BigText(text: widget.pic_address, size: 20, color: Colors.black,  maxLines: 5, overflow: TextOverflow.ellipsis,)
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 55, top: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: BigText(text: "Today ${widget.pic_time}", size: 20, color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.only(left: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: BigText(text: "To", size: 20, color: Colors.black,)
                ),
              ),
              const Divider(
                indent: 40,
                endIndent: 40,
                thickness: 1,
                color: Colors.black,
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 55, top: 25),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: BigText(text: widget.desti_address, size: 20, color: Colors.black,  maxLines: 5, overflow: TextOverflow.ellipsis,)
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 55, top: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: BigText(text: "Today ${widget.desti_time}", size: 20, color: Colors.black,)
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 65),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: BigText(text: "Total Cost", size: 20, color: Colors.black,)
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.only(right: 65),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: BigText(text: price.toStringAsFixed(2), size: 20, color: Colors.black,)
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Button_Widget(text: "Submit", btn_width: 270, pressed: (){
                /*_firestore.collection('orders').add({
                  'orderId': widget.orderId,
                  'uid': user?.uid,
                  'picAddress': widget.pic_address,
                  'picMobno': widget.pic_Mobno,
                  'picTime': widget.pic_time,
                  'email': widget.email,
                  'picInstruct': widget.pic_Instruct,
                  'picName': widget.pic_Name,
                  'picSMobno': widget.pic_Smobno,
                  'destiAddress': widget.desti_address,
                  'destiMobno': widget.destiMobno,
                  'destiTime': widget.desti_time,
                  'destiInstruct': widget.desti_Instruct,
                  'destiName': widget.desti_name,
                  'destiSmobno': widget.desti_Smobno,
                  'category': widget.category,
                  'weight': widget.weight,
                  'picLat': widget.pic_lat,
                  'picLng': widget.pic_lng,
                  'codType': widget.cod,
                  'distance': widget.distance,
                  'price': widget.cost,
                  'distLat': widget.desti_lat,
                  'distLng': widget.desti_lng,
                  'status': 'available',
                  'driverId': ' ',
                  'driverName': ' ',
                  'driverMobno': ' ',
                  'driverUid': ' ',
                  'parcelPhoto': ' ',
                  'orderCode': ' ',
                  'parcelStatus': ' ',
                });
                Fluttertoast.showToast(msg: "${widget.orderId} Order Place Successfully!!");*/
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                      // <-- SEE HERE
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  builder: ((builder) => bottomSheet()));

              }),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget bottomSheet() {
    return FractionallySizedBox(
      heightFactor: 0.55,
      child: OrderCode(category: widget.category, cod: widget.cod, pic_address: widget.pic_address, pic_lat: widget.pic_lat, pic_lng: widget.pic_lng, pic_time: widget.pic_time, weight: widget.weight, desti_address: widget.desti_address, desti_lat: widget.desti_lat, desti_lng: widget.desti_lng, desti_time: widget.desti_time, orderId: widget.orderId, cost: widget.cost, distance: widget.distance, email: widget.email, pic_Mobno: widget.pic_Mobno, pic_Instruct: widget.pic_Instruct, pic_Name: widget.pic_Name, pic_Smobno: widget.pic_Smobno, destiMobno: widget.destiMobno, desti_Instruct: widget.desti_Instruct, desti_Smobno: widget.desti_Smobno, desti_name: widget.desti_name),
    );
  }
}