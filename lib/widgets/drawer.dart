import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelzilla_dubai_flutter/screens/home_screen.dart';
import 'package:travelzilla_dubai_flutter/screens/login_screen.dart';
import 'package:travelzilla_dubai_flutter/screens/map_screen.dart';
import 'package:travelzilla_dubai_flutter/screens/profile_screen.dart';

class DrawerPage extends StatelessWidget {
  DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 2,
      child: Drawer(
        backgroundColor: Colors.grey.shade300,
        child: Column(
          children: <Widget>[
            Container(
              height: Get.height / 4,
              width: double.infinity,
              color: Theme.of(context).primaryColorDark,
              child: Text(
                'Welcome to Adventure!',
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            /*AppBar(
              title: const Text('Welcome To Adventure!'),
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
            const Divider(),*/
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return listItems[index];
                },
                itemCount: listItems.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> listItems = [
    ListTile(
      leading: const Icon(
        Icons.person_pin,
        color: Colors.teal,
      ),
      title: const Text(' My Profile'),
      onTap: () {
        Get.to(ProfileScreen(), transition: Transition.rightToLeft);
      },
    ),
    const Divider(color: Colors.black),
    ListTile(
      leading: const Icon(
        Icons.home_rounded,
        color: Colors.indigo,
      ),
      title: const Text('Home'),
      onTap: () {
        Get.to(() => const HomeScreen(),
            transition: Transition.leftToRightWithFade);
      },
    ),
    const Divider(
      color: Colors.black,
    ),
    ListTile(
      leading: const Icon(Icons.place, color: Colors.red),
      title: const Text('Manage Location'),
      onTap: () {
        Get.to(() => const MapScreen(), transition: Transition.upToDown);
      },
    ),
    const Divider(color: Colors.black87),
    ListTile(
      leading: const Icon(Icons.exit_to_app_outlined, color: Colors.lime),
      title: const Text('LogOut'),
      onTap: () {
        Get.back();
        Get.to(LoginScreen(), transition: Transition.leftToRightWithFade);
      },
    ),
  ];
}
