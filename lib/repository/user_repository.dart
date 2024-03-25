import 'package:http/http.dart' as http;

import '../data/network_service/base_api_services.dart';
import '../data/network_service/network_api_services.dart';
import '../model/user_model.dart';
import '../res/app_url.dart';

class UserRepository {
  final BaseApiServices _apiServices = NetworkApiServices(http.Client());

  Future<dynamic> getUserDetails(String userId) async {
    try {
      dynamic response = await _apiServices.get(AppUrl.getUser(userId));;
      if (response!= null) {
        response = User.fromMap(response);
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerUser(dynamic data) async {
    try {
      dynamic response = await _apiServices.post(AppUrl.createUserUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> loginUser(dynamic data) async {
    try {
      dynamic response = await _apiServices.post(AppUrl.loginUserUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
 
}
