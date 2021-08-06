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
    } catch (e) {
      print(e);
      throw ('Error en el get');
    }
  }

  static Future httpPost(String urlPath, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final response = await _dio.post(urlPath, data: formData);
      return response.data;
    } catch (e) {
      print(e);
      throw ('Error en el post');
    }
  }
}
