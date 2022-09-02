import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app/features/model/news.dart';

abstract class NewsServiceProtocol {
  Dio dio;

  NewsServiceProtocol(this.dio);

  Future<List<Result>?> fetchGeneralNews(String tag);
}

class NewsService extends NewsServiceProtocol {
  NewsService(super.dio);

  @override
  Future<List<Result>?> fetchGeneralNews(String tag) async {
    final request = await dio.get(tag);

    if (request.statusCode == HttpStatus.ok) {
      final response = request.data;
      return News.fromJson(response).result;
    }
    return null;
  }
}
