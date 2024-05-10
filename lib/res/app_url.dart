class AppUrl{
  //static const baseUrl = "https://appify-backend.onrender.com/api/v1";

  static const baseUrl = "https://appify-backend-production.up.railway.app/api/v1";

  //static const baseUrl = "http://localhost:5000/api/v1";

  static const createUserUrl = '$baseUrl/newUser';

  static const loginUserUrl = '$baseUrl/login';

  static const getAppsUrl = '$baseUrl/apps';

  static const postAppUrl = '$baseUrl/apps';

  static const getAllGames = '$baseUrl/games';

  static String getUser(String id) {
    return '$baseUrl/user/$id';
  }

  static String getAppDetails(String packageName) {
    return '$baseUrl/apps/$packageName';
  }

  static String getLibrary(String id) {
    return '$baseUrl/library/$id';
  }

  static String deleteApp(String packageName) {
    return '$baseUrl/library/delete/$packageName';
  }

  static String increaseDownloadCount(String id) {
    return '$baseUrl/download/$id';
  }
}