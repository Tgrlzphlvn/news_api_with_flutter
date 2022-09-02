

enum NewsUrlEnum {
  newsUrl('https://api.collectapi.com/news/getNews?country=tr&tag=');

  final String name;

  const NewsUrlEnum(this.name);
}

enum NewsTagEnum {
  economyTag('economy'),
  technologyTag('technology'),
  generalTag('general');

  final String name;

  const NewsTagEnum(this.name);
}

enum DropDownItemsEnum {
  generalTag('Haberler'),
  economyTag('Ekonomi'),
  technologyTag('Teknoloji');

  final String name;

  const DropDownItemsEnum(this.name);
}

enum NewsHeaderEnum {
  header({
    "content-type": "application/json",
    "authorization": "apikey 1EsSsgSZMq46ACLKsM4kSQ:4hdbRpcDUlbMSOizgexY86"
  });

  final Map<String, dynamic> headers;

  const NewsHeaderEnum(this.headers);
}
