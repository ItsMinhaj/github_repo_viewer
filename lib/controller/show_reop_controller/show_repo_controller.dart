import 'package:get/get.dart';
import 'package:github_repo_viewer/controller/user_controller/user_controller.dart';
import '../../../services/fetch_repo.dart';
import '../../model/reposityor_model.dart';
import '../../utils/error_show_dialog.dart';

class ShowRepoController extends GetxController {
  final userController = Get.put(UserController());
  final isLoading = false.obs;
  final repoList = <RepositoryModel>[].obs;

  final isDarkActive = false.obs;
  void toggle() {
    isDarkActive.value = !isDarkActive.value;
  }

  Future<void> fetchAllRepo() async {
    isLoading(true);

    final result = await RemoteServices.fetchRepo(userController.user.value);

    isLoading(false);
    result.fold((error) async => await errorShowDialog(error), (repoData) {
      repoList.assignAll(repoData);
    });
  }

  void sortByDate(){
    repoList.sort((a,b)=> a.createdAt.compareTo(b.createdAt));
  }

  void sortByName(){
    repoList.sort((a,b)=> a.name.compareTo(b.name));
  }

  @override
  void onInit() async {
    await fetchAllRepo();
    super.onInit();
  }
}
