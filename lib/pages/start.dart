import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:intl/intl.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:uni_emi_muell_guard/dummy_data.dart';
import 'package:uni_emi_muell_guard/event.dart';
import 'package:uni_emi_muell_guard/utils.dart';

import '../navbar/nav_sidebar.dart';
import '../news_article.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key = const Key("start"), required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavSidebar(),
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: ListView.builder(
          itemCount: 3,
          padding: const EdgeInsets.only(bottom: 16),
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                {
                  final upcomingEvents = <Event, DateTime>{};
                  for (var entry in events.entries) {
                    for (var event in entry.value) {
                      if (upcomingEvents.length >= 3) break;
                      if (!disabledEventTypes.contains(event.type)) {
                        upcomingEvents.putIfAbsent(event, () => entry.key);
                      }
                    }
                  }
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 32,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.calendar_today_rounded),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Anstehend",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        ...upcomingEvents.entries
                            .map(
                              (e) => createUpcomingBtn(
                                context,
                                e.key.type.label,
                                DateFormat.EEEE('de_DE').format(e.value),
                                DateFormat("dd.MM").format(e.value),
                              ),
                            )
                            .toList(),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: const [
                            Icon(Icons.newspaper_rounded),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Aktuelles",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  );
                }
              default:
                if (newsArticles.length > index - 1) {
                  NewsArticle article = newsArticles.elementAt(index - 1);
                  return createNewsArticle(context, article);
                }
                return null;
            }
          },
        ),
      ),
    );
  }

  Widget createUpcomingBtn(
      BuildContext context, String type, String day, String date) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: ElevatedButton(
        onPressed: () {},
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
          backgroundColor: MaterialStatePropertyAll(
            MaterialColor(0xFFCCEEDD, <int, Color>{0: Color(0xFFCCEEDD)}),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.start,
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    Chip(
                      label: Text(day),
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MaterialColor(
                            0xFF4F7555, <int, Color>{0: Color(0xFF4F7555)}),
                      ),
                      backgroundColor: const MaterialColor(
                          0xFFECFDF5, <int, Color>{0: Color(0xFFECFDF5)}),
                    ),
                    Chip(
                      label: Text(date),
                      backgroundColor: const MaterialColor(
                          0xFFECFDF5, <int, Color>{0: Color(0xFFECFDF5)}),
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MaterialColor(
                            0xFF4F7555, <int, Color>{0: Color(0xFF4F7555)}),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  type,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Ink(
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: MaterialColor(
                    0xFF4F7555,
                    <int, Color>{0: Color(0xFF4F7555)},
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/calendar');
                  },
                  visualDensity: VisualDensity.compact,
                  icon: const Icon(Icons.calendar_month_rounded),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget createNewsArticle(BuildContext context, NewsArticle article) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
    child: Card(
      color: const Color.fromRGBO(206, 216, 208, 0.14),
      shadowColor: const Color.fromRGBO(206, 216, 208, 0.1),
      child: InkWell(
        onTap: () => print("Clicked"),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: MaterialColor(
                    0xFF4F7555,
                    <int, Color>{0: Color(0xFF4F7555)},
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: article.image,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.import_contacts_rounded,
                          semanticLabel: 'Read Duration',
                          color: Color(0xff64748B),
                        ),
                      ),
                      Text(
                        "${article.readTime.inMinutes.toString()} Minuten",
                        style: const TextStyle(
                          color: Color(0xff64748B),
                        ),
                      )
                    ],
                  ),
                  IconButton(
                    visualDensity: VisualDensity.comfortable,
                    padding: EdgeInsets.zero,
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    enableFeedback: true,
                    color: const Color(0xff64748B),
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_rounded),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: double.infinity,
                child: SafeArea(
                  child: MarkdownBody(
                    extensionSet: md.ExtensionSet(
                        md.ExtensionSet.gitHubFlavored.blockSyntaxes, [
                      md.EmojiSyntax(),
                      ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes
                    ]),
                    selectable: true,
                    data: article.summary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
