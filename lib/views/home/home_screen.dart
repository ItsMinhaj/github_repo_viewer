import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:github_repo_viewer/views/details/details_screen.dart';

import '../../controller/show_reop_controller/show_repo_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final showRepoController = Get.find<ShowRepoController>();
    //  final ThemeController themeController = Get.find();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("All Repos"),
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.list)),
            Tab(icon: Icon(Icons.grid_on)),
          ]),
        ),
        body: TabBarView(
          children: [
            Obx(
              () {
                return ListView.builder(
                  itemCount: showRepoController.repoList.length,
                  itemBuilder: (context, index) {
                    final data = showRepoController.repoList;
                    return showRepoController.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(showRepoController
                                  .repoList[index].owner.avatarUrl),
                            ),
                            title: Text(data[index].name),
                            subtitle: Text(
                              "visibility: ${data[index].visibility}",
                              style: TextStyle(fontSize: 11.sp),
                            ),
                            trailing: SizedBox(
                              width: 100.w,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star_border_outlined,
                                    color: Colors.amber,
                                    size: 20.h,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    data[index].stargazersCount.toString(),
                                    style: TextStyle(fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Get.to(DetailsScreen(
                                  repoList:
                                      showRepoController.repoList[index]));
                            },
                          );
                  },
                );
              },
            ),
            Obx(() {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: showRepoController.repoList.length,
                  itemBuilder: (context, index) {
                    final data = showRepoController.repoList;

                    return InkWell(
                      onTap: () {
                        Get.to(DetailsScreen(
                            repoList: showRepoController.repoList[index]));
                      },
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30.r,
                              backgroundImage: NetworkImage(showRepoController
                                  .repoList[index].owner.avatarUrl),
                            ),
                            SizedBox(height: 4.h),
                            Text(data[index].name)
                          ],
                        ),
                      ),
                    );
                  });
            })
          ],
        ),
      ),
    );
  }
}
