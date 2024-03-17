import 'package:appify/model/user_model.dart';

import '../../../data/response/response.dart';
import '../../../repository/user_repository.dart';

class DashBoardSerivce {
  final _userRepository = UserRepository();

  Future<ApiResponse> registerUser(String name,String email,String password) async {
    try {
      final response = await _userRepository.registerUser({
        'name': name,
        'email': email,
        'password': password
      });
      if (response['_id']!=null) {
        return ApiResponse(
            true, response['_id'], 'Successfully Registered!');
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
            true, response['_id'], 'Successfully Logged In!');
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

}