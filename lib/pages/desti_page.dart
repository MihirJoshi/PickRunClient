// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pickrun_new_client_app/pages/order_summary.dart';
import 'package:pickrun_new_client_app/utils/colors.dart';
import 'package:pickrun_new_client_app/utils/dimensions.dart';
import 'package:pickrun_new_client_app/widgets/button_widget.dart';
import 'package:pickrun_new_client_app/widgets/order_text_field.dart';
import 'package:pickrun_new_client_app/widgets/small_text.dart';

// ignore: must_be_immutable
class DestinationForm extends StatefulWidget {
  // ignore: non_constant_identifier_names
  var pic_add, pic_mob_no, pic_time, cat, wet;
  DestinationForm(
      {Key? key,
      // ignore: non_constant_identifier_names
      required this.pic_add,
      // ignore: non_constant_identifier_names
      required this.pic_mob_no,
      // ignore: non_constant_identifier_names
      required this.pic_time,
      required this.cat,
      required this.wet,
      })
      : super(key: key);

  @override
  State<DestinationForm> createState() => _DestinationFormState();
}

class _DestinationFormState extends State<DestinationForm> {
 
  String result = " ";
  TimeOfDay selectedTime1 = TimeOfDay.now();

//destination variables
  TextEditingController controllerDSecondMobileNo = TextEditingController();
  TextEditingController controllerDMobileNo =  TextEditingController();
  TextEditingController controllerDAddress = TextEditingController();
  TextEditingController controllerDInstr =  TextEditingController();
  TextEditingController controllerDTime =  TextEditingController();
  TextEditingController controllerDNameOfPC =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    String pAdd = '${widget.pic_add}';
    // ignore: unused_local_variable
    String pMobNo = '${widget.pic_mob_no}';
    // ignore: unused_local_variable
    String pTime = '${widget.pic_time}';
    String category = '${widget.cat}';
    String weight = '${widget.wet}';
    print(weight);
    
    // ignore: no_leading_underscores_for_local_identifiers, unused_local_variable
    final _formKey = GlobalKey<FormState>();
    // ignore: avoid_print
    print(pAdd);
    controllerDTime.text =
        "${selectedTime1.hour.toString().padLeft(2, '0')}:${selectedTime1.minute.toString().padLeft(2, '0')} ${selectedTime1.period.toString().split('.')[1]}";

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                OrderTextField(
                  control: controllerDAddress, 
                  hint: 'Address', 
                  icon: Icons.location_on, 
                  max: 7, 
                  min: 1, 
                  type: TextInputType.multiline, 
                  valid: (String? value){
                    if (value!.isEmpty) {
                      return ("Address Mandatory *");
                    }
                    return null;
                  }, 
                  color: AppColors.locationicon),
                const SizedBox(height: 20),
                OrderTextField(
                  control: controllerDMobileNo, 
                  hint: 'Phone Number', 
                  icon: Icons.phone, 
                  max: 1, 
                  min: 1, 
                  type: TextInputType.number, 
                  valid: (String? value){
                    RegExp regex = RegExp(r'^[6-9]\d{9}$');
                    if (value!.isEmpty) {
                      return ("Mobile No. Mandatory *");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid Mobile Number");
                    }
                    return null;
                  }, 
                  color: AppColors.phonecolor),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SmallText(text: "When to arrive at this address  :-", size: 16, color: Colors.grey,),
                ),
                const SizedBox(
                  height: 20,
                ),
                OrderTextField(
                  control: controllerDTime, 
                  hint: 'Today - at any time', 
                  icon: Icons.alarm, 
                  max: 1, 
                  min: 1, 
                  type: TextInputType.text, 
                  valid: (String? value)
                  {
                    if (value!.isEmpty) {
                      return ("Pickup Time Mandatory *");
                    }
                    return null;
                  }, 
                  tap: (){
                    _selectedTime1(context);
                  },
                  color: AppColors.alarmcolor),
                  
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      const Icon(Icons.directions_run),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        width: 5,
                      ),
                      SmallText(text: "Instruction for Courier", size: 16, color: Colors.black,),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                OrderTextField(
                  control: controllerDInstr, 
                  hint: "For Example call in 30 min", 
                  icon: Icons.chat, 
                  max: 4, 
                  min: 1, 
                  type: TextInputType.name, 
                  valid: (String? value){
                    return null;
                  }, color: Colors.grey),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SmallText(text: "Additional Data", size: 16, color: Colors.black,),
                ),
                const SizedBox(
                  height: 15,
                ),
                OrderTextField(
                  control: controllerDNameOfPC, 
                  hint: 'Name of Customer', 
                  icon: Icons.person_add, 
                  max: 2, 
                  min: 1, 
                  type: TextInputType.name, 
                  valid: (String? value){ return null;}, 
                  color: AppColors.personicon),
                const SizedBox(
                  height: 15,
                ),
                OrderTextField(
                  control: controllerDSecondMobileNo, 
                  hint: 'Additional Phone Number', 
                  icon: Icons.phone, 
                  max: 1, 
                  min: 1, 
                  type: TextInputType.number, 
                  valid: (String? value){return null;}, 
                  color: AppColors.phonecolor),
                SizedBox(height: Dimensions.height35),
                Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.left10, right: Dimensions.right10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button_Widget(text: "Next", btn_width: 240, pressed: (){
                                  if (controllerDAddress.text.isNotEmpty &&
                          controllerDMobileNo.text.isNotEmpty &&
                          controllerDTime.text.isNotEmpty) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => OrderSummary(
                                  p_add: pAdd,
                                  p_mob_no: pMobNo,
                                  p_time: pTime,
                                  d_add: controllerDAddress.text,
                                  d_mob_no: controllerDMobileNo.text,
                                  d_time: controllerDTime.text,
                                  cat_o: category,
                                  wet_o: weight,
                                ))));
                      } else {
                        Fluttertoast.showToast(msg: "Please fill Mandatory* Field");
                      }
                      })
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _selectedTime1(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime1,
      initialEntryMode: TimePickerEntryMode.dial,
    );

    if (timeOfDay != null && timeOfDay != selectedTime1) {
      setState(() {
        selectedTime1 = timeOfDay;
        // ignore: avoid_print
        print(timeOfDay);
      });
    }
  }
}
