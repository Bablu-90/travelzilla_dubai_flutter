import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:travelzilla_dubai_flutter/getx_controllers/bottom_navigation_controller.dart';
import 'package:travelzilla_dubai_flutter/screens/hotelbooking_screen.dart';
import 'package:travelzilla_dubai_flutter/screens/map_screen.dart';
import 'package:travelzilla_dubai_flutter/screens/restaurant_screen.dart';
import 'package:travelzilla_dubai_flutter/widgets/appbar_home.dart';
import 'package:travelzilla_dubai_flutter/widgets/drawer.dart';
import 'package:travelzilla_dubai_flutter/widgets/flight_ticket.dart';
import 'package:travelzilla_dubai_flutter/widgets/tourist_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());
  RxBool _isloading = false.obs;
  final screens = [
    HomeScreen(),
    RestaurantScreen(),
    HotelBookingScreen(),
    MapScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(builder: (context) {
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, Get.height / 12),
            child: AppBarHome()),
        bottomNavigationBar: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 3, vertical: 3.0),
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent.shade100,
              borderRadius: BorderRadius.all(Radius.circular(80)),
              boxShadow: [
                BoxShadow(
                  spreadRadius: -10,
                  blurRadius: 50,
                  color: Colors.black.withOpacity(.4),
                  offset: Offset(0, 20),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
              child: GNav(
                tabs: [
                  GButton(
                    gap: bottomNavigationController.gap,
                    iconActiveColor: Colors.black,
                    iconColor: Colors.black,
                    textColor: Colors.black,
                    backgroundColor: Colors.deepPurpleAccent.withOpacity(.2),
                    iconSize: 24,
                    padding: bottomNavigationController.padding,
                    icon: Icons.local_airport_rounded,
                    text: 'Flights',
                    onPressed: () {
                      Get.to(FlightTicket(),
                          transition: Transition.rightToLeft);
                    },
                  ),
                  GButton(
                    gap: bottomNavigationController.gap,
                    iconActiveColor: Colors.blueAccent,
                    iconColor: Colors.black,
                    textColor: Colors.black,
                    backgroundColor: Colors.blueAccent.withOpacity(.2),
                    iconSize: 24,
                    padding: bottomNavigationController.padding,
                    icon: LineIcons.map,
                    text: 'Location',
                    onPressed: () {
                      Get.to(MapScreen(), transition: Transition.leftToRight);
                    },
                  ),
                  GButton(
                    gap: bottomNavigationController.gap,
                    iconActiveColor: Colors.deepOrangeAccent,
                    iconColor: Colors.black,
                    textColor: Colors.black,
                    backgroundColor: Colors.deepOrangeAccent.withOpacity(.2),
                    iconSize: 24,
                    padding: bottomNavigationController.padding,
                    icon: Icons.restaurant_outlined,
                    text: 'Food',
                    onPressed: () {
                      Get.to(RestaurantScreen(),
                          transition: Transition.downToUp);
                    },
                  ),
                  GButton(
                    gap: bottomNavigationController.gap,
                    iconActiveColor: Colors.green,
                    iconColor: Colors.black,
                    textColor: Colors.black,
                    backgroundColor: Colors.green.withOpacity(.2),
                    iconSize: 24,
                    padding: bottomNavigationController.padding,
                    icon: LineIcons.hotel,
                    text: 'Hotels',
                    onPressed: () {
                      Get.to(HotelBookingScreen(),
                          transition: Transition.upToDown);
                    },
                  ),
                ],
                selectedIndex: bottomNavigationController.selectedIndex(),
                onTabChange: (index) {
                  bottomNavigationController.selectedIndex = index.obs;
                },
              ),
            ),
          ),
        ),
        body: _isloading.value
            ? PageView.builder(
                onPageChanged: (screens) {
                  setState(() {
                    bottomNavigationController.selectedIndex = screens.obs;
                  });
                },
                itemBuilder: (context, position) {
                  return Container(color: Color(position));
                },
                /*controller: ,*/
              )
            : TouristCard(),
        drawer: DrawerPage(),
      );
    });
  }
}
