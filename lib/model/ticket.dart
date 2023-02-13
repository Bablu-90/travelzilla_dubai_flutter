class FlightTicketsWidget {
  final String title;
  final String fromDate;
  final String fromTime;
  final String arriveDate;
  final String arriveTime;
  final String origin;
  final String destination;
  final String elapsedTime;
  bool isRunning;

  FlightTicketsWidget(
      {required this.title,
      required this.fromTime,
      required this.fromDate,
      required this.arriveDate,
      required this.arriveTime,
      required this.destination,
      required this.elapsedTime,
      required this.isRunning,
      required this.origin});
}
