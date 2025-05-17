import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:5500', // your API base URL
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiamlyZW4gR3V0ZW1hIiwidXNlcmlkIjoyLCJyb2xlIjoib3JnYW5pemF0aW9uIiwiaWF0IjoxNzQ3NTEzNzU1LCJleHAiOjE3NDc2MDAxNTV9._fJe52pspYneulRc3MpxwX10kb2irPypkzrjJKgk1qM',
      },
    ),
  );
  return dio;
});
