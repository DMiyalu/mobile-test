import 'package:flutter/material.dart';

Widget actionButton(context, {bool? uppercaseText: false, Color? 
  bkgColor, Color? textColor, required String? text, required Function? onTap}) {
  return TextButton(
    style: ButtonStyle(
      alignment: Alignment.center,
      fixedSize: MaterialStateProperty.all(Size.fromWidth(MediaQuery.of(context).size.width - 20)),
      backgroundColor:
          MaterialStateProperty.all(bkgColor ?? Theme.of(context).primaryColor),
      padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
    ),
    onPressed: () => onTap!,
    child: Text(
      uppercaseText! ? text!.toUpperCase() : text!,
      style:
          Theme.of(context).textTheme.bodyText1!.copyWith(color: textColor!),
    ),
  );
}