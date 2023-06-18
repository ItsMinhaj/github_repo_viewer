import 'package:get/get.dart';
import 'package:github_repo_viewer/controller/user_controller/user_controller.dart';
import '../../../services/fetch_repo.dart';
import '../../model/reposityor_model.dart';
import '../../widgets/error_show_dialog.dart';

class ShowRepoController extends GetxController {
  final userController = Get.find<UserController>();
  final isLoading = false.obs;
  final repoList = <RepositoryModel>[].obs;

  Future<void> fetchAllRepo() async {
    isLoading(true);

    final result = await RemoteServices.fetchRepo(userController.user.value);

    isLoading(false);
    result.fold((error) async => await errorShowDialog(error), (repoData) {
      repoList.assignAll(repoData);
    });
  }

  @override
  void onInit() async {
    await fetchAllRepo();
    super.onInit();
  }
}
