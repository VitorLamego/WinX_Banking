import 'package:dio/dio.dart';

import '../../../core/app_constants.dart';

class HomeRepository {
  final dio = Dio(BaseOptions(
    baseUrl: AppConstants.BASE_URL,
    connectTimeout: const Duration(seconds: 25),
  ));
}
