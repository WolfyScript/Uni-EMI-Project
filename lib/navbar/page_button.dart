import 'dart:developer';

import 'package:flutter/material.dart';

class NavPageButton extends StatelessWidget {

  final String label;
  final String pageNamedPath;
  final Icon icon;

  const NavPageButton({super.key, required this.label, required this.icon, required this.pageNamedPath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: TextButton(
        style: TextButton.styleFrom(
          //padding: EdgeInsets.symmetric(vertical: 4),
          foregroundColor: Colors.black87,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, pageNamedPath);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon,
            const SizedBox(
              width: 15,
            ),
            Text(label),
            const Spacer()
          ],
        ),
      ),
    );
  }

}