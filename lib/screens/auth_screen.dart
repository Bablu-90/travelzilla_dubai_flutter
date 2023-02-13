import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelzilla_dubai_flutter/getx_controllers/auth_screen_controller.dart';
import 'package:travelzilla_dubai_flutter/widgets/auth_card.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthScreenController authScreenController = Get.put(AuthScreenController());
    final transformConfig = Matrix4.rotationX(-8 * pi / 100);
    transformConfig.translate(-10.0);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromRGBO(100, 128, 215, 1).withOpacity(0.3),
                Color.fromRGBO(99, 168, 214, 1).withOpacity(0.2),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              stops: [0, 1],
            )),
          ),
          SingleChildScrollView(
            child: Container(
              height: Get.size.height,
              width: Get.size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 40.0),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 60.0),
                      transform: transformConfig,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.deepPurpleAccent.shade400,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Text(
                        'TravelZilla',
                        style: TextStyle(
                            color: Theme.of(context)
                                .accentTextTheme
                                .titleMedium!
                                .color,
                            fontSize: 40,
                            fontFamily: 'Desolate',
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: Get.size.width > 600 ? 2 : 1,
                    child: AuthCard(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
