
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pickrun_new_client_app/models/user_model.dart';
import 'package:pickrun_new_client_app/pages/home_page.dart';
import 'package:pickrun_new_client_app/pages/register.dart';
import 'package:pickrun_new_client_app/utils/colors.dart';
import 'package:pickrun_new_client_app/utils/dimensions.dart';
import 'package:pickrun_new_client_app/widgets/big_text.dart';
import 'package:pickrun_new_client_app/widgets/button_widget.dart';
import 'package:pickrun_new_client_app/widgets/small_text.dart';
import 'package:pickrun_new_client_app/widgets/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // ignore: unused_element
   Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LoginLogic(),
      ),
    );
  }
}

class LoginLogic extends StatefulWidget {
  const LoginLogic({Key? key}) : super(key: key);

  @override
  State<LoginLogic> createState() => _LoginLogicState();
}

class _LoginLogicState extends State<LoginLogic> {
  bool _isObscure = true;
  // form key

  final _formKey = GlobalKey<FormState>();

  //editing controller

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  UserModel loggedInUser = UserModel();

  // string for displaying the error Message
  String? errorMessage;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: Dimensions.height10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin:  EdgeInsets.only(top: Dimensions.height30),
                    height: Dimensions.height300,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/Login-bro.png"))),
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(height: Dimensions.height10),
                Container(
                  margin: EdgeInsets.only(left: Dimensions.left1, right: Dimensions.left1),
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 5, color: AppColors.bordercolor),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(2.0, 2.0),
                            color: AppColors.shadow)
                      ]),
                  height: 450,
                  width: 500,
                  child: Column(
                    children: [
                      // ignore: prefer_const_constructors
                      Padding(padding: EdgeInsets.only(top: 10)),
                      BigText(text: "User Login"),
                      const SizedBox(
                        height: 24,
                      ),
                      // ignore: prefer_const_constructors
                      Padding(padding: EdgeInsets.only(left: 5)),
                      Text_field_widget(
                        text: "Enter the Email",
                        edit_controller: _emailController, 
                        type: TextInputType.emailAddress, 
                        valid: (value)
                        {
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
                        saved: (value)
                        {
                          _emailController.text = value!;
                        },
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(height: 25),
                      const Padding(padding: EdgeInsets.only(left: 5)),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.only(left: 35),
                          child: SmallText(text: "Enter the password", size: 16, weight: FontWeight.w800, color: Colors.grey,)
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
                              return ("Password is required for login");
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
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.only(right: 25),
                          child: SmallText(text: "Forgot Password ?", weight: FontWeight.bold, size: 18, color: Colors.orange,),
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Button_Widget(text: "Login", btn_width: 260, pressed: (){signIn();})],
                        ),
                      ),
                      const SizedBox(height: 23),
                      // ignore: prefer_const_constructors
                      Padding(padding: EdgeInsets.only(left: 5)),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: const EdgeInsets.only(left: 35),
                          child: Row(
                            children: [
                              SmallText(text: "Didn't have account ?", color: Colors.grey, weight: FontWeight.w800, size: 18,),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                                },
                                child: SmallText(text: "Click Here", weight: FontWeight.bold, size: 18, color: Colors.orange,),
                              ),
                            ],
                          ),
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
  // Login Function
  static Future<User?> loginusingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        Fluttertoast.showToast(msg: "No user Found with this Email Address");
      }
    }
    return user;
  }

  Future<void> signIn() async {
    if (_formKey.currentState!.validate()) {
      User? user = await loginusingEmailPassword(
          email: _emailController.text,
          password: _passwordController.text,
          context: context);
      if (user != null) {
        try {
          // ignore: unused_local_variable
          CollectionReference db =
              FirebaseFirestore.instance.collection('users');
          FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get()
              .then((value) {
            loggedInUser = UserModel.fromMap(value.data());
            // ignore: unrelated_type_equality_checks
            if (loggedInUser.uid == []) {
              Fluttertoast.showToast(msg: "Malpractice found");
            } else {
              Fluttertoast.showToast(msg: "Login Successful");
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Home_Page()));
            }
          });
        } on FirebaseAuthException catch (e) {
          print(e.message);
        }
      }
    }
  }
  
}
