import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelzilla_dubai_flutter/screens/search_screen.dart';

class AppBarHome extends StatefulWidget {
  const AppBarHome({Key? key}) : super(key: key);

  @override
  State<AppBarHome> createState() => _AppBarHomeState();
}

class _AppBarHomeState extends State<AppBarHome> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(45.0))),
      backgroundColor: Colors.deepPurpleAccent.shade200,
      centerTitle: true,
      title: Image.asset(
        'assets/images/Travelzillalogo.PNG',
        width: MediaQuery.of(context).size.width / 2,
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () {
              Get.to(SearchScreen(), transition: Transition.circularReveal);
            },
            icon: Icon(Icons.search, color: Colors.black))
      ],
    );
  }
}
