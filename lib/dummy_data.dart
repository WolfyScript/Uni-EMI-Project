import 'dart:collection';

import 'package:uni_emi_muell_guard/catalog_article.dart';
import 'package:uni_emi_muell_guard/event.dart';
import 'package:uni_emi_muell_guard/news_article.dart';
import 'package:flutter/widgets.dart';
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
    DateTime.utc(2023, 2, 16): Event("yellow"),
    DateTime.utc(2023, 2, 20): Event("bulky_waste"),
    DateTime.utc(2023, 2, 23): Event("rest"),
  });

final catalogArticles = [
  CatalogArticle(
    title: "Müll richtig trennen. So gehts!",
    image: Image.asset('assets/abfallsortierung.jpg', fit: BoxFit.cover),
    summary: "Hier erfahren Sie, wie Verpackungen richtig getrennt werden und was unbedingt als Sondermüll entsorgt werden muss.",
    content: "",
    creationDate: DateTime.utc(2023, 2, 1),
    readTime: const Duration(minutes: 8),
  ),
  CatalogArticle(
    title: "Altbatterien & Akkus",
    image: Image.asset('assets/batteries.webp', fit: BoxFit.cover),
    summary: "Von der Knopfzelle über Geräteakkus bis hin zur Autobatterie - bei all diesen mobilen Energiespendern heißt die oberste Nutzerpflicht: \"Nach Gebrauch zurück\".",
    content: "",
    creationDate: DateTime.utc(2023, 2, 10),
    readTime: const Duration(minutes: 8),
  ),
  CatalogArticle(
    title: "",
    image: Image.asset('assets/test-image.jpg', fit: BoxFit.cover),
    summary: "",
    content: "",
    creationDate: DateTime.utc(2023, 2, 12),
    readTime: const Duration(minutes: 8),
  ),
  CatalogArticle(
    title: "",
    image: Image.asset('assets/test-image.jpg', fit: BoxFit.cover),
    summary: "",
    content: "",
    creationDate: DateTime.utc(2023, 2, 16),
    readTime: const Duration(minutes: 8),
  ),
  CatalogArticle(
    title: "",
    image: Image.asset('assets/test-image.jpg', fit: BoxFit.cover),
    summary: "",
    content: "",
    creationDate: DateTime.utc(2023, 2, 19),
    readTime: const Duration(minutes: 8),
  ),
  CatalogArticle(
    title: "",
    image: Image.asset('assets/test-image.jpg', fit: BoxFit.cover),
    summary: "",
    content: "",
    creationDate: DateTime.utc(2023, 2, 20),
    readTime: const Duration(minutes: 8),
  ),
  CatalogArticle(
    title: "",
    image: Image.asset('assets/test-image.jpg', fit: BoxFit.cover),
    summary: "",
    content: "",
    creationDate: DateTime.utc(2023, 2, 22),
    readTime: const Duration(minutes: 8),
  ),
  CatalogArticle(
    title: "",
    image: Image.asset('assets/test-image.jpg', fit: BoxFit.cover),
    summary: "",
    content: "",
    creationDate: DateTime.utc(2023, 2, 24),
    readTime: const Duration(minutes: 8),
  ),
  CatalogArticle(
    title: "",
    image: Image.asset('assets/test-image.jpg', fit: BoxFit.cover),
    summary: "",
    content: "",
    creationDate: DateTime.utc(2023, 2, 26),
    readTime: const Duration(minutes: 8),
  ),
  CatalogArticle(
    title: "",
    image: Image.asset('assets/test-image.jpg', fit: BoxFit.cover),
    summary: "",
    content: "",
    creationDate: DateTime.utc(2023, 2, 28),
    readTime: const Duration(minutes: 8),
  ),
];

final newsArticles = [
  NewsArticle(
    title: "Hamburg Räumt Auf!",
    image: Image.asset(
      'assets/hamburg_raeumt_auf.png',
      fit: BoxFit.cover,
    ),
    summary:
        "Seid auch dieses Jahr wieder bei Hamburgs größter Saubermachaktion dabei!",
    content: "",
    creationDate: DateTime.utc(2023, 2, 1),
    readTime: const Duration(minutes: 8),
  ),
  NewsArticle(
    title: "Flohmarkt in Eidelstedt",
    image: Image.asset(
      'assets/flohmarkt_eidelstedt.jpg',
      fit: BoxFit.cover,
    ),
    summary: """Nächste Woche gibt es wieder ein Flohmarkt in Eidelsteht. 
    """,
    content: "",
    creationDate: DateTime.utc(2023, 2, 2),
    readTime: const Duration(minutes: 8),
  ),
  NewsArticle(
    title: "",
    image: Image.asset(
      'assets/test-image.jpg',
      fit: BoxFit.cover,
    ),
    summary: "",
    content: "",
    creationDate: DateTime.utc(2023, 2, 4),
    readTime: const Duration(minutes: 8),
  ),
];
