import 'dart:typed_data';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {
  static Dio _dio = Dio();

  static void configureDio() {
    // Base url
    _dio.options.baseUrl = 'http://localhost:8080/api';

    // Configurar headers
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };
  }

  static Future httpGet(String urlPath) async {
    try {
      final response = await _dio.get(urlPath);
      return response.data;
    } on DioError catch (e) {
      print(e.response);
    }
  }

  static Future httpPost(String urlPath, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final response = await _dio.post(urlPath, data: formData);
      return response.data;
    } on DioError catch (e) {
      print(e.response);
      throw ('Error en el post');
    }
  }

  static Future httpPut(String urlPath, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final response = await _dio.put(urlPath, data: formData);
      return response.data;
    } on DioError catch (e) {
      print(e.response);
      throw ('Error en el put');
    }
  }

  static Future httpDelete(String urlPath) async {
    try {
      final response = await _dio.delete(urlPath);
      return response.data;
    } on DioError catch (e) {
      print(e.response);
      throw ('Error en el delete');
    }
  }

  static Future uploadFile(String path, Uint8List bytes) async {
    final formData =
        FormData.fromMap({'archivo': MultipartFile.fromBytes(bytes)});

    try {
      final resp = await _dio.put(path, data: formData);

      return resp.data;
    } on DioError catch (e) {
      print(e.response);
      throw ('Error en el PUT $e');
    }
  }
}
