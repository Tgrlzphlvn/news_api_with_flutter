import 'package:flutter/material.dart';
import 'package:news_app/features/model/news.dart';
import 'package:news_app/features/service/news_service.dart';
import 'package:news_app/product/constants/project_constants.dart';
import 'package:news_app/product/enums/project_enums.dart';

class NewsViewModel extends ChangeNotifier with ProjectConstants {
  late NewsServiceProtocol service;

  NewsViewModel(this.service) {
    Future.microtask(() async {
      await fetchResults(selectedTag);
    });
  }

  List<String> items = [
    DropDownItemsEnum.generalTag.name,
    DropDownItemsEnum.economyTag.name,
    DropDownItemsEnum.technologyTag.name
  ];

  String selectedTag = DropDownItemsEnum.generalTag.name;

  List<Result>? results = [];

  bool isLoading = false;

  void changeItem(String item) {
    selectedTag = item;
    notifyListeners();
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> fetchResults(String tag) async {
    changeLoading();
    if(tag == DropDownItemsEnum.generalTag.name) {
        results = await service.fetchGeneralNews(NewsTagEnum.generalTag.name);
    } else if(tag == DropDownItemsEnum.economyTag.name) {
        results = await service.fetchGeneralNews(NewsTagEnum.economyTag.name);
    } else {
        results = await service.fetchGeneralNews(NewsTagEnum.technologyTag.name);
    }
    changeLoading();
    notifyListeners();
  }
}
