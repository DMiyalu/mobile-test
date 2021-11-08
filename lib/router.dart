import 'package:get/get.dart';
import 'package:mobile_test/screens/home/home.dart';
import 'package:mobile_test/screens/market/market.dart';
import 'package:mobile_test/screens/results/results.dart';

List<GetPage<dynamic>>? getPages() {
  return [
    GetPage(name: '/', page: () => Home(), transition: Transition.cupertino),
    GetPage(name: '/results', page: () => Results(),
        transition: Transition.cupertino),
    GetPage(name: '/market', page: () => Market(),
        transition: Transition.cupertino),
  ];
}