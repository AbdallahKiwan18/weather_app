import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/helpers/dio_helper.dart';

class MockDioHelper extends Mock implements DioHelper {}

void main() {
  test("get weather API data", () async {
    WidgetsFlutterBinding.ensureInitialized();
    final dioHelper = MockDioHelper();
    when(dioHelper.get(
      onSuccess: anyNamed('onSuccess'),
      onError: anyNamed('onError'),
    )).thenAnswer((_) async {
      print("success");
    });
  });
}
