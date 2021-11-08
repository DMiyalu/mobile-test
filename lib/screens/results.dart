import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_test/widgets/custom_button.dart';
import 'package:mobile_test/widgets/effects.dart';
import 'package:mobile_test/widgets/header.dart';

class Results extends StatefulWidget {
  const Results({Key? key}) : super(key: key);

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> with TickerProviderStateMixin {
  bool isActive = false;
  // late AnimationController controller;

  // @override
  // void initState() {
  //   controller = AnimationController(
  //     vsync: this,
  //     duration: const Duration(seconds: 3),
  //   )..addListener(() {
  //       setState(() {});
  //     });
  //   controller.repeat(reverse: true);
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  _onTapSelectCase() {
    setState(() {
      this.isActive = !this.isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, 'Resultado das Cotaçoes'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(context),
              _subtitle(context),
              SizedBox(height: 25),
              _switchCaseWidget(context,
                  isActive: this.isActive, onTapSelectCase: _onTapSelectCase),
              SizedBox(height: 25),
              _shoppingCart(context, cart: {
                'title': 'Top Agro',
                'distance': '37 km',
                'date': '13/08/2020',
                'subtotal': '98,00',
                'total': '12.915,00'
              }),
              SizedBox(height: 8),
              _marketCart(context, market: {
                'title': 'Tech Insumos',
                'distance': '37 km',
                'date': '13/08/2020',
                'subtotal': '98,00',
                'total': '12.915,00',
                'duration': '02:45',
              }),
              SizedBox(height: 8),
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

Widget _switchCaseWidget(context,
    {bool? isActive, required Function onTapSelectCase}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Ordenar por', style: Theme.of(context).textTheme.bodyText1),
      SizedBox(width: 10),
      Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                width: 1,
                color: Theme.of(context).accentColor,
              )),
          child: Row(
            children: [
              _selectCase(context,
                  isActive: isActive,
                  text: 'Distançia',
                  onTapSelectCase: onTapSelectCase),
              _selectCase(context,
                  isActive: !isActive!,
                  text: 'Preço',
                  onTapSelectCase: onTapSelectCase),
            ],
          )),
    ],
  );
}

Widget _selectCase(context,
    {String? text, bool? isActive, required Function onTapSelectCase}) {
  return AnimatedContainer(
    width: 92.0,
    duration: Duration(milliseconds: 300),
    alignment: Alignment.center,
    color: isActive! ? Colors.white : Theme.of(context).accentColor,
    child: Ink(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: InkWell(
        onTap: () => onTapSelectCase(),
        child: Text(
          text!,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: isActive ? Theme.of(context).accentColor : Colors.white,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}

Widget _shoppingCart(context, {required Map<String, dynamic>? cart}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
            width: 1,
            color: Theme.of(context).primaryColorLight.withOpacity(.2)),
        color: Colors.white,
        boxShadow: [boxShadow(context)]),
    child: Column(
      children: [
        SizedBox(height: 15),
        _head(context, cart: cart),
        _bottom(context, cart: cart),
        SizedBox(height: 8),
      ],
    ),
  );
}

Widget _logo(context, {required String? imagePath}) {
  return Container(
    width: 50,
    height: 35,
    alignment: Alignment.center,
    padding: EdgeInsets.only(left: 3),
    child: Image(
        image: AssetImage(imagePath!),
        width: 35,
        height: 35,
        fit: BoxFit.cover),
  );
}

Widget _head(context, {required Map<String, dynamic>? cart}) {
  return Flex(
    direction: Axis.horizontal,
    children: [
      _logo(context, imagePath: 'assets/images/agro1.jpg'),
      SizedBox(width: 10),
      Expanded(
        child: Text(cart!['title'],
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Theme.of(context).hintColor,
                fontSize: 14,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.left),
      ),
      SizedBox(
        width: 110,
        height: 35,
        child: Align(
          alignment: Alignment(1.0, 1.0),
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text('Valor sugerido',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context).primaryColorLight,
                    fontSize: 9.0,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.end),
          ),
        ),
      )
    ],
  );
}

Widget _bottom(context, {required Map<String, dynamic>? cart}) {
  return Flex(
    direction: Axis.horizontal,
    children: [
      SizedBox(
        width: 50,
        height: 40,
        child: Align(
          alignment: Alignment(0.3, 0.3),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColorLight.withOpacity(.2)),
            child: Text(
              cart!['distance'],
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context).primaryColorLight,
                    fontSize: 8,
                  ),
            ),
          ),
        ),
      ),
      SizedBox(width: 10),
      RichText(
        text: TextSpan(
          text: 'Data de pagamento\n',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Theme.of(context).primaryColorLight, fontSize: 9),
          children: <TextSpan>[
            TextSpan(
                text: cart['date'],
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 10, fontWeight: FontWeight.w500))
          ],
        ),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(right: 10),
          child: RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
              text: "R\$ ${cart['subtotal']}",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Theme.of(context).accentColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w600),
              children: <TextSpan>[
                TextSpan(
                    text: '  por saca\n',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).hintColor)),
                TextSpan(
                    text: "R\$ ${cart['total']}  total",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).hintColor)),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _marketCart(context, {required Map<String, dynamic>? market}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
            width: 1,
            color: Theme.of(context).primaryColorLight.withOpacity(.2)),
        color: Colors.white,
        boxShadow: [boxShadow(context)]),
    child: Column(
      children: [
        SizedBox(height: 15),
        _headMarket(context, market: market),
        SizedBox(height: 8),
        _markertFirstDetails(context),
        SizedBox(height: 8),
        _marketSecondDetails(context),
        SizedBox(height: 8),
        _marketThirdDetails(context),
        SizedBox(height: 10),
        _marketPaymentButton(context),
        SizedBox(height: 5),
        _suggestions(context),
        SizedBox(height: 8),
      ],
    ),
  );
}

