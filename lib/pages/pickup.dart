import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pickrun_new_client_app/pages/desti_page.dart';
import 'package:pickrun_new_client_app/pages/map_ui.dart';
import 'package:pickrun_new_client_app/utils/colors.dart';
import 'package:pickrun_new_client_app/utils/dimensions.dart';
import 'package:pickrun_new_client_app/widgets/big_text.dart';
import 'package:pickrun_new_client_app/widgets/button_widget.dart';
import 'package:pickrun_new_client_app/widgets/order_text_field.dart';
import 'package:pickrun_new_client_app/widgets/small_text.dart';


// ignore: must_be_immutable
class PickupForm extends StatefulWidget {
  String category, pic_address;
  double weight, pic_lat, pic_lng;
  PickupForm({Key? key, required this.category,required this.weight, this.pic_address = " ", this.pic_lat = 0.0, this.pic_lng = 0.0}) : super(key: key);

  @override
  State<PickupForm> createState() => _PickupFormState();
}

class _PickupFormState extends State<PickupForm> {
  
  String value = " ";
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController controllerMobno =  TextEditingController();
  TextEditingController controllerTime =  TextEditingController();
  TextEditingController controllerInstruct =  TextEditingController();
  TextEditingController controllerName =  TextEditingController();
  TextEditingController controllerAddMobno =  TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerAddress =TextEditingController(text: widget.pic_address);
    // form key
    // ignore: no_leading_underscores_for_local_identifiers, unused_local_variable
    final _formKey = GlobalKey<FormState>();

    // time display controller
    controllerTime.text =
        "${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')} ${selectedTime.period.toString().split('.')[1]}";
    return Scaffold(
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
        title: BigText(text: "Pickup Point")
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              OrderTextField(
                tap: (){
                  showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                      // <-- SEE HERE
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  builder: ((builder) => bottomSheet()));
                },
                control: controllerAddress, 
                hint: 'Address', 
                icon: Icons.location_on,
                max: 7,
                min: 1,
                //type: TextInputType.multiline,
                valid: (String? value){
                  if (value!.isEmpty) {
                    return ("Address Mandatory *");
                  }
                  return null;
                },
                color: AppColors.locationicon),
              const SizedBox(height: 20),
              OrderTextField(
                control: controllerMobno,
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
              OrderTextField(
                control: controllerEmail,
                hint: 'Email', 
                icon: Icons.phone, 
                max: 1, 
                min: 1, 
                type: TextInputType.emailAddress, 
                valid: (String? value){
                  RegExp regex = RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]");
                      if (value!.isEmpty) {
                        return ("Email Mandatory *");
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Enter Valid Email");
                      }
                      return null;
                }, 
                color: AppColors.phonecolor),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SmallText(text: "When to arrive at this address  :-", size: 16, color: Colors.grey,)
              ),
              const SizedBox(
                height: 20,
              ),
              OrderTextField(
                control: controllerTime, 
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
                color: AppColors.alarmcolor,
                tap: (){
                  _selectedTime(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              // ignore: prefer_const_constructors
              Align(
                alignment: Alignment.centerLeft,
                child:  Row(
                  children: [
                    const Icon(Icons.directions_run),
                    const SizedBox(
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
                control: controllerInstruct, 
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
                control: controllerName, 
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
                control: controllerAddMobno, 
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
                    Button_Widget(
                        text: "Next",
                        btn_width: Dimensions.minWidth,
                        pressed: () {
                          if (controllerAddress.text.isNotEmpty &&
                              controllerMobno.text.isNotEmpty &&
                              controllerTime.text.isNotEmpty && controllerEmail.text.isNotEmpty) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DestinationForm(category: widget.category, weight: widget.weight, pic_address: widget.pic_address, pic_lat: widget.pic_lat, pic_time: controllerTime.text, pic_lng: widget.pic_lng, email: controllerEmail.text, pic_Mobno: controllerAddMobno.text, pic_Instruct: controllerInstruct.text, pic_Name: controllerName.text, pic_Smobno: controllerAddMobno.text,)));
                          } else {
                            Fluttertoast.showToast(
                                msg: "Please fill Mandatory Field *");
                          }
                        })
                  ],
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  _selectedTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );

    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
        // ignore: avoid_print
        print(timeOfDay);
      });
    }
  }
  Widget bottomSheet() {
    return FractionallySizedBox(
      heightFactor: 0.75,
      child: MapUi(category: widget.category, weight: widget.weight,),
    );
  }
}
