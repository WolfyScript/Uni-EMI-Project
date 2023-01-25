import 'package:first_flutter_project/navbar/nav_sidebar.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {

  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavSidebar(),
      appBar: AppBar(
        title: const Text("Kalender"),
      ),
    );
  }

}