import 'package:flutter/material.dart';

Widget title(context) {
  return Text(
    'Ofertas de Vendas',
    style: Theme.of(context).textTheme.headline6!.copyWith(
          color: Theme.of(context).accentColor,
        ),
    textAlign: TextAlign.left,
  );
}

Widget subtitle(context) {
  return Text(
    'Preencha os dados da sua fazenda e do seu produto pra gente encontrar as melhores ofertas',
    style: Theme.of(context).textTheme.bodyText1!,
    textAlign: TextAlign.left,
  );
}