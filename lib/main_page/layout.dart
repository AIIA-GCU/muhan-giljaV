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
        appBar: AppBar(
          backgroundColor: Color(app_background),
          elevation: 0,
          title: Text("무한길잡이",style: TextStyle(color: Color(font_color_1),fontSize: 16),),
          actions: [
            IconButton(
              icon: Icon(CustomIcon.hamburger_menu, size: 18, color: Color(font_color_1),),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Container())),
                // 햄버거 버튼이 눌렸을 때 수행할 동작을 여기에 작성합니다.
            ),
          ],
        ),
        body: Container(
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Column(
                        children: [
                        // My Grade 위젯 - 이현
                        MyGrade(),
                        // 입시 결과표 위젯 - 호성
                        EntranceChart(),
                        // 표 생성 위젯 - 승우
                        AddAverage()
                      ]
                    )
                )
            )
        )
    );
  }
}
