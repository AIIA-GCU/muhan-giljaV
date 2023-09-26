import 'package:aiia/config/variables.dart';
import 'package:aiia/main_page/layout.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    device_size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: font_family),
      title: "무한길잡이",
      home: HomeLayout(),
    );
  }
}