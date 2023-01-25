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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawer: const NavSidebar(),
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title)),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
