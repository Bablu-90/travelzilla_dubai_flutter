import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class PlaceDetailScreenController extends GetxController {
  final String address;
  final String placename;
  final String description;
  RxBool _isPlaying = true.obs;
  RxList<String> assetPath = [
    "assets/images/burj khalifa.jpg",
    "assets/images/museum of the future outlook 2.png",
    "assets/images/dubai frame 2.png",
    "assets/images/global village 1.png",
    "assets/images/dubai mall 3.png",
    "assets/images/LA-MER beach outlook view 2.png",
    "assets/images/PALM-JUMERAH BEACH outlook view 1.png",
    "assets/images/dubai aquarium inside view 4.png",
    "assets/images/dubai miracle garden 2.jpg",
    "assets/images/deep dive dubai 2.png",
  ].obs;

  PlaceDetailScreenController(
      {required this.address,
      required this.placename,
      required this.description,
      required this.assetPath});
}
