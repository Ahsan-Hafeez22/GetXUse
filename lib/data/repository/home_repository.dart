// import 'dart:developer';

import 'package:getxproject/data/network/network_api_service.dart';
import 'package:getxproject/model/home/user_list_model.dart';
import 'package:getxproject/res/app_url/app_urls.dart';

class HomeRepository {
  final _apiService = NetworkApiService();
  Future<UserListModel> userListApi() async {
    dynamic response = await _apiService.getApi(AppUrls.userListUrl);
    return UserListModel.fromJson(response);
  }
}
