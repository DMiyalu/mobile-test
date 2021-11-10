import 'package:flutter/material.dart';
import 'package:mobile_test/widgets/rangeslider/custom_slider_thumb_circle.dart';

class CustomSliderTheme extends StatelessWidget {
  final Widget? child;

  const CustomSliderTheme({
    @required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double thumbRadius = 14;
    const double tickMarkRadius = 8;

    final labels = ['0 km', '100 km', '200 km', '300 km', '+400 km'];
    final int min = 0;
    final int max = labels.length - 1;

    final activeColor = Color.fromRGBO(255, 0, 77, 1);
    final inactiveColor = Color.fromRGBO(109, 114, 120, 1);

    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 5,

        /// Thumb
        thumbShape: CustomSliderThumbCircle(
                      thumbRadius: thumbRadius,
                      min: min,
                      max: max,
                    ),

        /// Tick Mark
        rangeTickMarkShape:
            RoundRangeSliderTickMarkShape(tickMarkRadius: tickMarkRadius),

        /// Inactive
        inactiveTickMarkColor: inactiveColor,
        inactiveTrackColor: inactiveColor,

        /// Active
        thumbColor: activeColor,
        activeTrackColor: activeColor,
        activeTickMarkColor: activeColor,
      ),
      child: child!,
    );
  }
}