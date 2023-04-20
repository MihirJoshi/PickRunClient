import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pickrun_new_client_app/models/user_model.dart';
import 'package:pickrun_new_client_app/pages/item_select.dart';
import 'package:pickrun_new_client_app/pages/login_page.dart';
import 'package:pickrun_new_client_app/pages/order_history.dart';
import 'package:pickrun_new_client_app/pages/track_order.dart';
import 'package:pickrun_new_client_app/utils/colors.dart';
import 'package:pickrun_new_client_app/widgets/app_drawer.dart';
import 'package:pickrun_new_client_app/widgets/small_text.dart';
import 'package:pickrun_new_client_app/widgets/image_widget.dart';

// ignore: camel_case_types
class Home_Page extends StatefulWidget {
  String? users;
  Home_Page({super.key, this.users = ""});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  
  
  @override
  
  @override
  Widget build(BuildContext context) {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //List? isLoggedIn = [];
    print("Home Page Uid${widget.users}");
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: App_Dreawer(users: widget.users!,),
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
                          if(widget.users != " ")
                        {
                          print(widget.users);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TrackOrder(userUid: widget.users!,)));
                        }
                        else
                        {
                          _showLoginDialog(context);
                        }
                      }),
                        child: const Image_Widget(url: "assets/new_set2.png"),
                      ),
                      
                      const SizedBox(width: 28,),
                      InkWell(
                      onTap: (() {
                        if(widget.users != " ")
                        {
                          
                          print(widget.users);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OrderHistory(userUid: widget.users!,)));
                        }
                        else
                        {
                          _showLoginDialog(context);
                        }
                      }),

  child: const Image_Widget(url: "assets/new_set3.png"),
)

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
                      const SizedBox(width: 30,),
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
  Future<void> _showLoginDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Required'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Please log in to place an order.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Login'),
              onPressed: () {
                // Implement your login logic here
                //isLoggedIn = true;
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        );
      },
    );
  }
  
}