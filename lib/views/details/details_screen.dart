import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_repo_viewer/config/constant.dart';
import 'package:github_repo_viewer/model/reposityor_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.repoList});
  final RepositoryModel repoList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Screen"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(repoList.owner.avatarUrl))),
                ),
                Text(repoList.name, style: TextStyle(fontSize: 28.sp)),
                Text(repoList.fullName, style: TextStyle(fontSize: 20.sp)),
                Text(repoList.url, style: TextStyle(fontSize: 16.sp)),
              ],
            ),
          ),
          const Text(
            description,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
