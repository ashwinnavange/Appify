import '../../../data/response/response.dart';
import '../../../model/app_model.dart';
import '../../../repository/app_repository.dart';

class DetailsService {
  final _appRepository = AppRespository();

  Future<ApiResponse> getAppDetails(String packageName) async {
    try {
      final response = await _appRepository.getAppDetails(packageName);
      if (response != null) {
        return ApiResponse(
            true, response as App, 'Successfully Fetched App Data!');
      }
      return ApiResponse(false, null, response['message']);
    } catch (e) {
      return ApiResponse(false, null, 'Error');
    }
  }
}