class AppUrl{
  static const baseUrl = "https://appify-backend.onrender.com/api/v1";

  static const createUserUrl = '$baseUrl/newUser';

  static const loginUserUrl = '$baseUrl/login';

  static String getUser(String id) {
    return '$baseUrl/user/$id';
  }
}