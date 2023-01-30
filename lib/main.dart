import 'package:uni_emi_muell_guard/pages/calendar.dart';
import 'package:uni_emi_muell_guard/pages/catalog.dart';
import 'package:uni_emi_muell_guard/pages/map.dart';
import 'package:uni_emi_muell_guard/pages/places.dart';
import 'package:uni_emi_muell_guard/pages/settings.dart';
import 'package:uni_emi_muell_guard/pages/start.dart';
import 'package:uni_emi_muell_guard/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    registerEventTypes();
    initializeDateFormatting('de_DE').then((value) => print("Loaded Locale"));
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: "MüllGuard"),
        '/catalog': (context) => const CatalogPage(),
        '/calendar': (context) => const CalendarPage(),
        CatalogArticlePage.routeName: (context) => const CatalogArticlePage(),
        '/map': (context) => const MapPage(),
        '/places': (context) => const PlacesPage(),
        '/settings': (context) => const SettingsPage(),
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: const MaterialColor(
          0xFF4F7555,
          <int, Color>{
            50: Color(0xFFFFF8E1),
            100: Color(0xFFFFECB3),
            200: Color(0xFFFFE082),
            300: Color(0xFFFFD54F),
            400: Color(0xFFFFCA28),
            500: Color(0xFF4F7555),
            600: Color(0xFFFFB300),
            700: Color(0xFFFFA000),
            800: Color(0xFFFF8F00),
            900: Color(0xFFFF6F00),
          },
        ),
      ),
    );
  }
}
