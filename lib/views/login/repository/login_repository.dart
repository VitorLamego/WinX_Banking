import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:statz_banking/interfaces/response_interface.dart';
import '../../../core/app_constants.dart';

class LoginRepository {
  final dio = Dio(BaseOptions(
    baseUrl: AppConstants.BASE_URL,
    connectTimeout: const Duration(seconds: 25),
  ));

  Future<ResponseInterface> verifyUserRequest(String cpf, String password) async {
    Map<String, String> body = {"cpf": cpf, "password": password};
    Response response;
    try {
      response = await dio.post(
        "/login",
        options: Options(
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
        ),
        data: jsonEncode(body),
      );
      log("User verified!");
      return ResponseInterface(response.data["message"], 200);
    } on DioError catch (error) {
      log(error.toString());
      if (error.response == null) {
        log("Problem connecting to host");
        return ResponseInterface("Problem with server!", 503);
      } else if (error.response!.statusCode == 404) {
        log("User not found");
        return ResponseInterface(error.response!.data["message"], 400);
      }
      return ResponseInterface("User or password invalid!", 404);
    }
  }
}
