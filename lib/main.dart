import 'package:first_flutter_project/navbar/nav_sidebar.dart';
import 'package:first_flutter_project/pages/calendar.dart';
import 'package:first_flutter_project/pages/catalog.dart';
import 'package:first_flutter_project/pages/map.dart';
import 'package:first_flutter_project/pages/places.dart';
import 'package:first_flutter_project/pages/settings.dart';
import 'package:first_flutter_project/pages/start.dart';
import 'package:first_flutter_project/utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    registerEventTypes();
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: "MüllGuard"),
        '/catalog': (context) => const CatalogPage(),
        '/calendar': (context) => const CalendarPage(),
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


