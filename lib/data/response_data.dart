class ResponseData {
  final bool isSucass;
  final int statusCode;
  final String errorMessage;
  final dynamic responseData;

  ResponseData({
    required this.isSucass,
    required this.statusCode,
    required this.responseData,
    this.errorMessage = "Something went wrorg",
  });
}
