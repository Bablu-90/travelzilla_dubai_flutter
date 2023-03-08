import 'package:flutter/material.dart';
import 'package:travelzilla_dubai_flutter/widgets/hotel_app_theme.dart';

class RangeSliderView extends StatefulWidget {
  final Function(RangeValues)? onChangeRangeValues;
  final RangeValues? values;
  const RangeSliderView({Key? key, this.values, this.onChangeRangeValues})
      : super(key: key);

  @override
  State<RangeSliderView> createState() => _RangeSliderViewState();
}

class _RangeSliderViewState extends State<RangeSliderView> {
  RangeValues? values;

  @override
  void initState() {
    values = widget.values;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: values!.start.round(),
                  child: SizedBox(),
                ),
                Container(
                  width: 54,
                  child: Text(
                    '\$${values!.start.round()}',
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1000 - values!.start.round(),
                  child: SizedBox(),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: values!.end.round(),
                  child: SizedBox(),
                ),
                Container(
                  width: 54,
                  child: Text(
                    '\$${values!.end.round()}',
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1000 - values!.end.round(),
                  child: SizedBox(),
                ),
              ],
            )
          ],
        ),
        SliderTheme(
            data:
                SliderThemeData(rangeThumbShape: RoundRangeSliderThumbShape()),
            child: RangeSlider(
                values: values!,
                min: 0.0,
                max: 1000.0,
                activeColor: HotelAppTheme.buildLightTheme()!.primaryColor,
                inactiveColor: Colors.grey.withOpacity(0.4),
                divisions: 1000,
                onChanged: (RangeValues values) {
                  values = values;
                  widget.onChangeRangeValues!(values);
                }))
      ]),
    );
  }
}
