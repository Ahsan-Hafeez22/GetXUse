import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/data/responses/status.dart';
import 'package:getxproject/model/home/user_list_model.dart';
import 'package:getxproject/res/component/alert_dialog_box.dart';
import 'package:getxproject/res/component/general_exception.dart';
import 'package:getxproject/res/component/internet_exception_widget.dart';
import 'package:getxproject/res/route/routes_name.dart';
import 'package:getxproject/view_model/controller/home/home_view_model.dart';
import 'package:getxproject/view_model/controller/user_preference/user_pref.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel homeVM = Get.put(HomeViewModel());
  UserListModel userListModel = UserListModel();
  UserPref userPref = UserPref();
  @override
  void initState() {
    super.initState();
    homeVM.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Home Screen"),
        actions: [
          IconButton.filled(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) => CustomAlertDialogBox(
                        title: 'Alert',
                        des: 'Do you really want to log out?',
                        onPressOK: () {
                          userPref.removeUser().then((value) {
                            Get.offAllNamed(RoutesName.loginView);
                          });
                        },
                      ));
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Obx(() {
        switch (homeVM.rxRequestStatus.value) {
          case Status.LOADING:
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          case Status.COMPLETED:
            return ListView.builder(
              itemCount: homeVM.rxUserList.value.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: homeVM.rxUserList.value.data![index].avatar
                          .toString(),
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundImage: imageProvider,
                      ),
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const CircleAvatar(
                        child: Icon(Icons.error),
                      ),
                    ),
                    title: Text(
                      homeVM.rxUserList.value.data![index].firstName.toString(),
                    ),
                    subtitle: Text(
                      homeVM.rxUserList.value.data![index].email.toString(),
                    ),
                  ),
                );
              },
            );
          case Status.ERROR:
            // return Text('Error');
            log("error value: ${homeVM.error.value}");
            if (homeVM.error.value ==
                "Internet Error: No Internet Connection") {
              return InternetExceptionWidget(
                onpress: () {
                  homeVM.refreshUserListApi();
                },
              );
            } else {
              return GeneralException(
                onpress: () => homeVM.refreshUserListApi(),
              );
            }
        }
      }),
    );
  }
}
