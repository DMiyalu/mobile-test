import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar header(context, String? title) {
  return AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    elevation: 0.0,
    leadingWidth: 30,
    leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(Icons.arrow_back,
            color: Theme.of(context).primaryColorLight, size: 18)),
    title: Text(
      title!,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
          color: Theme.of(context).hintColor,
          fontSize: 16,
          fontWeight: FontWeight.w500),
    ),
    centerTitle: true,
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_none_sharp,
              color: Theme.of(context).primaryColorLight, size: 18))
    ],
  );
}
