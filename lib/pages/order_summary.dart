import 'package:flutter/material.dart';
import 'package:pickrun_new_client_app/utils/colors.dart';

// ignore: must_be_immutable
class OrderSummary extends StatefulWidget {
  var p_add, p_mob_no, p_time, d_add, d_mob_no, d_time, cat_o, wet_o, p_instruct, p_name, p_add_mob_no, d_instruct, d_name, d_add_mob_no,p_lat, p_lng, d_lat, d_lng;
  OrderSummary(
      {Key? key,
      required this.p_add,
      required this.p_mob_no,
      required this.p_time,
      required this.d_add,
      required this.d_mob_no,
      required this.d_time,
      required this.cat_o,
      required this.wet_o,
      required this.p_lat,
      required this.p_lng,
      required this.d_lat,
      required this.d_lng,
      this.p_instruct = "",
      this.p_add_mob_no = "",
      this.p_name = "",
      this.d_instruct = "",
      this.d_add_mob_no = "",
      this.d_name = ""
      })
      : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    print(widget.p_instruct);
    print(widget.d_lng);
    print(widget.d_instruct);
    final procced_btn = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: AppColors.circlecolor,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: 240,
        onPressed: () {
          
        },
        child: Text(
          "Place Order",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: "Roboto"),
        ),
      ),
    );
    return Scaffold(
      //extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                    color: AppColors.ordercolor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(2.0, 2.0),
                          color: AppColors.ordercolor)
                    ]),
                height: 160,
                width: 300,
                child: Column(children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20, left: 25),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Item Deliver :-",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            )),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(top: 20, right: 35),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${widget.cat_o}',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20, left: 25),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Item Weight :-",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            )),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(top: 20, right: 35),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${widget.wet_o}' + ' ''KG',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20, left: 25),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Payment Mode :-",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            )),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(top: 20, right: 35),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Cash",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                      ),
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(left: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "From",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              Divider(
                indent: 40,
                endIndent: 40,
                thickness: 1,
                color: Colors.black,
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 55, top: 25),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${widget.p_add}",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 55, top: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${widget.p_time}",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 55, top: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.payments,
                            size: 28,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, top: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Cash",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(left: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "To",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              Divider(
                indent: 40,
                endIndent: 40,
                thickness: 1,
                color: Colors.black,
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 55, top: 25),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${widget.d_add}",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 55, top: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${widget.d_time}",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 65),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Totoal Cost :-",
                        style:
                            TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(right: 65),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "₹ 150",
                        style:
                            TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [procced_btn],
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
