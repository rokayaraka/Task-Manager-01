class ApiResponse{
  final int responseCode ;
  final dynamic responseData;
  final bool isSuccess;
  final String? errorMsg;
  ApiResponse({
    required this.responseCode,
    required this.responseData,
    required this.isSuccess,
    this.errorMsg, required String errorMessage,
  });

}