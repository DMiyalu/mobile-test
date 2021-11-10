import 'package:flutter/material.dart';
import 'package:mobile_test/utils.dart';

class RangeSliderLabelWidget extends StatefulWidget {
  RangeSliderLabelWidget({Key? key}) : super(key: key);

  @override
  _RangeSliderLabelWidgetState createState() => _RangeSliderLabelWidgetState();
}

class _RangeSliderLabelWidgetState extends State<RangeSliderLabelWidget> {
  RangeValues values = RangeValues(10, 70);
  RangeValues valuesBottom = RangeValues(0, 2);

  @override
  Widget build(BuildContext context) => SliderTheme(
        data: SliderThemeData(
          /// ticks in between
          activeTickMarkColor: Colors.transparent,
          inactiveTickMarkColor: Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSliderBottomLabel(),
          ],
        ),
      );

  Widget buildSliderBottomLabel() {
    final labels = ['0 km', '100 km', '200 km', '300 km', '+400 km'];
    final double min = 0;
    final double max = labels.length - 1.0;
    final divisions = (max - min).toInt();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RangeSlider(
          values: valuesBottom,
          min: min,
          max: max,
          divisions: divisions,
          onChanged: (values) => setState(() => this.valuesBottom = values),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: Utils.modelBuilder(
              labels,
              (index, String? label) {
                final selectedColor = Colors.black;
                final unselectedColor = Theme.of(context).primaryColorLight;
                final isSelected =
                    index >= valuesBottom.start && index <= valuesBottom.end;
                final color = isSelected ? selectedColor : unselectedColor;

                return buildLabel(label: label);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLabel({
    @required String? label,
  }) =>
      Text(
        label!,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 8, fontWeight: FontWeight.w400
        ),
      );
}
