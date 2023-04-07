class ResponseInterface {
  ResponseInterface(this.data, this.statusCode);

  final int statusCode;
  final dynamic data;
}
