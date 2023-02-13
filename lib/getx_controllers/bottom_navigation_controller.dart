import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxList<Color> colors = [
    Colors.deepPurpleAccent,
    Colors.blueAccent,
    Colors.deepOrangeAccent,
    Colors.redAccent
  ].obs;
  double gap = 30;
  final padding = EdgeInsets.symmetric(horizontal: 25.0, vertical: 16);

  void changeSelectedIndex(int index) {
    selectedIndex = index.obs;
    update();
  }
}
