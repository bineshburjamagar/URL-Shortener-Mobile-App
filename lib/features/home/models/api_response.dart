class ApiResponse<T> {
  final bool isError;
  final T data;
  final String message;

  ApiResponse({
    required this.isError,
    required this.data,
    required this.message,
  });
}
