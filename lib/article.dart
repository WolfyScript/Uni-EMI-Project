

import 'package:flutter/widgets.dart';

abstract class Article {
  String title;
  String summary;
  String content;
  Image image;
  Duration readTime;
  DateTime creationDate;
  DateTime? editDate;

  Article(
      {required this.title,
        required this.image,
      required this.summary,
      required this.content,
      required this.creationDate,
        required this.readTime,
      this.editDate});

  void setEditedOn(DateTime editDate) {
    this.editDate = editDate;
  }

  DateTime? getEditedOn() {
    return editDate;
  }

  bool wasEdited() {
    return editDate != null;
  }
}
