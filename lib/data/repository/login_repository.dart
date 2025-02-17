import 'package:getxproject/data/network/network_api_service.dart';
import 'package:getxproject/res/app_url/app_urls.dart';

class LoginRepository {
  final _apiservice = NetworkApiService();
  Future<dynamic> loginApi(var data) async {
    dynamic response = _apiservice.postApi(AppUrls.loginUrl, data);
    return response;
  }
}
