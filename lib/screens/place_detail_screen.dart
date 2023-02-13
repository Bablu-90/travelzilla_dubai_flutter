import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:travelzilla_dubai_flutter/getx_controllers/place_detail_screen_controller.dart';
import 'package:travelzilla_dubai_flutter/screens/map_screen.dart';

class PlaceDetailScreen extends StatefulWidget {
  final String address;
  final String placename;
  final String description;
  final List<String> assetPath;

  const PlaceDetailScreen(
      {Key? key,
      required this.address,
      required this.description,
      required this.assetPath,
      required this.placename})
      : super(key: key);

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  late CarouselSliderController sliderController;
  GlobalKey<_PlaceDetailScreenState> _sliderKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    sliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildImage(String assetPath, int index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          color: Colors.grey.shade200,
          width: double.infinity,
          child: Image.asset(assetPath, fit: BoxFit.cover),
        );

    PlaceDetailScreenController placeDetailScreenController =
        Get.put(PlaceDetailScreenController(
      address: widget.address,
      placename: widget.placename,
      description: widget.description,
      assetPath: widget.assetPath.obs,
    ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
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
          widget.placename,
          style: TextStyle(
              fontFamily: 'Desolate', fontSize: 22.0, color: Colors.black),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(4.0),
          ),
          Expanded(
            child: CarouselSlider.builder(
              key: _sliderKey,
              controller: sliderController,
              unlimitedMode: true,
              enableAutoSlider: false,
              slideBuilder: (index) {
                final assetPath = placeDetailScreenController.assetPath[index];
                return buildImage(assetPath, index);
              },
              autoSliderTransitionCurve: Curves.easeInOutBack,
              slideTransform: CubeTransform(
                  rotationAngle: 80, rightPageAlignment: Alignment.centerLeft),
              itemCount: placeDetailScreenController.assetPath.length,
            ),
          ),
          Text(
            widget.address,
            style: TextStyle(
                color: Colors.black, fontFamily: 'Desolate', fontSize: 21.0),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text(
              widget.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Desolate',
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 80.0),
          Expanded(
            flex: 0,
            child: Container(
              width: MediaQuery.of(context).size.width - 45.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.deepPurple.shade200,
              ),
              child: IconButton(
                onPressed: () {
                  Get.to(MapScreen(),
                      transition: Transition.leftToRightWithFade);
                },
                icon: Icon(Icons.location_on),
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GNav(
        tabs: [],
      ),
    );
  }
}
