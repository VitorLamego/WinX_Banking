import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:statz_banking/interfaces/response_interface.dart';
import '../../../core/app_constants.dart';

class SignupRepository {
  final dio = Dio(BaseOptions(
    baseUrl: AppConstants.BASE_URL,
    connectTimeout: const Duration(seconds: 25),
  ));

  Future<ResponseInterface> verifyUserRequest(String cpf, String password, String name) async {
    Map<String, String> body = {"cpf": cpf, "password": password, "name" : name};
    Response response;
    try {
      response = await dio.post(
        "/signup",
        options: Options(
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
        ),
        data: jsonEncode(body),
      );
      log("User verified!");
      return ResponseInterface(response.data["message"], 201);
    } on DioError catch (error) {
      log(error.toString());
      if (error.response == null) {
        log("Problem connecting to host");
        return ResponseInterface("Problem with server!", 503);
      } else if (error.response!.statusCode == 409) {
        log("User not found");
        return ResponseInterface(error.response!.data["message"], 400);
      }
      return ResponseInterface("User already registered!", 409);
    }
  }
}
