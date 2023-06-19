import 'package:get/get.dart';
import 'package:github_repo_viewer/utils/error_show_dialog.dart';
import '../../services/fetch_user.dart';

class UserController extends GetxController {
  final isLoading = false.obs;
  final user = "".obs;

  Future<void> fetchUser({required String userName}) async {
    isLoading(true);
    final result = await RemoteServices.fetchUser(userName: userName);
    isLoading(false);
    result.fold(
      (error) async {
        isLoading(false);
        await errorShowDialog(error);
      },
      (data) {
        user.value = data.login!;
      },
    );
  }
}
