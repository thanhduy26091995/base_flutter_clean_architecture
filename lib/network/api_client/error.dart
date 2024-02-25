class HTTPClientError extends Error {
  final String message;
  final int statusCode;

  HTTPClientError(this.message, this.statusCode);

  static HTTPClientError invalidResponse =
      HTTPClientError('Invalid response', 801);
  static HTTPClientError clientError = HTTPClientError('Client error', 802);
  static HTTPClientError serverError = HTTPClientError('Server error', 803);
  static HTTPClientError unknownError = HTTPClientError('Unknown error', 804);

  @override
  String toString() {
    return 'HTTPClientError: ($message $statusCode)';
  }
}
