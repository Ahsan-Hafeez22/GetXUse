import 'package:get/get.dart';
import 'package:getxproject/res/route/routes_name.dart';
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
        name: RoutesName.loginScreen,
        page: () => LoginView(),
        transition: Transition.rightToLeft,
      ),
      // GetPage(
      //   name: RoutesName.homeScreen,
      //   page: () => HomeScreen(),
      //   transition: Transition.leftToRight,
      // ),
    ];
  }
}
