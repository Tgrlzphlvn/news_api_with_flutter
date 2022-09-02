
import 'package:flutter/material.dart';
import 'package:news_app/features/model/news.dart';
import 'package:news_app/product/constants/project_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget with ProjectConstants, ProjectPaddings {
  NewsCard({Key? key, required this.result}) : super(key: key);

  final Result result;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width / 0.9,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            normalRadius,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: normalPadding,
                  child: Text(
                    result.source ?? nullString,
                    style: ProjectTextStyle.highStyle,
                  ),
                ),
                const Spacer()
              ],
            ),
            Padding(
              padding: normalPadding,
              child: Image.network(result.image ?? nullString),
            ),
            Padding(
              padding: normalPadding,
              child: Text(
                result.name ?? nullString,
                style: ProjectTextStyle.mediumStyle,
              ),
            ),
            Padding(
              padding: normalPadding,
              child: Text(
                result.description ?? nullString,
                style: ProjectTextStyle.lowStyle,
              ),
            ),
            const Divider()
          ],
        ),
      ),
      onTap: () {
        _goToUrl(result.url ?? nullString);
      },
    );
  }

  Future<void> _goToUrl(String url)  async {
    await launchUrl(Uri.parse(url));
  }
}
