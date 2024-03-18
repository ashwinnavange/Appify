class AppUrl{
  static const baseUrl = "https://appify-backend.onrender.com/api/v1";

  //static const baseUrl = "http://localhost:5000/api/v1";

  static const createUserUrl = '$baseUrl/newUser';

  static const loginUserUrl = '$baseUrl/login';

  static const getAppsUrl = '$baseUrl/apps';

  static const postAppUrl = '$baseUrl/apps';

  static String getUser(String id) {
    return '$baseUrl/user/$id';
  }
}