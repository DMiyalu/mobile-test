import 'package:flutter/material.dart';

BoxShadow boxShadow(context) {
  return BoxShadow(
    color: Theme.of(context).primaryColorLight.withOpacity(.1),
    spreadRadius: 1,
    blurRadius: 10,
    offset: Offset(0, 0),
  );
}