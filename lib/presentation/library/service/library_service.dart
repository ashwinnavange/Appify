import 'package:appify/model/library_model.dart';

import '../../../data/response/response.dart';
import '../../../repository/library_repository.dart';

class LibraryService{
  final LibraryRepository _libraryRepository = LibraryRepository();
  Future<ApiResponse> getLibrary(String id) async {
    try {
      final response = await _libraryRepository.getLibrary(id);
      if (response.library != null) {
        return ApiResponse(
            true, response as LibraryList, 'Successfully Fetch Library Data!');
      }
      return ApiResponse(false, response, response['message']);
    } catch (e) {
      return ApiResponse(false, null, 'Error');
    }
  }

  Future<ApiResponse> deleteApp(String packageName) async {
    try {
      final response = await _libraryRepository.deleteApp(packageName);
      if (response['message'] == 'Unauthorized' || response['message'] == 'Invalid Token') {
        return ApiResponse(false, null, response['message']);
      }
      else if (response['success']) {
        return ApiResponse(true, response, 'Successfully Deleted App!');
      }
      return ApiResponse(false, null, response['message']);
    } catch (e) {
      return ApiResponse(false, null, 'Error');
    }
  }
  
}