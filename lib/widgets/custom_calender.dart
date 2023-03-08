import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travelzilla_dubai_flutter/widgets/hotel_app_theme.dart';

class CustomCalender extends StatefulWidget {
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;
  final Function(DateTime, DateTime)? startEndDateChange;
  const CustomCalender(
      {Key? key,
      this.initialStartDate,
      this.initialEndDate,
      this.startEndDateChange,
      this.minimumDate,
      this.maximumDate})
      : super(key: key);

  @override
  State<CustomCalender> createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  List<DateTime> dateList = <DateTime>[];
  DateTime currentMonthDate = DateTime.now();
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    setListOfDate(currentMonthDate);
    if (widget.initialStartDate != null) {
      startDate = widget.initialStartDate;
    }
    if (widget.initialEndDate != null) {
      endDate = widget.initialEndDate;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setListOfDate(DateTime monthDate) {
    dateList.clear();
    final DateTime newDate = DateTime(monthDate.year, monthDate.month, 0);
    if (newDate.weekday < 7) {
      final previousMonthDay = newDate.weekday;
      for (int i = 1; i <= previousMonthDay; i++) {
        dateList.add(newDate.subtract(Duration(days: previousMonthDay - i)));
      }
    }

    for (int i = 1; i <= monthDate.day; i++) {
      dateList.add(newDate.add(Duration(days: i + 1)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 4, bottom: 4),
            child: Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    border: Border.all(
                        color: HotelAppTheme.buildLightTheme()!.dividerColor),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      onTap: () {
                        setState(() {
                          currentMonthDate =
                              currentMonthDate.subtract(Duration(days: 30));
                          setListOfDate(currentMonthDate);
                        });
                      },
                      child:
                          Icon(Icons.keyboard_arrow_left, color: Colors.black),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    DateFormat('MMMM yyyy').format(currentMonthDate),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    border: Border.all(
                        color: HotelAppTheme.buildLightTheme()!.dividerColor),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      onTap: () {
                        setState(() {
                          currentMonthDate =
                              currentMonthDate.add(Duration(days: 30));
                          setListOfDate(currentMonthDate);
                        });
                      },
                      child:
                          Icon(Icons.keyboard_arrow_right, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
