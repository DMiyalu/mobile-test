import 'package:flutter/material.dart';

Widget title(context, {required String? text}) {
  return Text(
    text!,
    style: Theme.of(context).textTheme.headline6!.copyWith(
          color: Theme.of(context).accentColor,
        ),
    textAlign: TextAlign.left,
  );
}

Widget subtitle(context, {required String? text}) {
  return Text(
    text!,
    style: Theme.of(context).textTheme.bodyText1!,
    textAlign: TextAlign.left,
  );
}