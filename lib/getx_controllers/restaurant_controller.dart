import 'package:get/get.dart';

class RestaurantScreenController extends GetxController {
  final String address;
  final String description;
  final String placename;
  RxBool isPlaying = true.obs;
  RxList<String> assetPath = [
    "assets/images/al ammor 1.png",
    "assets/images/aprons & hammers 1.png",
    "assets/images/Arabica 1.png",
    "assets/images/armani 2.png",
    "assets/images/bikanervala 1.png",
    "assets/images/Food park 2.png",
    "assets/images/scape.png",
    "assets/images/The pavilion 1.png",
    "assets/images/barishta 1.png",
    "assets/images/seagrill 1.png",
  ].obs;

  RestaurantScreenController(
      {required this.placename,
      required this.description,
      required this.address});
}
