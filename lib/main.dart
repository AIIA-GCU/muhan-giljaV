import 'package:aiia/config.dart';
import 'package:aiia/main_page/layout.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: font_family,
          scaffoldBackgroundColor: Color(app_background)),
      title: "무한길잡이",
      home: HomeLayout(),
    );
  }
}