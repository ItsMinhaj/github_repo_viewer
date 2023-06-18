import 'package:get/get.dart';
import 'package:github_repo_viewer/routes/app_routes.dart';
import '../dependencies/dependencies.dart';
import '../views/home/home_screen.dart';
import '../views/user/user_screen.dart';

class AppPages {
  AppPages._();
  static String initial = "/user/";

  static final pages = [
    GetPage(
      name: initial,
      page: () => const UserScreen(),
      binding: UserControllerBindings(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeControllerBindings(),
    ),
  ];
}
