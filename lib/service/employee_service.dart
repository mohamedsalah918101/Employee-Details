import 'package:dio/dio.dart';

import '../model/employee_model.dart';


class EmployeeService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://dummyjson.com',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  ));

  Future<List<User>> fetchEmployees() async {
    try {
      final response = await _dio.get('/users');

      if (response.statusCode == 200) {
        final UserResponse userResponse = UserResponse.fromJson(response.data);
        return userResponse.users;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Failed to load employees',
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw 'Connection timed out. Please check your internet connection.';
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw 'Server is taking too long to respond. Please try again.';
      } else {
        throw 'Failed to fetch employees: ${e.message}';
      }
    } catch (e) {
      throw 'An unexpected error occurred: $e';
    }
  }
}