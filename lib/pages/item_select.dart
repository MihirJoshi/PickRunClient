import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pickrun_new_client_app/pages/pickup.dart';
import 'package:pickrun_new_client_app/utils/colors.dart';
import 'package:pickrun_new_client_app/widgets/button_widget.dart';
import 'package:pickrun_new_client_app/widgets/radio_widget.dart';
import 'package:pickrun_new_client_app/widgets/small_text.dart';

class ItemSet extends StatefulWidget {
  const ItemSet({Key? key}) : super(key: key);

  @override
  State<ItemSet> createState() => _ItemSetState();
}

class _ItemSetState extends State<ItemSet> {
  List<String> genderItem = ["0-3", "4-6", "7-9", "10-12", "13-15"];

  RangeValues _currentRangeValues = const RangeValues(1, 3);
  String? rangeValue;
  var selectedRange = const RangeValues(1, 3);
  String? category;
  @override
  Widget build(BuildContext context) {
    double weightStart = _currentRangeValues.start;
    double weightEnd = _currentRangeValues.end;
    double weightRange = weightEnd;
    // ignore: unused_local_variable
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 80),
          decoration: BoxDecoration(
              color: Colors.white60,
              border: Border.all(width: 1, color: Colors.black),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(2.0, 2.0), color: AppColors.shadow)
              ]),
          height: 690,
          width: 500,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SmallText(text: "What are you Sending ?", size: 20, color: Colors.black,),
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
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
                          color: AppColors.shadow)
                    ]),
                height: 370,
                width: 500,
                child: Column(
                  children: [
                    Radio_Widget(
                      item: "Food", 
                      change: (value){
                        setState(() {
                            category = value.toString();
                          });
                      }, 
                      cat: category.toString(),
                      val: "Food", 
                    ),
                    Radio_Widget(
                      item: "Documents",
                      change: (value){
                        setState(() {
                            category = value.toString();
                          });
                      }, 
                      cat: category.toString(),
                      val: "Documents"),
                    Radio_Widget(
                      item: "Cloths",
                      change: (value){
                        setState(() {
                            category = value.toString();
                          });
                      }, 
                      cat: category.toString(),
                      val: "Cloths"),
                    Radio_Widget(
                      item: "Electronic Devices",
                      change: (value){
                        setState(() {
                            category = value.toString();
                          });
                      }, 
                      cat: category.toString(),
                      val: "Electronic Devices"),
                      Radio_Widget(
                      item: "Others",
                      change: (value){
                        setState(() {
                            category = value.toString();
                          });
                      }, 
                      cat: category.toString(),
                      val: "Others"),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(left: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SmallText(text: "Select Weight Range", size: 20, color: Colors.black,),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RangeSlider(
                    values: _currentRangeValues,
                    min: 0,
                    max: 15,
                    divisions: 10,
                    activeColor: AppColors.mainColor,
                    inactiveColor: const Color.fromARGB(55, 46, 240, 32),
                    labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _currentRangeValues = value;
                        //rangeValue = _currentRangeValues.start.toString() + _currentRangeValues.end.toString();
                      });
                    },
                  ),
                  Text('$_currentRangeValues'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button_Widget(text: "Proceed", btn_width: 240, 
                      pressed: (){
                        // ignore: avoid_print
                       
                          if (category != null) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PickupForm(
                              category: category!,
                              weight: weightRange,
                            )));
                          } else {
                            Fluttertoast.showToast(
                                msg: "Please Select the Courier Type !!");
                          }
                      })
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
