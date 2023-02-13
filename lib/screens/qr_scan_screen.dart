import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:travelzilla_dubai_flutter/model/ticket.dart';

class QrScanScreen extends StatefulWidget {
  FlightTicketsWidget? flightTicketsWidget;

  QrScanScreen({Key? key, required this.flightTicketsWidget}) : super(key: key);

  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  final dm = Barcode.qrCode();
  String svg = "";

  @override
  void initState() {
    super.initState();
    svg = dm.toSvg("test");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Center(
                        child: Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ),
                  ),
                  Center(
                    child: Text("Swipe Down To See Your Details"),
                  ),
                ],
              ),
            ),
            flex: 2,
          ),
          Expanded(
              flex: 8,
              child: Stack(
                children: [
                  Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      right: 0,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            color: Colors.grey[200],
                          )),
                        ],
                      )),
                  Positioned(
                      left: 0,
                      top: 64,
                      bottom: 64,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "My Tickets",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            height: 200,
                            width: 200,
                            child:
                                SvgPicture.string(svg, fit: BoxFit.scaleDown),
                          ),
                          SizedBox(height: 24),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 24),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${widget.flightTicketsWidget?.origin ?? "UNKNOWN"}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                        child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                            left: 0,
                                            right: 0,
                                            top: 0,
                                            bottom: 0,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: List.generate(
                                                  15,
                                                  (index) => Icon(
                                                        Icons
                                                            .arrow_right_outlined,
                                                        color:
                                                            Colors.indigoAccent,
                                                      )),
                                            )),
                                        Positioned(
                                            child: Center(
                                          child: RotatedBox(
                                            quarterTurns: 1,
                                            child: Icon(
                                              Icons.flight_outlined,
                                              color: Colors.indigoAccent,
                                            ),
                                          ),
                                        ))
                                      ],
                                    )),
                                    Text(
                                      "${widget.flightTicketsWidget?.destination ?? "UNKNOWN"}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Oman",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      "Al Ain",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 48),
                          Container(
                            height: 48,
                            width: 240,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Center(
                              child: Text(
                                "Book Now>>>>",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ))
        ],
      )),
    );
  }
}
