import 'package:flutter/material.dart';
import 'package:catppuccin_flutter/catppuccin_flutter.dart';

import 'pages_layout.dart';
import 'screens/home.dart';
import 'theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: catppuccinTheme(catppuccin.latte),
        darkTheme: catppuccinTheme(catppuccin.macchiato),
        home: PagesLayout(child: Home()));
  }
}
