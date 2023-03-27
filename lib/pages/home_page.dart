import 'package:flutter/material.dart';
import 'package:pickrun_new_client_app/pages/item_select.dart';
import 'package:pickrun_new_client_app/utils/colors.dart';
import 'package:pickrun_new_client_app/widgets/app_drawer.dart';
import 'package:pickrun_new_client_app/widgets/small_text.dart';
import 'package:pickrun_new_client_app/widgets/image_widget.dart';

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
                  padding: const EdgeInsets.only(left: 90, top: 0),
                  height: 260,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/edited_header.png"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 150, left: 20),
                  child: SmallText(text: "Welcome...", size: 20, color: Colors.white,),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 190, left: 20),
                  child: SmallText(text: "Deliver when it counts .....", size: 22, color: Colors.white,),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 1, right: 1),
              decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(2.0, 2.0), color: AppColors.shadow)
                  ]),
              height: 540,
              width: 500,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 40, top: 50),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SmallText(text: "What are you looking for Today ?", size: 16, color: Colors.black,),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 32,),
                      InkWell(
                        onTap: (() {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const ItemSet()),
                          );
                        }),
                        child: const Image_Widget(url: "assets/new_set21.png"),
                      ),
                      const SizedBox(width: 30,),
                      InkWell(
                        onTap: (() {
                          /*Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => pickup()),
                          );*/
                        }),
                        child: const Image_Widget(url: "assets/new_set2.png"),
                      ),
                      
                      const SizedBox(width: 28,),
                      InkWell(
                        onTap: (() {
                          /*Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => pickup()),
                          );*/
                        }),
                        child: const Image_Widget(url: "assets/new_set3.png"),
                      ),
                    ],
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 20,
                  ),
                   Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(width: 30,),
                      SmallText(text: "New Order", size: 16, color: Colors.black,),
                      const SizedBox(width: 40,),
                      SmallText(text: "Track Order", size: 16, color: Colors.black,),
                      const SizedBox(width: 50,),
                      SmallText(text: "Orders", size: 16, color: Colors.black,),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SmallText(text: "Promo's Today", size: 16, color: Colors.black,)
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        height: 200,
                        width: 600,
                        decoration: const BoxDecoration(
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