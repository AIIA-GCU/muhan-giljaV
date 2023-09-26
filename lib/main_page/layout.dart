///
/// 메인페이지
/// - (앱의 상단 메뉴 : 메인 페이지) = 1 : 12
/// - 위젯은 모두 같은 크기
///

import 'package:aiia/config/variables.dart';
import 'package:aiia/main_page/add_average.dart';
import 'package:aiia/main_page/my_grade.dart';
import 'package:aiia/main_page/entrance_chart.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

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
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              child: Stack(children: [
                // 타이틀
                Positioned(top: 0, left: 0, child: AutoSizeText("무한길잡이")),
                // 햄버거 메뉴 아이콘
                Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Container())),
                      child: Icon(CustomIcon.hamburger_menu,
                          size: 18, color: Color(font_color_1)),
                    ))
              ]))),
      // 메인 페이지
      Flexible(
        flex: 12,
        child: SingleChildScrollView(
            child: Column(children: [
          // My Grade 위젯 - 이현
          MyGrade(),
          // 입시 결과표 위젯 - 호성
          EntranceChart(),
          // 표 생성 위젯 - 승우
          AddAverage()
        ])),
      )
    ]))));
  }
}
