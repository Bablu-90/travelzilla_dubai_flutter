import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:travelzilla_dubai_flutter/getx_controllers/restaurant_controller.dart';
import 'package:travelzilla_dubai_flutter/screens/map_screen.dart';

class RestaurantDetails extends StatefulWidget {
  final String address;
  final String placename;
  final String description;
  final List<String> assetPath;

  const RestaurantDetails(
      {Key? key,
      required this.assetPath,
      required this.address,
      required this.placename,
      required this.description})
      : super(key: key);

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  late CarouselSliderController _sliderController;
  GlobalKey<_RestaurantDetailsState> _sliderkey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildImage(String assetPath, int index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          color: Colors.grey.shade200,
          width: double.infinity,
          child: Image.asset(assetPath, fit: BoxFit.cover),
        );

    RestaurantScreenController restaurantScreenController = Get.put(
        RestaurantScreenController(
            placename: widget.placename,
            description: widget.description,
            address: widget.address));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          widget.placename,
          style: TextStyle(
              fontFamily: 'Desolate',
              fontSize: 20,
              color: Color.fromARGB(200, 28, 32, 98)),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(4.0)),
          Expanded(
              child: CarouselSlider.builder(
                  key: _sliderkey,
                  controller: _sliderController,
                  unlimitedMode: true,
                  enableAutoSlider: false,
                  slideBuilder: (index) {
                    final assetPath =
                        restaurantScreenController.assetPath[index];
                    return buildImage(assetPath, index);
                  },
                  autoSliderTransitionCurve: Curves.easeInOutExpo,
                  itemCount: restaurantScreenController.assetPath.length)),
          Text(
            widget.address,
            style: TextStyle(
                color: Colors.grey, fontFamily: 'Desolate', fontSize: 21.0),
          ),
          Container(
            width: Get.size.width - 50,
            child: Text(widget.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Desolate-light',
                    fontSize: 16,
                    color: Colors.black)),
          ),
          SizedBox(height: 80),
          Expanded(
              flex: 0,
              child: Container(
                width: Get.size.width - 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.deepPurple.shade400,
                ),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  onPressed: () {
                    Get.to(MapScreen(), transition: Transition.downToUp);
                  },
                  child: Text(
                    'Location',
                    style: TextStyle(
                        fontFamily: 'Desolate',
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
