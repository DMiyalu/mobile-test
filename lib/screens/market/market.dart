import 'package:flutter/material.dart';
import 'package:mobile_test/screens/market/widgets.dart';
import 'package:mobile_test/screens/results/widgets.dart';
import 'package:mobile_test/widgets/header.dart';

class Market extends StatefulWidget {
  const Market({ Key? key }) : super(key: key);

  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, 'Fazer Cotaçao'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title(context, text: 'Informaçoes de venda'),
              subtitle(context, text: 'Preencha os dados da sua fazenda e do seu produto pra gente encontrar as melhores ofertas'),
              SizedBox(height: 35),
              form(context, _formKey),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}