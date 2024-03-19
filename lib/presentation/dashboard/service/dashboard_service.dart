import 'package:appify/model/app_model.dart';
import 'package:appify/model/user_model.dart';
import 'package:appify/repository/app_repository.dart';

import '../../../data/response/response.dart';
import '../../../repository/user_repository.dart';

class DashBoardSerivce {
  final _userRepository = UserRepository();
  final _appRepository = AppRespository();

  Future<ApiResponse> registerUser(String name,String email,String password) async {
    try {
      final response = await _userRepository.registerUser({
        'name': name,
        'email': email,
        'password': password
      });
      if (response['_id']!=null) {
        return ApiResponse(
            true, response, 'Successfully Registered!');
      }
      return ApiResponse(false, null, response['message']);
    } catch (e) {
      return ApiResponse(false, null, 'Error');
    }
  }

  Future<ApiResponse> loginUser(String email,String password) async {
    try {
      final response = await _userRepository.loginUser({
        'email': email,
        'password': password
      });
      if (response['_id']!=null) {
        return ApiResponse(
            true, response, 'Successfully Logged In!');
      }
      return ApiResponse(false, null, response['message']);
    } catch (e) {
      return ApiResponse(false, null, 'Error');
    }
  }

  Future<ApiResponse> getUser(String id) async {
    try {
      final response = await _userRepository.getUserDetails(id);
      if (response['_id']!=null) {
        return ApiResponse(
            true, response as User, 'Successfully Fetch User Data!');
      }
      return ApiResponse(false, null, response['message']);
    } catch (e) {
      return ApiResponse(false, null, 'Error');
    }
  }
  
  Future<ApiResponse> getAllApps() async {
    try {
      final response = await _appRepository.getAllApps();
      if (response != null) {
        return ApiResponse(
            true, response as AppList, 'Successfully Fetch App Data!');
      }
      return ApiResponse(false, null, response['message']);
    } catch (e) {
      return ApiResponse(false, null, 'Error');
    }
  }

  Future<ApiResponse> getAllGames() async {
    try {
      final response = await _appRepository.getAllGames();
      if (response != null) {
        return ApiResponse(
            true, response as AppList, 'Successfully Fetch Game Data!');
      }
      return ApiResponse(false, null, response['message']);
    } catch (e) {
      return ApiResponse(false, null, 'Error');
    }
  }

}