// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pickrun_new_client_app/pages/destination_ui.dart';
import 'package:pickrun_new_client_app/pages/price_calculate.dart';
import 'package:pickrun_new_client_app/utils/colors.dart';
import 'package:pickrun_new_client_app/utils/dimensions.dart';
import 'package:pickrun_new_client_app/utils/direction_repository.dart';
import 'package:pickrun_new_client_app/widgets/big_text.dart';
import 'package:pickrun_new_client_app/widgets/button_widget.dart';
import 'package:pickrun_new_client_app/widgets/order_text_field.dart';
import 'package:pickrun_new_client_app/widgets/small_text.dart';

// ignore: must_be_immutable
class DestinationForm extends StatefulWidget {
  String pic_address, pic_time, category, desti_address, desti_time, email, pic_Instruct, pic_Name, pic_Smobno, pic_Mobno;
  double pic_lat, pic_lng, weight, desti_lat, desti_lng;
  DestinationForm(
      {Key? key,
      // ignore: non_constant_identifier_names
      required this.category,
      required this.weight,
      required this.pic_address,
      required this.pic_lat,
      required this.pic_time, 
      required this.pic_lng,
      this.desti_address = " ",
      this.desti_time = " ",
      this.desti_lat = 0.0,
      this.desti_lng = 0.0,
      required this.email,
      required this.pic_Mobno,
      this.pic_Instruct = " ",
      this.pic_Name = " ",
      this.pic_Smobno = " ",
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
  TextEditingController controllerDInstr =  TextEditingController();
  TextEditingController controllerDTime =  TextEditingController();
  TextEditingController controllerDNameOfPC =  TextEditingController();

  //final _distanceRepository = DistanceRepository();
  
   /* late final _origin = LatLng(widget.pic_lat, widget.pic_lng);
    late final _destination = LatLng(widget.desti_lat, widget.desti_lng);
    // ignore: unused_field
    int? _distance = 0;

   @override
  void initState() {
    super.initState();
    _getDistance();
  }

  Future<void> _getDistance() async {
    final distance = await _distanceRepository.getDistance(
      origin: '${_origin.latitude},${_origin.longitude}',
      destination: '${_destination.latitude},${_destination.longitude}',
    );
    setState(() {
      _distance = distance;
    });
  }*/

  @override
  // ignore: duplicate_ignore
  Widget build(BuildContext context) {
    TextEditingController controllerDAddress = TextEditingController( text: widget.desti_address);
    TextEditingController controllerDEmail = TextEditingController(text: widget.email);
    // ignore: no_leading_underscores_for_local_identifiers, unused_local_variable
    final _formKey = GlobalKey<FormState>();
    // ignore: avoid_print
    controllerDTime.text =
        "${selectedTime1.hour.toString().padLeft(2, '0')}:${selectedTime1.minute.toString().padLeft(2, '0')} ${selectedTime1.period.toString().split('.')[1]}";
      
    return SafeArea(
      child: Scaffold(
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
        title: BigText(text: "Destination Point")
      ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                OrderTextField(
                  control: controllerDAddress, 
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
                OrderTextField(
                  control: controllerDEmail, 
                  hint: 'Email', 
                  icon: Icons.phone, 
                  max: 1, 
                  min: 1, 
                  type: TextInputType.emailAddress, 
                  valid: (String? value){
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PriceCalculate(category: widget.category, weight:  widget.weight, pic_address: widget.pic_address, p_time: widget.pic_time, pic_lat: widget.pic_lat, pic_lng: widget.pic_lng, desti_address: widget.desti_address, desti_time: controllerDTime.text, desti_lat: widget.desti_lat, desti_lng: widget.desti_lng, email: widget.email, pic_Instruct: widget.pic_Instruct, pic_Mobno: widget.pic_Mobno, pic_Name: widget.pic_Name, pic_Smobno: widget.pic_Smobno, desti_Instruct: controllerDInstr.text, desti_Smobno: controllerDSecondMobileNo.text, desti_name: controllerDNameOfPC.text, deti_Mobno: controllerDMobileNo.text)));
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
  Widget bottomSheet() {
    return  FractionallySizedBox(
      heightFactor: 0.75,
      child: DestinationUi(category: widget.category, weight: widget.weight, pic_address: widget.pic_address, pic_time: widget.pic_time, pic_lat: widget.pic_lat, pic_lng: widget.pic_lng, pic_Instruct: widget.pic_Instruct, pic_Mobno: widget.pic_Mobno, pic_Name: widget.pic_Name, pic_Smobno: widget.pic_Smobno, email: widget.email,),
    );
  }
}
