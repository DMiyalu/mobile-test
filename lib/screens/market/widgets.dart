import 'package:flutter/material.dart';
import 'package:mobile_test/widgets/custom_button.dart';

Widget form(context, formKey) {
  return Form(
    key: formKey,
    child: Column(
      children: <Widget>[
        _inputField(context,
            labelText: 'Qual o CEP da sua propriedade rural?',
            placeholder: '18550-002',
            bottomText:
                'Com o CEP localizaremos armazens proximos para entrega',
            suffixIcon: Icon(Icons.done,
                color: Theme.of(context).primaryColor, size: 12)),
        SizedBox(height: 35),
        _distance(context),
        SizedBox(height: 35),
        _inputField(context,
            labelText: 'Quantas sacas deseja vender?',
            bottomText: '',
            placeholder: '100',
            suffixIcon: Icon(Icons.done,
                color: Theme.of(context).primaryColor, size: 12)),
        SizedBox(height: 25),
        _inputField(context,
            labelText: 'Qual o periodo de entrega?',
            placeholder: '28/02/2020',
            bottomText:
                'A soja devera ser entregue no amazem dentro do periodo',
            suffixIcon: Icon(Icons.calendar_today,
                color: Theme.of(context).primaryColorLight, size: 12)),
        SizedBox(height: 35),
        _validationButton(context, formKey)
      ],
    ),
  );
}

Widget _distance(context) {
  double entryPoint = 40;
  RangeValues _currentRangeValues = new RangeValues(0, entryPoint);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Até qual distancia voce levaria sua soja?',
          textAlign: TextAlign.left),
      Text('Defina o raio maximo em quilometros',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 10, fontWeight: FontWeight.w400),
          textAlign: TextAlign.left),
      SizedBox(height: 8),
      RangeSlider(
        values: _currentRangeValues,
        min: 0,
        max: 100,
        divisions: 4,
        activeColor: Theme.of(context).primaryColor,
        inactiveColor: Theme.of(context).primaryColorLight,
        labels: RangeLabels(
          _currentRangeValues.start.round().toString(),
          _currentRangeValues.end.round().toString(),
        ),
        onChanged: (RangeValues values) {
          _currentRangeValues = values;
          // setState(() {
          //   _currentRangeValues = values;
          // });
        },
      )
    ],
  );
}

Widget _inputField(context,
    {String? labelText,
    String? placeholder,
    String? bottomText,
    Widget? suffixIcon}) {
  return TextFormField(
    decoration: InputDecoration(
        labelText: labelText!,
        labelStyle: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontSize: 12, color: Theme.of(context).primaryColorLight),
        border: _inputFieldBorderStyle(context),
        errorBorder: _inputFieldBorderStyle(context),
        enabledBorder: _inputFieldBorderStyle(context),
        disabledBorder: _inputFieldBorderStyle(context),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        counter: _counterText(context, bottomText!),
        hintText: placeholder!,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: Colors.black, fontSize: 13),
        suffixIcon: suffixIcon),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Campo obrigatório';
      }
      return null;
    },
  );
}

OutlineInputBorder _inputFieldBorderStyle(context) {
  return OutlineInputBorder(
      borderSide:
          BorderSide(color: Theme.of(context).primaryColorLight, width: 1),
      gapPadding: 4.5);
}

Widget _counterText(context, String? text) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Text(text!,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 10,
            ),
        textAlign: TextAlign.left,
        softWrap: true),
  );
}

Widget _validationButton(context, formKey) {
  return actionButton(
    context,
    text: 'Cotar',
    bkgColor: Theme.of(context).primaryColor,
    textColor: Colors.white,
    onTap: () {
      if (formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Processing Data')),
        );
      }
    },
  );
}
