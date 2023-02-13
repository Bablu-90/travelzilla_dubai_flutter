import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelzilla_dubai_flutter/getx_controllers/auth_screen_controller.dart';

class AuthCard extends StatefulWidget {
  const AuthCard({Key? key}) : super(key: key);

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  AuthScreenController authScreenController = Get.put(AuthScreenController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        elevation: 8.0,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Form(
              key: authScreenController.userName,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: authScreenController.signUpEmailController,
                    decoration: InputDecoration(
                      labelText: 'E-Mail',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      }
                    },
                    onSaved: (value) {
                      authScreenController.authData['email'] = value.toString();
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    obscureText: true,
                    controller: authScreenController.signUpPasswordController,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 5) {
                        return 'Password is too short!';
                      }
                    },
                    onSaved: (value) {
                      authScreenController.authData['Password'] =
                          value.toString();
                    },
                  ),
                  /*if (authScreenController.authMode == AuthMode.Signup)*/
                  AnimatedContainer(
                    constraints: BoxConstraints(
                        minHeight:
                            authScreenController.authMode == AuthMode.Signup
                                ? 60
                                : 0,
                        maxHeight:
                            authScreenController.authMode == AuthMode.Signup
                                ? 120
                                : 0),
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInCirc,
                    child: FadeTransition(
                      opacity: authScreenController.opacityAnimation,
                      child: SlideTransition(
                        position: authScreenController.slideAnimation,
                        child: TextFormField(
                          controller:
                              authScreenController.signUpPasswordController,
                          enabled:
                              authScreenController.authMode == AuthMode.Signup,
                          decoration:
                              InputDecoration(labelText: 'Confirm Password'),
                          obscureText: true,
                          validator:
                              authScreenController.authMode == AuthMode.Signup
                                  ? (value) {
                                      if (value !=
                                          authScreenController
                                              .signUpPasswordController.text) {
                                        return 'Passwords do not match!';
                                      }
                                    }
                                  : null,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (authScreenController.isLoading.value)
                    CircularProgressIndicator()
                  else
                    ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(100, 30))),
                      onPressed: () {
                        authScreenController.submit();
                      },
                      child: Text(
                          authScreenController.authMode == AuthMode.Login
                              ? 'Login'
                              : 'Sign Up'),
                    ),
                  ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                    child: Text(
                        '${authScreenController.authMode == AuthMode.Login ? 'SignUp' : 'LOGIN'}INSTEAD'),
                    onPressed: authScreenController.switchAuthMode,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
