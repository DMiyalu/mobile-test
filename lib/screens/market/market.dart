import 'package:flutter/material.dart';
import 'package:mobile_test/screens/results/widgets.dart';
import 'package:mobile_test/widgets/header.dart';

class Market extends StatelessWidget {
  const Market({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, 'Informaçoes de venda'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title(context),
              subtitle(context),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}