import 'package:dio/dio.dart';
import 'package:shopos/src/services/global.dart';
import 'package:shopos/src/services/locator.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    final errorMessage = err.response?.data['message'] ?? err.message;
    const message = "Something went wrong";
    locator<GlobalServices>().errorSnackBar(errorMessage ?? message);
    return super.onError(err, handler);
  }
}
