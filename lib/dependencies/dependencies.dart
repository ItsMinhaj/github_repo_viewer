import 'package:get/get.dart';
import 'package:github_repo_viewer/controller/user_controller/user_controller.dart';
import '../controller/show_reop_controller/show_repo_controller.dart';

class UserControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
  }
}

class HomeControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShowRepoController());
  }
}
