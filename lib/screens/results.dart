import 'package:flutter/material.dart';
import 'package:mobile_test/widgets/header.dart';

class Results extends StatelessWidget {
  const Results({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, 'Resultado das Cotaçoes'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(context),
              _subtitle(context),
              // _switchCase(context),
              // _shoppingCart(context)
            ],
          ),
        ),
      ),
    );
  }
}

Widget _title(context) {
  return Text(
    'Ofertas de Vendas',
    style: Theme.of(context).textTheme.headline6!.copyWith(
      color: Theme.of(context).accentColor,
    ),
    textAlign: TextAlign.left,
  );
}


Widget _subtitle(context) {
  return Text(
    'Preencha os dados da sua fazenda e do seu produto pra gente encontrar as melhores ofertas',
    style: Theme.of(context).textTheme.bodyText1!,
    textAlign: TextAlign.left,
  );
}
