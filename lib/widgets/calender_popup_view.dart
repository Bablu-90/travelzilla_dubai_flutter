import 'package:flutter/material.dart';
import 'package:travelzilla_dubai_flutter/widgets/custom_calender.dart';
import 'package:travelzilla_dubai_flutter/widgets/hotel_app_theme.dart';
import 'package:intl/intl.dart';

class CalenderPopupView extends StatefulWidget {
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final bool barrierDismissible;
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;
  final Function(DateTime, DateTime)? onApplyClick;
  final Function()? onCancelClick;
  const CalenderPopupView(
      {Key? key,
      this.initialStartDate,
      this.initialEndDate,
      this.onApplyClick,
      this.onCancelClick,
      this.barrierDismissible = true,
      this.minimumDate,
      this.maximumDate})
      : super(key: key);

  @override
  State<CalenderPopupView> createState() => _CalenderPopupViewState();
}

class _CalenderPopupViewState extends State<CalenderPopupView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    if (widget.initialEndDate != null) {
      startDate = widget.initialStartDate;
    }
    if (widget.initialEndDate != null) {
      endDate = widget.initialEndDate;
    }
    animationController?.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AnimatedBuilder(
            animation: animationController!,
            builder: (BuildContext context, Widget? child) {
              return AnimatedOpacity(
                  opacity: animationController!.value,
                  duration: const Duration(milliseconds: 100),
                  child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onTap: () {
                        if (widget.barrierDismissible) {
                          Navigator.pop(context);
                        }
                      },
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: HotelAppTheme.buildLightTheme()!
                                  .backgroundColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24.0)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    offset: const Offset(4, 4),
                                    blurRadius: 8.0),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24.0)),
                                  highlightColor: Colors.transparent,
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  'From',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      fontSize: 16,
                                                      color: Colors.grey
                                                          .withOpacity(0.8)),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  startDate != null
                                                      ? DateFormat('EEE,dd,MMM')
                                                          .format(startDate!)
                                                      : '--/--',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 74,
                                            width: 1,
                                            color:
                                                HotelAppTheme.buildLightTheme()!
                                                    .dividerColor,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  'To',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      fontSize: 16,
                                                      color: Colors.grey
                                                          .withOpacity(0.8)),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  endDate != null
                                                      ? DateFormat('EEE,dd,MMM')
                                                          .format(endDate!)
                                                      : '--/--',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(height: 1),
                                      CustomCalender(
                                        minimumDate: widget.minimumDate,
                                        maximumDate: widget.maximumDate,
                                        initialStartDate:
                                            widget.initialStartDate,
                                        initialEndDate: widget.initialEndDate,
                                        startEndDateChange:
                                            (DateTime startDateData,
                                                DateTime endDateData) {
                                          setState(() {
                                            startDate = startDateData;
                                            endDate = endDateData;
                                          });
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 16,
                                            right: 16,
                                            bottom: 16,
                                            top: 8),
                                        child: Container(
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color:
                                                HotelAppTheme.buildLightTheme()!
                                                    .primaryColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(24.0)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.6),
                                                  offset: const Offset(4, 4),
                                                  blurRadius: 8.0),
                                            ],
                                          ),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(24.0)),
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () {
                                                if (widget.onApplyClick !=
                                                    null) {
                                                  widget.onApplyClick!(
                                                      startDate!, endDate!);
                                                }
                                                Navigator.pop(context);
                                              },
                                              child: Center(
                                                child: Text(
                                                  'Apply',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      )));
            }),
      ),
    );
  }
}
