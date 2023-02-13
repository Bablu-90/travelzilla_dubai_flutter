import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slider_button/slider_button.dart';
import 'package:travelzilla_dubai_flutter/screens/flight_booking_screen.dart';

class FlightTicket extends StatefulWidget {
  const FlightTicket({Key? key}) : super(key: key);

  @override
  State<FlightTicket> createState() => _FlightTicketState();
}

class _FlightTicketState extends State<FlightTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade300,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
              left: 16,
              right: 8,
              top: 84,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Easily book",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    "Flight",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "We can easily help you to find the",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    "Best Flight Experience",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              )),
          Positioned(
              left: 14,
              right: -10,
              top: 220,
              bottom: 180,
              child: RotatedBox(
                quarterTurns: 4,
                child: Image.asset("assets/images/emirates.png"),
              )),
          Positioned(
              left: 16,
              right: 16,
              bottom: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Swipe Right',
                    style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  SliderButton(
                    backgroundColor: Colors.deepPurpleAccent,
                    label: Text("Lets go>>"),
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    action: () {
                      Get.to(FlightBookingScreen(),
                          transition: Transition.rightToLeftWithFade);
                    },
                    height: 48,
                    width: 160,
                    buttonSize: 38,
                  )
                ],
              ))
        ],
      )),
    );
  }
}
