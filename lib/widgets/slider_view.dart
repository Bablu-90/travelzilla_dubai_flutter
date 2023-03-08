import 'package:flutter/material.dart';
import 'package:travelzilla_dubai_flutter/widgets/hotel_app_theme.dart';

class SliderView extends StatefulWidget {
  final Function(double)? onChangedistValue;
  final double? distValue;
  const SliderView({Key? key, this.onChangedistValue, this.distValue})
      : super(key: key);

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  double distValue = 50.0;

  @override
  void initState() {
    distValue = widget.distValue!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(flex: distValue.round(), child: SizedBox()),
              Container(
                width: 170,
                child: Text(
                  '${(distValue / 10).toStringAsFixed(1)}km',
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(flex: (100 - distValue).round(), child: SizedBox()),
            ],
          ),
          SliderTheme(
              data: SliderThemeData(thumbShape: CustomThumbShape()),
              child: Slider(
                  min: 0,
                  max: 100,
                  activeColor: HotelAppTheme.buildLightTheme()!.primaryColor,
                  inactiveColor: Colors.grey.withOpacity(0.4),
                  divisions: 100,
                  value: distValue,
                  onChanged: (double value) {
                    distValue = value;
                    widget.onChangedistValue!(distValue);
                  }))
        ],
      ),
    );
  }
}

class CustomThumbShape extends SliderComponentShape {
  static double thumbSize = 3.0;
  static double disabledThumbSize = 3.0;
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return isEnabled
        ? Size.fromRadius(thumbSize)
        : Size.fromRadius(disabledThumbSize);
  }

  final Animatable<double> sizeTween =
      Tween<double>(begin: disabledThumbSize, end: thumbSize);

  @override
  void paint(PaintingContext context, Offset thumbcenter,
      {required Animation<double>? activationAnimation,
      required Animation<double>? enableAnimation,
      required bool? isDiscrete,
      required TextPainter? labelPainter,
      required RenderBox? parentBox,
      required SliderThemeData? sliderTheme,
      required TextDirection? textDirection,
      required double? value,
      required double? textScaleFactor,
      required Size? sizeWithOverflow}) {
    final Canvas canvas = context.canvas;
    final ColorTween colorTween = ColorTween(
      begin: sliderTheme?.disabledThumbColor,
      end: sliderTheme?.thumbColor,
    );
    canvas.drawPath(
        Path()
          ..addOval(Rect.fromPoints(
              Offset(thumbcenter.dx - 12, thumbcenter.dy - 12),
              Offset(thumbcenter.dx + 12, thumbcenter.dy + 12)))
          ..fillType = PathFillType.evenOdd,
        Paint()
          ..color = Colors.black.withOpacity(0.5)
          ..maskFilter =
              MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(8)));

    final Paint cPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 14 / 2
      ..style = PaintingStyle.stroke;
  }

  double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }
}
