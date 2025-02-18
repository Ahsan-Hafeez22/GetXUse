import 'package:getxproject/model/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPref {
  Future<bool> saveUser(UserModel userModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', userModel.token!);
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    return UserModel(token: token);
  }

  Future<bool> removeUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    return true;
  }
}
