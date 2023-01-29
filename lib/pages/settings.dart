import 'package:uni_emi_muell_guard/navbar/nav_sidebar.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavSidebar(),
      appBar: AppBar(
        title: const Text("Einstellungen"),
      ),
    );
  }

}
