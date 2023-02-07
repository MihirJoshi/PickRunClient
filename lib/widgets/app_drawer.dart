import 'package:flutter/material.dart';
import 'package:pickrun_new_client_app/utils/colors.dart';

// ignore: camel_case_types
class App_Dreawer extends StatelessWidget {
  const App_Dreawer({super.key});

  @override
  Widget build(BuildContext context) {
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
                      //Navigator.pushNamed(context, MyRoutes.chat);
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
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
  }
}