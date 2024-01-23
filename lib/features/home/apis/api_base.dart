import 'package:dio/dio.dart';
import 'package:url_shortener/features/home/apis/apis.dart';
import 'package:url_shortener/features/home/models/models.dart';

class ApiBase {
  static Future<ApiResponse<ShortenModel?>> getRequest(
      {Map<String, dynamic>? data}) async {
    try {
      var res = await Dio().post(
        Endpoints.shortenUrl,
        data: data,
        options: Options(
          headers: {
            'Apikey': 'fd65943d5c54409aa0d9c5ce0b791f5c',
          },
        ),
      );

      return ApiResponse(
          isError: false,
          data: ShortenModel.fromJson(res.data),
          message: 'Success');
    } on DioException catch (e) {
      var error = e.response?.data['message'] ?? 'Something went wrong';

      var error1 = e.response?.data['errors'] != []
          ? e.response?.data['errors'][0]['message']
          : error;
      return ApiResponse(isError: true, data: null, message: error1);
    } catch (e) {
      return ApiResponse(
          isError: true, data: null, message: "Something went wrong");
    }
  }
}
