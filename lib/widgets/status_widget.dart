import 'package:flutter/material.dart';
import 'package:pickrun_new_client_app/utils/colors.dart';
import 'package:pickrun_new_client_app/widgets/big_text.dart';


class StatusWidget extends StatelessWidget {
  final String statusData;
  final String status;
  StatusWidget({Key? key, required this.status, required this.statusData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        height: 120,
        width: 300,
        child: Column(
        children: [
          SizedBox(height: 20,),
            Container(
              //padding: const EdgeInsets.only(top: 20, left: 25),
              child:  Text(
                status,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(height: 25,),
            Container(
              //padding: const EdgeInsets.only(top: 20, right: 35),
              child: BigText(text: statusData, color: Colors.black54, size: 20,),
            ),
      ]
        )
    );
  }
}