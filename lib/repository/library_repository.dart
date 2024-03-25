import 'package:appify/model/library_model.dart';
import '../data/network_service/base_api_services.dart';
import '../data/network_service/network_api_services.dart';
import 'package:http/http.dart' as http;
import '../res/app_url.dart';

class LibraryRepository {
  final BaseApiServices _apiServices = NetworkApiServices(http.Client());

  Future<dynamic> getLibrary(String id) async {
    try {
      dynamic response = await _apiServices.get(AppUrl.getLibrary(id));
      if(response['library']!=null){
        response = LibraryList.fromMap(response);
        return response;
      }
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dynamic> deleteApp(String packageName) async {
    try {
      dynamic response = await _apiServices.delete(AppUrl.deleteApp(packageName),{});
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}