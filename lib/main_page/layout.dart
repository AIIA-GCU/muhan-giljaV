///
/// 메인페이지
/// - (앱의 상단 메뉴 : 메인 페이지) = 1 : 12
/// - 위젯은 모두 같은 크기
///

import 'package:aiia/config.dart';
import 'package:aiia/main_page/my_grade.dart';
import 'package:aiia/main_page/major_info.dart';

import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  // 설정 페이지 이동
  void _migratePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Container()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(/*color: Colors.pink,*/
            child: SafeArea(
                child: Column(children: [
      // 상단 메뉴
      Flexible(
          flex: 1,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              child: Stack(children: [
                // 타이틀
                Positioned(top: 0, left: 0, child: Text("무한길잡이")),
                // 햄버거 메뉴 아이콘
                Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _migratePage,
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
          Column(
              children: [
                MajorInfo(),
                //여기로 여러 학과 정보들이 MajorInfo위젯 형태로 추가 되어야 겠죠?
              ]
          ),
          // 표 생성 위젯 - 승우
          Container(
              height: 296,
              child: Center(
                  child: Text("표 생성",
                      style:
                          TextStyle(color: Colors.black, fontSize: 16)))),
        ])),
      )
    ]))));
  }
}
