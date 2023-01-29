import 'package:uni_emi_muell_guard/navbar/nav_sidebar.dart';
import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {

  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: const NavSidebar(),
      appBar: AppBar(
        title: const Text("Karte"),
      ),
    );
  }

}