Widget _suggestions(context) {
  return Center(
    child: Text(
      'Valor sujetto à taxas e encargos',
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context).primaryColorLight,
                    fontSize: 9.0,
                    fontStyle: FontStyle.italic)
    ),
  );
}

Widget _marketPaymentButton(context) {
  return Flex(
    direction: Axis.horizontal,
    children: [
      Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 5),
          padding: EdgeInsets.only(right: 10),
          child: RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
              text: "R\$ 93,00",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Theme.of(context).accentColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
              children: <TextSpan>[
                TextSpan(
                    text: '  por saca\n',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).hintColor)),
                TextSpan(
                    text: "R\$ 9.300,00  total",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).hintColor)),
              ],
            ),
          ),
        ),
      ),
      Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 5, right: 15),
          child: actionButton(
            context,
            text: 'Vender',
            textColor: Colors.white,
            bkgColor: Theme.of(context).primaryColor,
            onTap: () => Get.bottomSheet(
              _bottomInfos(context),
              backgroundColor: Colors.black,
              elevation: 2,
              enableDrag: true,
              exitBottomSheetDuration: Duration(milliseconds: 600),
              isDismissible: true,
            ),
          ),
        ),
      )
    ],
  );
}

Widget _bottomInfos(context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    child: Row(
      children: [
        Icon(Icons.nearby_error,
            color: Theme.of(context).primaryColorLight, size: 10),
        SizedBox(width: 10),
        Text('No vender encontrar',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.white)),
      ],
    ),
  );
}

Widget _marketSecondDetails(context) {
  return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
              width: 1,
              color: Theme.of(context).primaryColorLight.withOpacity(.15))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.room, size: 15, color: Theme.of(context).hintColor),
          SizedBox(width: 7),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Local de entrega",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 8),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      child: Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context)
                                .primaryColorLight
                                .withOpacity(.2)),
                        child: Text(
                          '55 km',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Theme.of(context).primaryColorLight,
                                    fontSize: 8,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text: "R. Eugenio Vasconcelos, n°21\n",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColorLight,
                        fontSize: 10),
                    children: <TextSpan>[
                      TextSpan(text: 'CEP 18550-000 - Safezal / MG')
                    ],
                  ),
                ),
              ]),
        ],
      ));
}

Widget _marketThirdDetails(context) {
  return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
              width: 1,
              color: Theme.of(context).primaryColorLight.withOpacity(.15))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.event, size: 15, color: Theme.of(context).hintColor),
          SizedBox(width: 7),
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              text: "Data de entrega\n",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Theme.of(context).primaryColorLight, fontSize: 8),
              children: <TextSpan>[
                TextSpan(
                    text: '02/10/2020 a 22/10/2020',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColorLight)),
              ],
            ),
          ),
        ],
      ));
}

Widget _markertFirstDetails(context) {
  return Flex(direction: Axis.horizontal, children: [
    Expanded(
      child: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(left: 15, right: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                  width: 1,
                  color: Theme.of(context).primaryColorLight.withOpacity(.15))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.spa, size: 15, color: Theme.of(context).hintColor),
              SizedBox(width: 7),
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  text: "Quantidade\n",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context).primaryColorLight, fontSize: 8),
                  children: <TextSpan>[
                    TextSpan(
                        text: '100 sacas',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColorLight)),
                  ],
                ),
              ),
            ],
          )),
    ),
    Expanded(
      child: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(left: 5, right: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                  width: 1,
                  color: Theme.of(context).primaryColorLight.withOpacity(.15))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.payment, size: 15, color: Theme.of(context).hintColor),
              SizedBox(width: 7),
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  text: "Data do pagamento\n",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context).primaryColorLight, fontSize: 8),
                  children: <TextSpan>[
                    TextSpan(
                        text: '21/06/2020',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColorLight)),
                  ],
                ),
              ),
            ],
          )),
    )
  ]);
}

Widget _headMarket(context, {required Map<String, dynamic>? market}) {
  return Flex(
    direction: Axis.horizontal,
    children: [
      _logo(context, imagePath: 'assets/images/logo.png'),
      SizedBox(width: 10),
      Expanded(
        child: Text(market!['title'],
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Theme.of(context).hintColor,
                fontSize: 14,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.left),
      ),
      SizedBox(
        width: 110,
        height: 35,
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
            height: 12,
            width: 12,
            margin: EdgeInsets.only(right: 3),
            child: CircularProgressIndicator.adaptive(
                backgroundColor:
                    Theme.of(context).primaryColorLight.withOpacity(.4),
                strokeWidth: 2,
                value: 0.3,
                valueColor:
                    AlwaysStoppedAnimation(Theme.of(context).accentColor)),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(market['duration'],
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context).primaryColorLight,
                    fontSize: 11.0,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.end),
          ),
        ]),
      )
    ],
  );
}
