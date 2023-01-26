import 'dart:math';

import 'package:flutter/material.dart';

import '../navbar/nav_sidebar.dart';

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
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            switch(index) {
              case 0:
                return Column(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.calendar_today_rounded),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Anstehend",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  createUpcomingBtn(context, "Gelber Sack", "Freitag", "15.03"),
                  const SizedBox(
                    height: 8,
                  ),
                  createUpcomingBtn(context, "Altpapier", "Montag", "18.03"),
                  const SizedBox(
                    height: 8,
                  ),
                  createUpcomingBtn(context, "Restmüll", "Mittwoch", "27.03"),
                  const SizedBox(
                    height: 32,
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
              );
              default:
                return const NewsSummary();
            }
          },
        ),
      ),
    );
  }

  Widget createUpcomingBtn(
      BuildContext context, String type, String day, String date) {
    return ElevatedButton(
      onPressed: () {},
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        backgroundColor: MaterialStatePropertyAll(
          MaterialColor(0xFFCCEEDD, <int, Color>{0: Color(0xFFCCEEDD)}),
        ),
      ),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
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
                const SizedBox(
                  width: 16,
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
            Text(
              type,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
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
                onPressed: () {},
                icon: const Icon(Icons.calendar_month_rounded),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsSummary extends StatelessWidget {
  const NewsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Title",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: MaterialColor(
                  0xFF4F7555,
                  <int, Color>{0: Color(0xFF4F7555)},
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                child: Image.asset(
                  'assets/test-image.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(Icons.import_contacts_rounded),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Duration")
                  ],
                ),
                const Icon(Icons.more_horiz_rounded)
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
          ],
        ),
      ),
    );
  }
}
