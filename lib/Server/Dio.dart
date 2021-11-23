import 'package:dio/dio.dart';
import 'package:shoping/GetX/getStorage.dart';

class Dio_Helper {
  static Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json', 'lang': ThemeStorage().getLanguage()}));
  }

  static Future<Response> getData(
      {String url, Map<String, dynamic> query, String token,}) async {
    dio.options.headers = {'Authorization': token??'',
    'Content-Type':'application/json',
      'lang': ThemeStorage().getLanguage()
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {String url,
      Map<String, dynamic> query,
      Map<String, dynamic> data,
      String token}) async {
    dio.options.headers = {'Authorization': token??''
    ,  'Content-Type':'application/json',
      'lang': ThemeStorage().getLanguage()
    };
    return await dio.post(url, queryParameters: query, data: data);
  }
}
