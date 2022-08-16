import 'dart:convert';

import 'package:meu_app/modules/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String title;
  final String content;
  final String img;

  ResultSearchModel(
      {required this.title, required this.content, required this.img})
      : super(title: title, content: content, img: img);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'img': img,
    };
  }

  static ResultSearchModel fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      title: map['title'],
      content: map['content'],
      img: map['img'],
    );
  }

  String toJson() => json.encode(toMap());

  static ResultSearchModel fromJson(String source) =>
      fromMap(json.decode(source));
}
