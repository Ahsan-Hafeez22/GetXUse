import 'package:get/get.dart';
import 'package:getxproject/res/route/routes_name.dart';
import 'package:getxproject/view/home/home_view.dart';
import 'package:getxproject/view/login/login_view.dart';
import 'package:getxproject/view/splash_screen.dart';

class AppRoutes {
  static List<GetPage> appRoutes() {
    return [
      GetPage(
        name: RoutesName.splashScreen,
        page: () => SplashScreen(),
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: RoutesName.loginView,
        page: () => LoginView(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: RoutesName.homeView,
        page: () => HomeView(),
        transition: Transition.leftToRight,
      ),
    ];
  }
}
