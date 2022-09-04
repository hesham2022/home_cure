import 'package:dio/dio.dart';

Future<T> callAndParse<T>({
  required Future<Response<dynamic>> body,
  required T Function(dynamic v) handler,
}) async {
  final response = await body;
  return handler(response.data);
}
