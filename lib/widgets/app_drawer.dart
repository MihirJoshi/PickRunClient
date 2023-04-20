import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pickrun_new_client_app/models/user_model.dart';
import 'package:pickrun_new_client_app/pages/chat.dart';
import 'package:pickrun_new_client_app/pages/home_page.dart';
import 'package:pickrun_new_client_app/utils/colors.dart';

// ignore: camel_case_types
class App_Dreawer extends StatefulWidget {
   String users;
   App_Dreawer({super.key, required this.users});

  @override
  State<App_Dreawer> createState() => _App_DreawerState();
}

class _App_DreawerState extends State<App_Dreawer> {
  UserModel? _user;
  void initState() {
  super.initState();
  _fetchActiveOrder(widget.users);
  
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
    }
  }
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.33,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0)),
          ),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 60,
              ),
              const Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.only(left: 25),
                  child: InkWell(
                    onTap: () {
                      //Navigator.pushNamed(context, MyRoutes.home_page);
                    },
                    // ignore: prefer_const_constructors
                    child: Icon(
                      Icons.home,
                      color: AppColors.iconcolor1,
                      size: 35,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                "Home",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.only(left: 25),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(email: _user!.email!, name: _user!.firstname!)));
                    },
                    child: Icon(
                      Icons.chat,
                      color: AppColors.iconcolor1,
                      size: 35,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                "Chat",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.only(left: 25),
                  child: InkWell(
                    onTap: () {
                      //Navigator.pushNamed(context, MyRoutes.itemselect);
                    },
                    child: Icon(
                      Icons.add_circle,
                      color: AppColors.iconcolor1,
                      size: 35,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                "New Order",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.only(left: 25),
                  child: InkWell(
                    onTap: () {
                      //Navigator.pushNamed(context, MyRoutes.order_sum);
                    },
                    child: Icon(
                      Icons.business_center,
                      color: AppColors.iconcolor1,
                      size: 35,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                "Orders",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.only(left: 25),
                  child: InkWell(
                    onTap: () {
                      //Navigator.pushNamed(context, MyRoutes.profile);
                    },
                    child: Icon(
                      Icons.person,
                      color: AppColors.iconcolor1,
                      size: 35,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                "Profile",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.only(left: 25),
                  child: Icon(
                    Icons.power_settings_new,
                    color: AppColors.mainColor,
                    size: 35,
                  ),
                ),
                onTap: () async{
                  await _auth.signOut();
                  Fluttertoast.showToast(msg: "Logout Successfully");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home_Page(users: " ",)));
                },
              ),
            ],
          ),
        ),
      );
  }
}