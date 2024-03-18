import 'dart:typed_data';
import 'package:http/http.dart' as http;
import '../../../data/response/response.dart';
import '../../../repository/app_repository.dart';
import '../../../res/app_url.dart';

class UploadService {
  final AppRespository _appRespository = AppRespository();

  Future<ApiResponse> postApp({
    required Uint8List logo,
    required String appName,
    required String description,
    required String shortDescription,
    required List<String> categories,
    required String whatsNew,
    required String packageName,
    required Uint8List appFile,
    required String developerName,
    required String type,
    required String userId,
    required num rating,
    required List<Uint8List> photos,
    required num totalDownloads,
  }) async {
    try {
      var logoStream = Stream.value(logo);
      var appFileStream = Stream.value(appFile);
      var photoStreams = photos.map((photo) => Stream.value(photo)).toList();

      var uri = Uri.parse(AppUrl.postAppUrl);
      var request = http.MultipartRequest('POST', uri);

      request.fields['appName'] = appName;
      request.fields['description'] = description;
      request.fields['shortDescription'] = shortDescription;
      request.fields['categories'] = categories.join(', ');
      request.fields['whatsNew'] = whatsNew;
      request.fields['packageName'] = packageName;
      request.fields['developerName'] = developerName;
      request.fields['type'] = type;
      request.fields['userId'] = userId;
      request.fields['rating'] = rating.toString();
      request.fields['totalDownloads'] = totalDownloads.toString();

      request.files.add(http.MultipartFile(
        'logo',
        logoStream,
        logo.lengthInBytes,
        filename: 'logo.jpg',
      ));

      request.files.add(http.MultipartFile(
        'appFile',
        appFileStream,
        appFile.lengthInBytes,
        filename: 'app_file.apk',
      ));

      for (var i = 0; i < photoStreams.length; i++) {
        request.files.add(http.MultipartFile(
          'photos',
          photoStreams[i],
          photos[i].lengthInBytes,
          filename: 'photo_$i.jpg',
        ));
      }
      final response = await _appRespository.postApp(request);
      if (response['_id'] != null) {
        return ApiResponse(true, response, "App posted successfully");
      }
      return ApiResponse(false, null, response['message']);
    } catch (e) {
      return ApiResponse(false, null, "Failed to post the App");
    }
  }
}
