import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:github_repo_viewer/config/validation_rules.dart';
import 'package:github_repo_viewer/controller/user_controller/user_controller.dart';
import 'package:github_repo_viewer/routes/app_routes.dart';

class UserScreen extends HookWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final userTextController = useTextEditingController();
    final userController = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formkey,
              child: TextFormField(
                controller: userTextController,
                decoration: const InputDecoration(
                  labelText: "User Name",
                  hintText: "Example:- itsMinhaj",
                  border: OutlineInputBorder(),
                ),
                validator: ValidationRules.regularField,
              ),
            ),
            SizedBox(height: 30.h),
            InkWell(
              onTap: () async {
                if (formkey.currentState!.validate()) {
                  await userController.fetchUser(
                      userName: userTextController.text);
                  if (userController.user.value.isNotEmpty) {
                    Get.toNamed(Routes.home);
                  }
                }
              },
              child: Obx(
                () => userController.isLoading.value
                    ? const CircularProgressIndicator()
                    : Ink(
                        width: 120.w,
                        height: 40.h,
                        color: Colors.deepPurple,
                        child: Center(
                          child: Text(
                            "Go",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.sp),
                          ),
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
