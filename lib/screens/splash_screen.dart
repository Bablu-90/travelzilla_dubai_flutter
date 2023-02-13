import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelzilla_dubai_flutter/screens/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 8)).then(
        (_) => {Get.to(() => AuthScreen(), transition: Transition.upToDown)});
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutCirc);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.deepPurpleAccent.shade200,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RotationTransition(
                    turns: animation,
                    alignment: Alignment(-1, -3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 82,
                          //width: 150,
                          child:
                              Image.asset('assets/icons/flying eagle png.png'),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          child: Image.asset(
                            "assets/images/Travelzillalogo.PNG",
                            fit: BoxFit.cover,
                          ),
                          width: 350,
                          height: 280,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 140.0,
                    color: Colors.white54,
                  ),
                  FadeTransition(
                    opacity: _controller,
                    child: Text(
                      'Welcome to Adventure',
                      style: TextStyle(
                          fontFamily: 'Desolate',
                          color: Colors.black54,
                          backgroundColor: Colors.deepPurpleAccent,
                          fontSize: 22),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
