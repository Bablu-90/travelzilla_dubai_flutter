import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:travelzilla_dubai_flutter/getx_controllers/search_places_controller.dart';
import 'package:travelzilla_dubai_flutter/screens/home_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late CarouselSliderController _sliderController;
  GlobalKey<_SearchScreenState> _sliderKey = GlobalKey();
  TextEditingController searchController = TextEditingController();
  SearchPlacesController searchPlacesController =
      Get.put(SearchPlacesController());

  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildImage(String imagePath, int index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          color: Colors.grey.shade100,
          width: double.infinity,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        );
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 380,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/dubai.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'What you would like to find?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    hintText: "Search For Places To Explore...",
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Desolate-regular'),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: CarouselSlider.builder(
                key: _sliderKey,
                controller: _sliderController,
                slideBuilder: (index) {
                  final imagePath = searchPlacesController.imagePath[index];
                  return _buildImage(imagePath, index);
                },
                autoSliderTransitionCurve: Curves.easeInOutCirc,
                slideTransform: StackTransform(),
                itemCount: searchPlacesController.imagePath.length),
          ),
          SizedBox(height: 30),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        leading: IconButton(
            onPressed: () {
              Get.to(HomeScreen(), transition: Transition.circularReveal);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
    );
  }
}
