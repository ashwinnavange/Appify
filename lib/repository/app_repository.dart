import 'dart:convert';
import '../data/network_service/base_api_services.dart';
import '../data/network_service/network_api_services.dart';
import 'package:http/http.dart' as http;
import '../model/app_model.dart';
import '../res/app_url.dart';

class AppRespository {
  final BaseApiServices _apiServices = NetworkApiServices(http.Client());

  Future<dynamic> postApp(http.MultipartRequest request) async {
    try {
      dynamic response = await request.send();
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = json.decode(responseBody);
      return jsonResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getAllApps() async {
    try {
      dynamic response = await _apiServices.get(AppUrl.getAppsUrl);
      if(response!=null){
        response = AppList.fromMap(response);
        return response;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dynamic> getAllGames() async {
    try {
      dynamic response = await _apiServices.get(AppUrl.getAllGames);
      if(response!=null){
        response = AppList.fromMap(response);
        return response;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dynamic> getAppDetails(String packageName) async {
    try {
      dynamic response = await _apiServices.get(AppUrl.getAppDetails(packageName));
      if(response!=null){
        response = App.fromMap(response);
        return response;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dynamic> increaseDownloadCount(String packageName) async {
    try {
      dynamic response = await _apiServices.post(AppUrl.increaseDownloadCount(packageName),{});
      if(response!=null){
        return response;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

}