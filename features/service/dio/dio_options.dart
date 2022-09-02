import 'package:dio/dio.dart';
import 'package:news_app/product/enums/project_enums.dart';

class DioOptions {
  static Dio generalNewsdioOptions = Dio(
    BaseOptions(
      baseUrl: NewsUrlEnum.newsUrl.name,
      headers: NewsHeaderEnum.header.headers,
    ),
  );
}
