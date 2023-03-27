import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:pickrun_new_client_app/models/user_model.dart';
import 'package:pickrun_new_client_app/pages/login_page.dart';
import 'package:pickrun_new_client_app/utils/colors.dart';
import 'package:pickrun_new_client_app/widgets/big_text.dart';
import 'package:pickrun_new_client_app/widgets/button_widget.dart';
import 'package:pickrun_new_client_app/widgets/text_field_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isObscure = true;
  final _auth = FirebaseAuth.instance;

  //form key
  final _formKey = GlobalKey<FormState>();

  // string for displaying the error Message
  String? errorMessage;

  //editing controller

  // ignore: unused_field
  final TextEditingController _uidController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          // ignore: prefer_const_constructors
          padding: EdgeInsets.only(top: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    height: 300,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/Mobile login-bro.png"))),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.only(left: 1, right: 1),
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 5, color: AppColors.bordercolor),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        const BoxShadow(
                            offset: Offset(2.0, 2.0), color: AppColors.shadow)
                      ]),
                  height: 600,
                  width: 500,
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      BigText(text: "Create Account", size: 24,),
                      const SizedBox(
                        height: 24,
                      ),

                      //Name Field

                      const Padding(padding: EdgeInsets.only(left: 5)),
                      Text_field_widget(
                        text: "Enetr the Name", 
                        edit_controller: _firstNameController, 
                        valid: (value){
                          RegExp regex = RegExp(r'^.{2,}$');

                            if (value!.isEmpty) {
                              return ("Please Enter your Name");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter Valid Name(Min. 2 Character)");
                            }
                            return null;
                        }, 
                        saved: (value){
                           _firstNameController.text = value!;
                        }, 
                        type: TextInputType.text),
                      
                      const SizedBox(height: 25),
                      // Mob Field
                      const Padding(padding: EdgeInsets.only(left: 5)),
                      Text_field_widget(
                        text: "Enter the Mobile Number", 
                        edit_controller: _phoneController, 
                        valid: (value)
                        {
                          RegExp regex = RegExp(r'^[6-9]\d{9}$');
                          if (value!.isEmpty) {
                            return ("Please Enter the Mobile No.");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Enter Valid Mobile Number");
                          }
                          return null;
                        }, 
                        saved: (value){
                          _phoneController.text = value!;
                        }, 
                        type: TextInputType.phone),
                      
                      const SizedBox(height: 25),

                      // City Field

                      const Padding(padding: EdgeInsets.only(left: 5)),
                      Text_field_widget(
                        text: "Enter the city", 
                        edit_controller: _cityController, 
                        valid: (value){
                          RegExp regex = RegExp(r'^.{2,}$');

                            if (value!.isEmpty) {
                              return ("Please Enter your City");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter Valid City (Min. 2 Character)");
                            }
                            return null;
                        }, 
                        saved: (value){
                          _cityController.text = value!;
                        }, 
                        type: TextInputType.text,),
                      
                      const SizedBox(height: 25),

                      // Email Field

                      const Padding(padding: EdgeInsets.only(left: 5)),
                      Text_field_widget(
                        text: "Enter the Email", 
                        edit_controller: _emailController, 
                        valid: (value){
                          if (value!.isEmpty) {
                              return ("Please Enter your Email");
                            }
                            //reg expression for email
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please Enter the valid Email");
                            }
                            return null;
                        },
                        saved: (value){
                          _emailController.text = value!;
                        }, 
                        type: TextInputType.emailAddress),
                      const SizedBox(height: 25),

                      // Password Field

                      const Padding(padding: EdgeInsets.only(left: 5)),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.only(left: 35),
                          child: const Text(
                            "Enter the Password",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                      // SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.only(left: 35, right: 35),
                        child: TextFormField(
                          autofocus: false,
                          controller: _passwordController,
                          validator: (value) {
                            RegExp regex = RegExp(r'^.{6,}$');

                            if (value!.isEmpty) {
                              return ("Please Enter your Password");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter Valid Password(Min. 6 Character)");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _passwordController.text = value!;
                          },
                          autovalidateMode: AutovalidateMode.always,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Button_Widget(text: "Create Account", btn_width: 260, pressed: (){signUp(_emailController.text, _passwordController.text);})],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirebase()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
      }
    }
  }

  postDetailsToFirebase() async {
    // calling firestore
    // calling user model
    // sending the values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    //writing all values

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstname = _firstNameController.text;
    userModel.mobno = _phoneController.text;
    userModel.city = _cityController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(
        msg: "Account Created Successfully!! \n Login Now !!!");
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false);
  }
}
