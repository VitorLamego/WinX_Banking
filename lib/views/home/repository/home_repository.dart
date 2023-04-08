import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:statz_banking/interfaces/response_interface.dart';

import '../../../core/app_constants.dart';

class HomeRepository {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.BASE_URL,
      connectTimeout: const Duration(seconds: 25),
    ),
  );

  Future<ResponseInterface> getOpenFinance() async {
    Response response;
    try {
      response = await dio.get("/open-finance");
      log("User verified!");
      return ResponseInterface(response.data["data"], 200);
    } on DioError {
      log("Problem connecting to host");
      return ResponseInterface("Problem with server!", 503);
    }
  }
}
