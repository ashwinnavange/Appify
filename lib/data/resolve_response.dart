import 'dart:convert';
import 'package:http/http.dart' as http;

dynamic resolveResponse(http.Response response) {
  if (response.statusCode >= 200 && response.statusCode < 300) {
    print(response.body);
    return jsonDecode(response.body);
  } else {
    print(response.body);
    return jsonDecode(response.body);
    // throw FetchDataException('Error : ${response.statusCode} ${json.decode(response.body)}');
  }
}
