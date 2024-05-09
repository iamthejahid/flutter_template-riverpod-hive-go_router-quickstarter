class ErrorResponse {
  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      errors: json["errors"],
      message: json["message"],
    );
  }

  ErrorResponse({
    this.errors,
    this.message,
  });
  String? message;
  String? errors;
}

class ApiErrorResponse {
  final ErrorResponse? errorResponse;
  final int? statusCode;
  ApiErrorResponse({
    this.errorResponse,
    this.statusCode,
  });
}
