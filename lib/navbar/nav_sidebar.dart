import 'package:first_flutter_project/navbar/page_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class NavSidebar extends StatelessWidget {
  const NavSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    var mainNavElementStyle = TextButton.styleFrom(
      //padding: EdgeInsets.symmetric(vertical: 4),
      foregroundColor: Colors.black87,
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );

    return Drawer(
      backgroundColor:
          const MaterialColor(0xFFCED8D0, <int, Color>{0: Color(0xFFCED8D0)}),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              key: const Key("navigation_and_search"),
              children: [
                Container(
                  key: const Key("search"),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const Center(
                    child: TextField(
                      style: TextStyle(),
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                        hintText: 'Suche',
                      ),
                    ),
                  ),
                ),
                Column(
                  key: const Key("navigation"),
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          NavPageButton(icon: Icon(Icons.home_rounded), label: 'Start', pageNamedPath: '/',),
                          NavPageButton(icon: Icon(Icons.calendar_month_rounded), label: 'Kalender', pageNamedPath: '/calendar',),
                          NavPageButton(icon: Icon(Icons.library_books_rounded), label: 'Katalog', pageNamedPath: '/catalog',),
                          NavPageButton(icon: Icon(Icons.map_rounded), label: 'Karte', pageNamedPath: '/map',),
                          NavPageButton(icon: Icon(Icons.place_rounded), label: 'Abholorte', pageNamedPath: '/places',),
                          SizedBox(
                            height: 40,
                          ),
                          NavPageButton(icon: Icon(Icons.settings_rounded), label: 'Einstellungen', pageNamedPath: '/settings',),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              key: const Key("footer"),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Divider(
                  color: Colors.black87,
                  thickness: 0.25,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Über Uns"),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Datenschutz"),
                ),
                TextButton(onPressed: () {}, child: const Text("Impressum"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
