import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelzilla_dubai_flutter/screens/auth_screen.dart';
import 'package:travelzilla_dubai_flutter/screens/login_screen.dart';
import 'package:travelzilla_dubai_flutter/screens/signup_screen.dart';

class AuthScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final GlobalKey<FormState> userName = GlobalKey<FormState>();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpNameController = TextEditingController();
  TextEditingController signUpPhoneNumberController = TextEditingController();
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  late Animation<double> opacityAnimation;

  @override
  void onInit() {
    super.onInit();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    slideAnimation = Tween<Offset>(begin: Offset(0, -1.5), end: Offset(0, 0))
        .animate(
            CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));

    opacityAnimation = Tween<double>(begin: 0, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final RxBool isLoading = false.obs;

  RxnString get userId {
    return userId;
  }

  Future<void> submit() async {
    if (!userName.currentState!.validate()) {
      return;
    }
    userName.currentState!.save();
    isLoading.value = true;

    if (authMode == AuthMode.Login) {
      AuthScreenController authScreenController = Get.find();
      await authScreenController
          .login(signUpEmailController.text, signUpPasswordController.text)
          .obs;
    } else {
      AuthScreenController authScreenController = Get.find();
      await authScreenController
          .signup(
            signUpEmailController.text,
            signUpPasswordController.text,
          )
          .obs;
    }
    isLoading.value = false;
  }

  AuthMode authMode = AuthMode.Login;
  RxMap<String, String> authData = {
    'email': '',
    'password': '',
  }.obs;

  Future<void> switchAuthMode() async {
    if (authMode == AuthMode.Login) {
      authMode = AuthMode.Signup;
      controller.forward();
    } else {
      authMode == AuthMode.Login;
      controller.reverse();
    }
  }

  Future<void> signup(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Get.to(() => SignUpScreen(), transition: Transition.downToUp);
      });
    } catch (e) {
      Get.snackbar('About SignUp', 'User SignUp message',
          backgroundColor: Colors.deepOrange.shade200,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            'Sign UP Failed',
            style: TextStyle(color: Colors.black54),
          ),
          messageText:
              Text(e.toString(), style: TextStyle(color: Colors.white54)));
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Get.to(() => LoginScreen(), transition: Transition.leftToRight);
      });
    } catch (e) {
      Get.snackbar('About Login', 'Login Message',
          backgroundColor: Colors.deepOrange.shade300,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            'Login Faild!!',
            style: TextStyle(color: Colors.black),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white54),
          ));
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut().then((value) {
      Get.offAll(() => AuthScreen());
    });
  }
}

enum AuthMode { Signup, Login }
