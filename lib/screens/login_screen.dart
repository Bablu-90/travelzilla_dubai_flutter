import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelzilla_dubai_flutter/screens/home_screen.dart';
import 'package:travelzilla_dubai_flutter/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passwordController = TextEditingController();
  final userName = GlobalKey<FormState>();

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
                    image: AssetImage('assets/images/Travelzillalogo.PNG')),
                color: Colors.deepPurpleAccent.shade200,
              )
            ],
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: Get.size.height * 0.6,
                left: 35,
                right: 35,
              ),
              child: Form(
                key: userName,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value != 'clay1234') {
                          return 'Please enter correct Password!';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          )),
                    ),
                    SizedBox(height: 100.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            maximumSize: Size(320.0, 60.0),
                            minimumSize: Size(170.0, 60.0),
                            primary: Colors.blueGrey.shade200,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                          ),
                          onPressed: () {
                            if (userName.currentState!.validate()) {
                              Get.to(HomeScreen(),
                                  transition: Transition.rightToLeft);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('error'),
                                  backgroundColor: Colors.blueAccent,
                                ),
                              );
                            }
                          },
                          child: Center(
                            child: Text(
                              'LOG IN',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black87),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t Have An Account ??'),
                        SizedBox(
                          width: 15,
                        ),
                        InkWell(
                            onTap: () {
                              Get.to(SignUpScreen(),
                                  transition: Transition.upToDown);
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            )),
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
