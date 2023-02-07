import 'package:flutter/material.dart';
import 'package:pickrun_new_client_app/utils/colors.dart';
import 'package:pickrun_new_client_app/widgets/app_drawer.dart';

// ignore: camel_case_types
class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const App_Dreawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              //alignment: Alignment.topRight,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 90, top: 0),
                  height: 260,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/edited_header.png"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 150, left: 20),
                  child: Text(
                    "Welcome...",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.only(top: 190, left: 20),
                  child: Text(
                    "Deliver when it counts .....",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 1, right: 1),
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(2.0, 2.0), color: AppColors.shadow)
                  ]),
              height: 540,
              width: 500,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40, top: 50),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "What are you looking for Today ?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 30)),
                      InkWell(
                        onTap: (() {
                          /*Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => pickup()),
                          );*/
                        }),
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    "assets/new_set21.png",
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 30)),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/new_set2.png",
                                ),
                                fit: BoxFit.cover)),
                      ),
                      Padding(padding: EdgeInsets.only(left: 30)),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/new_set3.png",
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(padding: EdgeInsets.only(left: 30)),
                      Text(
                        "New Order",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Padding(padding: EdgeInsets.only(left: 34)),
                      Text(
                        "Track Order",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Padding(padding: EdgeInsets.only(left: 40)),
                      Text(
                        "Orders",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Promo's Today",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        height: 200,
                        width: 600,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/boy.png"),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}