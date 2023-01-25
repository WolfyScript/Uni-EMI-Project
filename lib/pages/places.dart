import 'package:first_flutter_project/navbar/nav_sidebar.dart';
import 'package:flutter/material.dart';

class PlacesPage extends StatelessWidget {

  const PlacesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: const NavSidebar(),
      appBar: AppBar(
        title: const Text("Abholorte"),
      ),
    );
  }

}
