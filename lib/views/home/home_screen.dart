import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/show_reop_controller/show_repo_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final showRepoController = Get.find<ShowRepoController>();
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
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: showRepoController.repoList.length,
                  itemBuilder: (context, index) {
                    final data = showRepoController.repoList;
                    return showRepoController.isLoading.value
                        ? const Center(child: Text("Loading..."))
                        : ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(showRepoController
                                  .repoList[index].owner.avatarUrl),
                            ),
                            title: Text(data[index].name),
                          );
                  },
                );
              }),
            ),
            Obx(() {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: showRepoController.repoList.length,
                  itemBuilder: (context, index) {
                    final data = showRepoController.repoList;
                    return Card(
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
                    );
                  });
            })
          ],
        ),
      ),
    );
  }
}
