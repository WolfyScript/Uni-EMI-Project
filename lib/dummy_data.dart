import 'dart:collection';

import 'package:first_flutter_project/catalog_article.dart';
import 'package:first_flutter_project/event.dart';
import 'package:first_flutter_project/news_article.dart';
import 'package:table_calendar/table_calendar.dart';

final events = LinkedHashMap<DateTime, Event>(
    equals: (e0, e1) {
      return isSameDay(e0, e1);
    },
    hashCode: (key) {
      return key.day * 1000000 + key.month * 10000 + key.year;
    },
  )..addAll({
      DateTime.utc(2023, 1, 30): Event("paper"),
      DateTime.utc(2023, 2, 7): Event("bio"),
      DateTime.utc(2023, 2, 16): Event("rest"),
      DateTime.utc(2023, 2, 20): Event("yellow"),
      DateTime.utc(2023, 2, 23): Event("bulky_waste"),
    });

final catalogArticles = [
  CatalogArticle(title: "", summary: "", content: "", creationDate: DateTime.utc(2023, 2, 1)),
  CatalogArticle(title: "", summary: "", content: "", creationDate: DateTime.utc(2023, 2, 10)),
  CatalogArticle(title: "", summary: "", content: "", creationDate: DateTime.utc(2023, 2, 12)),
  CatalogArticle(title: "", summary: "", content: "", creationDate: DateTime.utc(2023, 2, 16)),
  CatalogArticle(title: "", summary: "", content: "", creationDate: DateTime.utc(2023, 2, 19)),
  CatalogArticle(title: "", summary: "", content: "", creationDate: DateTime.utc(2023, 2, 20)),
  CatalogArticle(title: "", summary: "", content: "", creationDate: DateTime.utc(2023, 2, 22)),
  CatalogArticle(title: "", summary: "", content: "", creationDate: DateTime.utc(2023, 2, 24)),
  CatalogArticle(title: "", summary: "", content: "", creationDate: DateTime.utc(2023, 2, 26)),
  CatalogArticle(title: "", summary: "", content: "", creationDate: DateTime.utc(2023, 2, 28)),
];

final newsArticles = [
  NewsArticle(title: "", summary: "", content: "", creationDate: DateTime.utc(2023, 2, 1)),
  NewsArticle(title: "", summary: "", content: "", creationDate: DateTime.utc(2023, 2, 2)),
  NewsArticle(title: "", summary: "", content: "", creationDate: DateTime.utc(2023, 2, 4)),
];