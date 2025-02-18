import 'dart:developer';

import 'package:get/get.dart';
import 'package:getxproject/data/repository/home_repository.dart';
import 'package:getxproject/data/responses/status.dart';
import 'package:getxproject/model/home/user_list_model.dart';

class HomeViewModel extends GetxController {
  HomeRepository homeRepo = HomeRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final rxUserList = UserListModel().obs;
  RxString error = "".obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setRxUserList(UserListModel userList) => rxUserList.value = userList;
  void setError(String value) => error.value = value;

  userListApi() {
    homeRepo.userListApi().then(
      (value) {
        setRxRequestStatus(Status.COMPLETED);
        setRxUserList(value);
      },
    ).onError(
      (error, stackTrace) {
        log(error.toString());
        log(stackTrace.toString());
        setError(error.toString());

        setRxRequestStatus(Status.ERROR);
      },
    );
  }

  refreshUserListApi() {
    setRxRequestStatus(Status.LOADING);
    homeRepo.userListApi().then(
      (value) {
        setRxRequestStatus(Status.COMPLETED);
        setRxUserList(value);
      },
    ).onError(
      (error, stackTrace) {
        log(error.toString());
        log(stackTrace.toString());
        setError(error.toString());

        setRxRequestStatus(Status.ERROR);
      },
    );
  }
}
