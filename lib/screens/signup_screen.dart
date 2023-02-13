import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelzilla_dubai_flutter/getx_controllers/auth_screen_controller.dart';
import 'package:travelzilla_dubai_flutter/screens/home_screen.dart';
import 'package:travelzilla_dubai_flutter/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthScreenController authScreenController = Get.put(AuthScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 400,
                width: 350,
                padding: EdgeInsets.only(top: 80.0),
                child: Image(
                    image: AssetImage("assets/images/Travelzillalogo.PNG")),
              )
            ],
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.4,
                left: 35,
                right: 35,
              ),
              child: Form(
                key: authScreenController.userName,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: authScreenController.signUpNameController,
                      validator: (value) {
                        if (value == null) {
                          return 'Please Enter Full Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Full Name',
                          fillColor: Colors.white70,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0))),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: authScreenController.signUpEmailController,
                      validator: (value) {
                        if (value == null) {
                          return 'Please enter correct E-mail Id';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'E-MAIL ID',
                          fillColor: Colors.white70,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)))),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller:
                          authScreenController.signUpPhoneNumberController,
                      validator: (value) {
                        if (value == null) {
                          return 'Please enter valid Phone Number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        fillColor: Colors.white70,
                        filled: true,
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: authScreenController.signUpPasswordController,
                      validator: (value) {
                        if (value == null) {
                          return 'Please Enter Password';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          fillColor: Colors.white70,
                          filled: true,
                          hintText: 'Password',
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)))),
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (authScreenController.userName.currentState!
                                .validate()) {
                              Get.to(HomeScreen(),
                                  transition: Transition.rightToLeftWithFade);
                            } else {
                              Get.showSnackbar(GetSnackBar(
                                title: 'Processing Data',
                                backgroundColor: Colors.lightBlueAccent,
                                snackPosition: SnackPosition.BOTTOM,
                              ));
                            }
                          },
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            maximumSize: Size(320.0, 60.0),
                            minimumSize: Size(170.0, 60.0),
                            primary: Colors.blueGrey.shade200,
                            shape: StadiumBorder(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already Have an Account ??"),
                        SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(LoginScreen(),
                                transition: Transition.circularReveal);
                          },
                          child: Text(
                            'Log In',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
