import 'dart:convert';
import '../data/network_service/base_api_services.dart';
import '../data/network_service/network_api_services.dart';
import 'package:http/http.dart' as http;
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
      dynamic response = await _apiServices.get(AppUrl.postAppUrl);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}