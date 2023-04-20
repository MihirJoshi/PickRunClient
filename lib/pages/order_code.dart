import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pickrun_new_client_app/models/order_model.dart';
import 'package:pickrun_new_client_app/widgets/big_text.dart';
import 'package:pickrun_new_client_app/widgets/button_widget.dart';

// ignore: must_be_immutable
class OrderCode extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String category, pic_address, pic_time, desti_address, desti_time, orderId, cod, pic_Mobno, email, pic_Instruct, pic_Name, pic_Smobno, destiMobno, desti_Instruct, desti_name, desti_Smobno;
  // ignore: non_constant_identifier_names
  double weight, pic_lat, pic_lng, desti_lat, desti_lng, cost, distance;
  OrderCode(
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
  State<OrderCode> createState() => _OrderCodeState();
}

class _OrderCodeState extends State<OrderCode> {
  String? code;
  final _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  OrderModel orders = OrderModel();
  Future<void> updateOrderStatus(String orderUid) async {
  try {
    await FirebaseFirestore.instance.collection('orders').doc(orderUid).update({
      'status': 'Completed',
    });
    print('Order status updated successfully');
  } on FirebaseException catch (e) {
    if (e.code == 'not-found') {
      print('Document does not exist');
    } else {
      print('Error updating order status: $e');
    }
  } catch (e) {
    print('Error updating order status: $e');
  }
}
  @override
  Widget build(BuildContext context) {
    print(code);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30,),
            BigText(text: "Order Id ${widget.orderId}", size: 20,),
            const SizedBox(height: 35,),
            BigText(text: "Enter the Order Completed Code "),
            const SizedBox(height: 55,),
            OtpTextField(
              numberOfFields: 4,
              borderColor: Color.fromARGB(255, 28, 28, 29),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true, 
              //runs when a code is typed in
              onCodeChanged: (String code) {
                  //handle validation or checks here           
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode){
                  code = verificationCode;
              }, // end onSubmit
          ),
          const SizedBox(height: 55,),
          Button_Widget(text: "Submit", btn_width: 260, pressed: (){
            _firestore.collection('orders').add({
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
                  'orderCode': code,
                  'parcelStatus': ' ',
                });
                Fluttertoast.showToast(msg: "${widget.orderId} Order Place Successfully!!");
          })
          ],
        ),
      ),
    );
  }
}