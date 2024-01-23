import 'package:dio/dio.dart';
import 'package:url_shortener/features/home/apis/apis.dart';
import 'package:url_shortener/features/home/models/shorten_model.dart';

class ApiBase {
  static Future<ShortenModel?> getRequest(
      {Map<String, dynamic>? queryParams}) async {
    try {
      var res = await Dio().get(
        Endpoints.shortenUrl,
        queryParameters: queryParams,
      );

      return ShortenModel.fromJson(res.data);
    } catch (e) {
      return null;
    }
  }
}
