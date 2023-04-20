import 'package:flutter/material.dart';
import 'package:pickrun_new_client_app/utils/colors.dart';
import 'package:pickrun_new_client_app/widgets/big_text.dart';


class CardWidget extends StatelessWidget {
  final String wet;
  final String wetData;
  final String type;
  final String typeData;
  final String price;
  final String priceData;
  const CardWidget({Key? key, required this.wet, required this.wetData, required this.price, required this.priceData, required this.type, required this.typeData}) : super(key: key);

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
                height: 150,
                width: 300,
                child: Column(
                children: [
                   Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20, left: 25),
                      child:  Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            wet,
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
                          child: BigText(text: wetData, color: Colors.black54, size: 20,)
                        ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20, left: 25),
                      child:  Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            type,
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
                          child: BigText(text: typeData, color: Colors.black54, size: 20,)
                        ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20, left: 25),
                      child:  Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            price,
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
                          child: BigText(text: priceData, color: Colors.black54, size: 20,),
                        ),
                    ),
                  ],
                ),
              ]
                )
    );
  }
}