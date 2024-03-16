class ApiResponse {
  final bool status;
  final String message;
  final dynamic data;

  ApiResponse(this.status, this.data, this.message);
}
