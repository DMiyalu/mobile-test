import 'package:flutter/material.dart';
import 'package:mobile_test/widgets/effects.dart';
import 'package:mobile_test/widgets/header.dart';

class Results extends StatefulWidget {
  const Results({Key? key}) : super(key: key);

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  bool isActive = false;

  Function? _onTapSelectCase() {
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
                  isActive: this.isActive, onTapSelectCase: _onTapSelectCase()),
              SizedBox(height: 25),
              _shoppingCart(context, cart: {
                'title': 'Top Agro',
                'distance': '37 km',
                'date': '13/08/2020',
                'subtotal': '98,00',
                'total': '12.915,00'
              })
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
    {bool? isActive, Function? onTapSelectCase}) {
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
    {String? text, bool? isActive, Function? onTapSelectCase}) {
  return AnimatedContainer(
    width: 92.0,
    duration: Duration(milliseconds: 300),
    alignment: Alignment.center,
    color: isActive! ? Colors.white : Theme.of(context).accentColor,
    child: Ink(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: InkWell(
        onTap: () => onTapSelectCase!(),
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
        SizedBox(height: 10),
        _head(context, cart: cart),
        _bottom(context, cart: cart),
        SizedBox(height: 5),
      ],
    ),
  );
}

Widget _logo(context) {
  return Container(
    width: 50,
    height: 35,
    alignment: Alignment.center,
    child: Image(
        image: AssetImage('assets/images/agro1.jpg'),
        width: 35,
        height: 35,
        fit: BoxFit.cover),
  );
}

Widget _head(context, {required Map<String, dynamic>? cart}) {
  return Flex(
    direction: Axis.horizontal,
    children: [
      _logo(context),
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
          alignment: Alignment(0.0, 0.3),
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
