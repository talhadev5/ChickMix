import 'package:get/get.dart';
import '../../view/calculate/layers_feed.dart';
import 'routes_name.dart';
import '../../view/splash.dart';
import '../../view/home.dart';
import '../../view/onboarding.dart';
import '../../view/calculate/broiler_feed.dart';

class AppRoutes {
  static routes() => [
    GetPage(name: MyRouteName.splash, page: () => Splash()),
    GetPage(name: MyRouteName.onboarding, page: () => Onboarding()),
    GetPage(name: MyRouteName.home, page: () => Home()),
    GetPage(name: MyRouteName.broilerFeed, page: () => BroilerFeed()),
    GetPage(name: MyRouteName.layersFeed, page: () => LayersFeed()),
    ];
}
