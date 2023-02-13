import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelzilla_dubai_flutter/getx_controllers/flight_ticket_widget_controller.dart';
import 'package:travelzilla_dubai_flutter/model/ticket.dart';
import 'package:travelzilla_dubai_flutter/screens/qr_scan_screen.dart';
import 'package:travelzilla_dubai_flutter/widgets/ticket_separator.dart';

class FlightBookingScreen extends StatefulWidget {
  const FlightBookingScreen({Key? key}) : super(key: key);

  @override
  State<FlightBookingScreen> createState() => _FlightBookingScreenState();
}

class _FlightBookingScreenState extends State<FlightBookingScreen> {
  FlightTicketWidgetController flightTicketWidgetController =
      Get.put(FlightTicketWidgetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade300,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 200,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
            ),
          ),
          Positioned(
              top: 48,
              left: 16,
              right: 16,
              bottom: 48,
              child: SizedBox(
                height: Get.height / 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Itneraries",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.local_airport_rounded,
                              color: Colors.deepPurple.shade600,
                            ))
                      ],
                    ),
                    Container(
                      height: 58,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: const Center(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Search...",
                              hintStyle: TextStyle(fontSize: 20),
                              icon: Icon(Icons.search),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount:
                                flightTicketWidgetController.ticketItems.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              FlightTicketsWidget ticket =
                                  flightTicketWidgetController
                                      .ticketItems[index];
                              bool isRunning = ticket.isRunning ?? false;
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                      () => QrScanScreen(
                                          flightTicketsWidget: ticket),
                                      transition: Transition.fadeIn);
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ticket.title ?? "UNKNOWN",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                ticket.fromDate ?? "UNKNOWN",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                ticket.arriveDate ?? "UNKNOWN",
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 48,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                ticket.origin ?? "UNKNOWN",
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Expanded(
                                                  child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                child: Stack(
                                                  children: [
                                                    const Positioned(
                                                      right: 0,
                                                      bottom: 0,
                                                      top: 0,
                                                      left: 0,
                                                      child: TicketSeparator(
                                                        height: 2,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    AnimatedPositioned(
                                                        right: 0,
                                                        bottom: 0,
                                                        top: 0,
                                                        left: 0,
                                                        child: RotatedBox(
                                                          quarterTurns: 1,
                                                          child: Icon(
                                                            Icons.flight,
                                                            color: isRunning
                                                                ? Colors
                                                                    .redAccent
                                                                    .shade700
                                                                : Colors
                                                                    .black54,
                                                          ),
                                                        ),
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    150)),
                                                    const Positioned(
                                                        left: 0,
                                                        bottom: 0,
                                                        top: 0,
                                                        child: CircleAvatar(
                                                          radius: 4,
                                                          backgroundColor:
                                                              Colors.black,
                                                        )),
                                                    Positioned(
                                                        right: 0,
                                                        bottom: 0,
                                                        top: 0,
                                                        child: CircleAvatar(
                                                          radius: 4,
                                                          backgroundColor:
                                                              Colors.deepPurple
                                                                  .shade300,
                                                        )),
                                                  ],
                                                ),
                                              )),
                                              Text(
                                                ticket.origin ?? "UNKNOWN",
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              ticket.fromTime ?? "UNKNOWN",
                                              style:
                                                  const TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              ticket.elapsedTime ?? "UNKNOWN",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              ticket.arriveTime ?? "UNKNOWN",
                                              style:
                                                  const TextStyle(fontSize: 12),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
