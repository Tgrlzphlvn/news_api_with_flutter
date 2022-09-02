import 'package:flutter/material.dart';
import 'package:news_app/features/view/news_view.dart';
import 'package:news_app/product/constants/project_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ProjectConstants.appTitle,
      home: NewsView(),
    );
  }
}
