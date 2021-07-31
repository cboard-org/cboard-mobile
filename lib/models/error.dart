// Temporarily placed here for now - not sure where else to put this Error class
class ErrorResponse {
  final String message;

  ErrorResponse({this.message});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      message: json['message'],
    );
  }
}
