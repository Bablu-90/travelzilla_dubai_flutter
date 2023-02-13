import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketSeparator extends StatefulWidget {
  final double height;
  final Color color;

  const TicketSeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);

  @override
  State<TicketSeparator> createState() => _TicketSeparatorState();
}

class _TicketSeparatorState extends State<TicketSeparator> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final boxWidth = constraints.constrainWidth();
      final dashWidth = 4.0;
      final dashHeight = Get.height;
      final dashCount = (boxWidth / (2 * dashWidth)).floor();
      return Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            dashCount,
            (index) => SizedBox(
                  height: dashHeight,
                  width: dashWidth,
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.black)),
                )),
      );
    });
  }
}
