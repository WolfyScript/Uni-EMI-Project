import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:intl/intl.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:uni_emi_muell_guard/catalog_article.dart';
import 'package:uni_emi_muell_guard/dummy_data.dart';
import 'package:uni_emi_muell_guard/navbar/nav_sidebar.dart';

import '../utils.dart';

class CatalogArticleArguments {
  final CatalogArticle article;

  CatalogArticleArguments(this.article);
}

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavSidebar(),
      appBar: AppBar(
        title: const Text("Katalog"),
      ),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: catalogArticles.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              // First element is the search field
              return const TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_rounded),
                    border: OutlineInputBorder(),
                    hintText: "Suche im Katalog"),
              );
            }
            // Next elements are the articles
            if (catalogArticles.length > index - 1) {
              CatalogArticle article = catalogArticles.elementAt(index - 1);
              return createCatalogArticle(context, article);
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget createCatalogArticle(BuildContext context, CatalogArticle article) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
      ),
      child: Card(
        color: const Color.fromRGBO(206, 216, 208, 0.14),
        shadowColor: const Color.fromRGBO(206, 216, 208, 0.1),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, CatalogArticlePage.routeName,
                arguments: CatalogArticleArguments(article));
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        const SizedBox(
                          width: 8,
                        ),
                        const Icon(
                          Icons.import_contacts_rounded,
                          color: Color(0xff64748B),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "${article.readTime.inMinutes.toString()} Minuten",
                          style: const TextStyle(
                            color: Color(0xff64748B),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.edit_calendar_rounded,
                          color: Color(0xff64748B),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          DateFormat("dd.MM.yy").format(article.editDate == null ? article.creationDate : article.editDate!),
                          style: const TextStyle(
                            color: Color(0xff64748B),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      color: const Color(0xff64748B),
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz_rounded),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  article.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: MaterialColor(
                      0xFF4F7555,
                      <int, Color>{0: Color(0xFF4F7555)},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: SafeArea(
                    child: MarkdownBody(
                      styleSheet: MarkdownStyleSheet(textScaleFactor: 1.1),
                      extensionSet: md.ExtensionSet(
                          md.ExtensionSet.gitHubFlavored.blockSyntaxes, [
                        md.EmojiSyntax(),
                        ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes
                      ]),
                      data: article.summary,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CatalogArticlePage extends StatelessWidget {
  const CatalogArticlePage({super.key});

  static const routeName = '/catalog_article';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as CatalogArticleArguments;

    return Scaffold(
      drawer: const NavSidebar(),
      appBar: AppBar(
        title: const Text("Katalog"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              height: 60,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    visualDensity: VisualDensity.comfortable,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                  Expanded(
                    child: Text(
                      args.article.title,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: MaterialColor(
                          0xFF4F7555,
                          <int, Color>{0: Color(0xFF4F7555)},
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    visualDensity: VisualDensity.comfortable,
                    color: const Color(0xff64748B),
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_rounded),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  // First element is the search field
                  ClipRRect(
                    child: SizedBox(
                      height: 160,
                      width: double.infinity,
                      child: args.article.image,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.edit_calendar_rounded,
                          color: Color(0xff64748B),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Stand: ${DateFormat("dd. MMMM yyyy", "de_DE").format(args.article.editDate == null ? args.article.creationDate : args.article.editDate!)}",
                          style: const TextStyle(
                            color: Color(0xff64748B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: MarkdownBody(
                      styleSheet: customMarkdownStyleSheet,
                      extensionSet: md.ExtensionSet(
                          md.ExtensionSet.gitHubFlavored.blockSyntaxes, [
                        md.EmojiSyntax(),
                        ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes
                      ]),
                      selectable: true,
                      data: args.article.summary,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
                    child: MarkdownBody(
                      styleSheet: customMarkdownStyleSheet,
                      extensionSet: md.ExtensionSet(
                          md.ExtensionSet.gitHubFlavored.blockSyntaxes, [
                        md.EmojiSyntax(),
                        ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes
                      ]),
                      selectable: true,
                      data: args.article.content,
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
