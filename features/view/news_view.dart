import 'package:flutter/material.dart';
import 'package:news_app/features/model/news.dart';
import 'package:news_app/features/service/dio/dio_options.dart';
import 'package:news_app/features/service/news_service.dart';
import 'package:news_app/features/viewModel/news_view_model.dart';
import 'package:news_app/product/constants/project_constants.dart';
import 'package:news_app/product/widget/news_card.dart';
import 'package:provider/provider.dart';

class NewsView extends StatelessWidget
    with ProjectConstants, ProjectPaddings, ProjectColors {
  NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsViewModel(
        NewsService(DioOptions.generalNewsdioOptions),
      ),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: deepPurple300,
            centerTitle: false,
            actions: [
              Padding(
                padding: titlePadding,
                child: _dropdownButton(
                  context: context,
                  value: context.read<NewsViewModel>().selectedTag,
                  items: context.read<NewsViewModel>().items,
                  onChanged: (selectedValue) {
                    context
                        .read<NewsViewModel>()
                        .changeItem(selectedValue ?? nullString);
                    context
                        .read<NewsViewModel>()
                        .fetchResults(selectedValue ?? nullString);
                  },
                ),
              ),
            ],
          ),
          body: context.watch<NewsViewModel>().isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: context.watch<NewsViewModel>().results?.length ?? 0,
                  itemBuilder: (context, index) {
                    Result result =
                        context.read<NewsViewModel>().results?[index] ?? Result();
                    return NewsCard(result: result);
                  },
                ),
        );
      },
    );
  }

  DropdownButton<String> _dropdownButton(
      {required BuildContext context,
      required String value,
      required List<String> items,
      void Function(String?)? onChanged}) {
    return DropdownButton<String>(
      value: value,
      items: items.map<DropdownMenuItem<String>>(
        (value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
              value,
              style: ProjectTextStyle.titleStyle,
            ),
          );
        },
      ).toList(),
      onChanged: onChanged,
    );
  }
}
