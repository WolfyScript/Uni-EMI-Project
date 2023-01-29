import 'dart:math';

import 'package:first_flutter_project/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      body: Center(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
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
                        height: 16,
                      ),
                      ...events.entries
                          .map(
                            (e) => createUpcomingBtn(
                              context,
                              e.value.type.label,
                              DateFormat.EEEE('de_DE').format(e.key),
                              DateFormat("dd.MM").format(e.key),
                            ),
                          )
                          .toList()
                          .sublist(
                            0,
                            min(events.length, 3),
                          ),
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
              default:
                return const Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: NewsSummary(),
                );
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
                flex: 3,
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
                  onPressed: () {},
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
              "A precise but not too long title",
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
              height: 16,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.import_contacts_rounded),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Duration")
                  ],
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz_rounded),
                ),
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
