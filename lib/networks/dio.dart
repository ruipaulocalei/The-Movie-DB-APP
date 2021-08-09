import 'package:dio/dio.dart';

Dio dio() {
  var dio = new Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      responseType: ResponseType.plain,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
      }));
  return dio;
}
