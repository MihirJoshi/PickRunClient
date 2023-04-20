import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pickrun_new_client_app/models/order_model.dart';
import 'package:pickrun_new_client_app/models/user_model.dart';
import 'package:pickrun_new_client_app/widgets/big_text.dart';
import 'package:pickrun_new_client_app/widgets/order_display_widget.dart';
import 'package:pickrun_new_client_app/widgets/status_widget.dart';

class TrackOrder extends StatefulWidget {
  String userUid;
  TrackOrder({super.key, required this.userUid});

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  UserModel? _user;
  OrderModel? _order;
  OrderModel? _orderId;

  void initState() {
  super.initState();
  _fetchActiveOrder(widget.userUid);
}

void _fetchActiveOrder(String currentDriverId) {
  FirebaseFirestore.instance
      .collection('users')
      .where('uid', isEqualTo: currentDriverId)
      .get()
      .then((QuerySnapshot snapshot) {
    if (snapshot.docs.isNotEmpty) {
      final data = snapshot.docs.first.data();
      final userDetail = UserModel.fromMap(data);
      setState(() {
        _user = userDetail;
      });
      _fetchOrderDetail(_user!.email!);
    }
  });
}

void _fetchOrderDetail(String userEmail) {
  FirebaseFirestore.instance
      .collection('orders')
      .where('status', isEqualTo: 'Active')
      .where('email', isEqualTo: userEmail)
      .get()
      .then((QuerySnapshot snapshot) {
    if (snapshot.docs.isNotEmpty) {
      final data = snapshot.docs.first.data();
      final orderDetail = OrderModel.fromMap(data);
      setState(() {
        _order = orderDetail;
      });
    }
  });
}


  @override
  Widget build(BuildContext context) {
    print("Track Id ${_order?.uid}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Track Order', style: TextStyle(color: Colors.black),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body:  SingleChildScrollView(
        child: Column(
        children: [
          const SizedBox(height: 40,),
          BigText(text: "Order Id ${_order?.orderId}"),
          SizedBox(height: 10,),
          Divider(
            thickness: 2,
            indent: 15,
            endIndent: 15,
          ),
          SizedBox(height: 25,),
          BigText(text: "Driver Details", size: 20,),
          SizedBox(height: 10,),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                
                Expanded(
                  child: Column(
                    children: [
                      OrderDisplayWidget(line: "Driver Id: ", data: _order?.driverId??""),
                      const SizedBox(
                        height: 12,
                      ),
                      OrderDisplayWidget(line: "Name: ", data: _order?.driverName??""),
                      const SizedBox(
                        height: 12,
                      ),
                      OrderDisplayWidget(line: "Mobile Number: ", data: _order?.driverMobno??""),
                      const SizedBox(
                        height: 12,
                      ),
                      
                    ],
                  ),
                ),
              ],
              ),
              SizedBox(height: 10,),
          Divider(
            thickness: 2,
            indent: 15,
            endIndent: 15,
          ),
          SizedBox(height: 25,),
          BigText(text: "Parcel Details", size: 20,),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.only(left: 28),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "From: ",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 40),
            alignment: Alignment.topRight,
            child: Text(
              "${_order?.picAddress}",
              maxLines: 3,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.only(left: 28),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "To: ",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            margin: const EdgeInsets.only(left: 40),
            alignment: Alignment.topRight,
            child: Text(
              "${_order?.destiAddress}",
              maxLines: 3,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigText(text: "Weight: ${_order?.weight??" "} KG", size: 18,),
              SizedBox(width: 45,),
              BigText(text: "Price: ${_order?.price?.toStringAsFixed(2)}", size: 18,),
            ],
          ),
          SizedBox(height: 25,),
          BigText(text: "Category: ${_order?.category??" "}", size: 20,),
          SizedBox(height: 15,),
          StatusWidget(status: "Status: ", statusData: "${_order?.parcelStatus}"),
          SizedBox(height: 25,),
        ],
            ),
      ),
    );
  }
}