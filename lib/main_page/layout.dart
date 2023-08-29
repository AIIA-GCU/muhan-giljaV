///
/// 메인페이지
/// - (앱의 상단 메뉴 : 메인 페이지) = 1 : 12
/// - 위젯은 모두 같은 크기
///

import 'package:aiia/main_page/my_grade.dart';

import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SafeArea(
                child: Column(children: [
      // 상단 메뉴
      Flexible(
          flex: 1,
          child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black))),
              child: Center(
                  child: Text("상단 메뉴",
                      style: TextStyle(color: Colors.black, fontSize: 16))))),
      // 메인 페이지
      Flexible(
        flex: 12,
        child: Container(
            child: Column(children: [
          // My Grade 위젯
          Flexible(flex: 1, child: MyGrade()),
          // 입시 결과표 위젯
          Flexible(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.black))),
                  child: Center(
                      child: Text("입시 결과표",
                          style:
                              TextStyle(color: Colors.black, fontSize: 16))))),
          // 표 생성 위젯
          Flexible(
              flex: 1,
              child: Container(
                  child: Center(
                      child: Text("표 생성",
                          style:
                              TextStyle(color: Colors.black, fontSize: 16))))),
        ])),
      )
    ]))));
  }
}
