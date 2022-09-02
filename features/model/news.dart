
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable(createToJson: false)
class News {
  bool? success;
  List<Result>? result;

  News({this.success, this.result});

  factory News.fromJson(Map<String, dynamic> json) {
    return _$NewsFromJson(json);
  }
}


@JsonSerializable(createToJson: false)
class Result {
  String? key;
  String? url;
  String? description;
  String? image;
  String? name;
  String? source;

  Result({this.key, this.url, this.description, this.image, this.name, this.source});

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }
}
