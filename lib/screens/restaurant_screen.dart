import 'package:flutter/material.dart';
import 'package:travelzilla_dubai_flutter/widgets/restaurant_card.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              //Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          'RestaurantScreen',
          style: TextStyle(
              fontFamily: 'Desolate',
              fontSize: 20.0,
              color: Colors.black,
              fontStyle: FontStyle.normal),
        ),
      ),
      body: RestaurantCard(),
    );
  }
}
