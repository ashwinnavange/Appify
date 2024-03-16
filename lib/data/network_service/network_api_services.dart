import 'dart:convert';
import 'package:appify/data/network_service/base_api_services.dart';
import 'package:appify/data/resolve_response.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  // dependency injection
  final http.Client client;

  NetworkApiServices(this.client);

  @override
  Future<dynamic> delete(String url, data) async {
    dynamic responseJson = {"status": false};
    try {
      final response = await client
          .delete(Uri.parse(url),
              headers: {
                'Content-type': 'application/json',
                // 'Authorization': PrefHelper().getString(PrefHelper.TOKEN)
              },
              body: json.encode(data))
          .timeout(const Duration(seconds: 20));
      responseJson = resolveResponse(response);
    } catch (e) {
      rethrow;
    }
    return responseJson;
  }

  @override
  Future<dynamic> get(String url) async {
    dynamic responseJson = {"status": false};
    try {
      final response = await client.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      responseJson = resolveResponse(response);
    } catch (e) {
      rethrow;
    }
    return responseJson;
  }

  @override
  Future<dynamic> post(String url, data) async {
    dynamic responseJson = {"status": false};
    try {
      final response = await client
          .post(Uri.parse(url),
              headers: {
                'Content-type': 'application/json',
              },
              body: json.encode(data))
          .timeout(const Duration(seconds: 20));
      responseJson = resolveResponse(response);
    } catch (e) {
      rethrow;
    }
    return responseJson;
  }

  @override
  Future<dynamic> put(String url, data) async {
    dynamic responseJson = {"status": false};
    try {
      final response = await client
          .put(Uri.parse(url),
              headers: {
                'Content-type': 'application/json',
              },
              body: json.encode(data))
          .timeout(const Duration(seconds: 20));
      responseJson = resolveResponse(response);
    } catch (e) {
      rethrow;
    }
    return responseJson;
  }
}
