import 'package:flutter/material.dart';
import 'package:mobile_test/widgets/custom_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _leadingImage(context),
              _leadingText(context),
            ],
          ),
        ),
      ),
      floatingActionButton: _bottom(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

Widget _leadingImage(context) {
  return Container(
    height: MediaQuery.of(context).size.height / 2,
    width: MediaQuery.of(context).size.width,
    alignment: Alignment.center,
    child: Image(
      image: AssetImage("assets/images/img2.jpeg"),
      fit: BoxFit.cover,
    ),
  );
}

Widget _leadingText(context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        Text(
          'Parabens pelo negocio!',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Theme.of(context).accentColor,
              ),
        ),
        SizedBox(height: 20),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'O seu contrato',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(),
            children: <TextSpan>[
              _hintTextSpan(context, '#123456789'),
              TextSpan(text: ' foi gerado com successono dia'),
              _hintTextSpan(context, ' 19/12/2020, as 15h.')
            ],
          ),
        ),
        SizedBox(height: 20),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Voce pode acompanhar a sua venda a qualquer momento no',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(),
            children: <TextSpan>[
              _hintTextSpan(context, 'Historico de Negociaçoes')
            ],
          ),
        ),
      ],
    ),
  );
}

TextSpan _hintTextSpan(context, String text) {
  return TextSpan(
    text: text,
    style: Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(color: Theme.of(context).hintColor),
  );
}

Widget _bottom(context) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        actionButton(context, text: "ir para historico de negociaçoes",
          textColor: Colors.white,
          bkgColor: Theme.of(context).primaryColor, onTap: (){}),
        actionButton(context, text: "Voltar para pagina inicial",
          textColor: Theme.of(context).primaryColor,
          uppercaseText: true,
          bkgColor: Colors.white, onTap: (){}),
      ],
    ),
  );
}