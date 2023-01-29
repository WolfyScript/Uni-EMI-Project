import 'package:uni_emi_muell_guard/catalog_article.dart';
import 'package:uni_emi_muell_guard/dummy_data.dart';
import 'package:uni_emi_muell_guard/navbar/nav_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

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
          itemCount: 3,
          itemBuilder: (context, index) {
            if (index == 0) {
              // First element is the search field
              return const TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_rounded),
                    border: OutlineInputBorder(),
                    hintText: "Suche Katalog Artikel"),
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
          onTap: () => print("Clicked"),
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
}
