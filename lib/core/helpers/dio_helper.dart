import 'package:dio/dio.dart';

class DioHelper {
  final String? url;
  final Map<String, dynamic>? payload;

  DioHelper({this.url, this.payload});

  final Dio _dio = Dio();

  void get({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    _dio.get(url!, queryParameters: payload).then((response) {
      if (onSuccess != null) {
        onSuccess(response.data);
      }
    }).catchError((error) {
      if (onError != null) {
        onError(error);
      }
    });
  }
}
