import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pickrun_new_client_app/models/order_model.dart';
import 'package:pickrun_new_client_app/models/user_model.dart';
import 'package:pickrun_new_client_app/pages/detail_order.dart';
import 'package:pickrun_new_client_app/widgets/big_text.dart';
import 'package:pickrun_new_client_app/widgets/button_widget.dart';
import 'package:pickrun_new_client_app/widgets/small_text.dart';

class OrderHistory extends StatefulWidget {
  String userUid;
  OrderHistory({super.key, required this.userUid});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  UserModel? _user;
  OrderModel? _order;
  List<OrderModel> orders = [];
  void initState() {
  super.initState();
  _fetchActiveOrder(widget.userUid);
  
}

Future<void> _fetchActiveOrder(String currentDriverId) async {
    //final user = FirebaseAuth.instance.currentUser;
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: currentDriverId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final data = querySnapshot.docs.first.data();
      final userDetail = UserModel.fromMap(data);
      setState(() {
        _user = userDetail;
      });
      fetchOrders(_user!.email!);
    }
  }

Future<void> fetchOrders(String userEmail) async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('orders').where('email', isEqualTo: userEmail).limit(5).get();

    final List<OrderModel> fetchedOrders = [];
    

    querySnapshot.docs.forEach((doc) {
      final data = doc.data();
      final orderDetail = OrderModel.fromMap(data);
      fetchedOrders.add(orderDetail);
    });

    setState(() {
      orders = fetchedOrders;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Order Screen', style: TextStyle(color: Colors.black),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: orders.map((order){
            return Card(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailOrder(order: order, email: _user!.email!,)));
                },
                child: Column(
                children: [
                  const SizedBox(height: 40,),
                  BigText(text: "Order Id ${order.orderId}"),
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
                      "${order.picAddress}",
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
                      "${order.destiAddress}",
                      maxLines: 3,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 25,),
                  BigText(text: "Price: ${order.price?.toStringAsFixed(2)}"),
                  Divider(thickness: 2, color: Colors.grey, height: 25, indent: 15, endIndent: 15,),
                ],
                    ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }


}