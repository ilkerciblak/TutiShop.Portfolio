class NetworkException implements Exception {
  final int errorCode;
  final String? errorMessage;

  NetworkException({
    required this.errorCode,
    this.errorMessage,
  });

  final Map<int, String> errorMessageMap = {
    400:
        "The server cannot or will not process the request due to something that is perceived to be a client error.",
    403: "The client does not have access rights to the content.",
    404: "The server cannot find the requested resource. ",
    405:
        "The request method is known by the server but is not supported by the target resource.",
    408: "Request timeout: The request took too long to complete.",
    422:
        "The request was well-formed but was unable to be followed due to semantic errors.",
    718: "No Internet: Please check your internet connection",
  };

  @override
  String toString() {
    return "Network Exception($errorCode) : ${errorMessage ?? errorMessageMap[errorCode]}";
  }
}
