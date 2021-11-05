import 'package:get/get.dart';
import 'package:mobile_test/screens/home.dart';
import 'package:mobile_test/screens/market.dart';
import 'package:mobile_test/screens/results.dart';

List<GetPage<dynamic>>? getPages() {
  return [
    GetPage(name: '/', page: () => Home(), transition: Transition.cupertino),
    GetPage(name: '/results', page: () => Results(),
        transition: Transition.cupertino),
    GetPage(name: '/market', page: () => Market(),
        transition: Transition.cupertino),
  ];
}