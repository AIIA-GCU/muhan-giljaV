///
/// My Grade 위젯
/// - Size (width : height) = 345 : 200
/// - 아이콘 추가해야 함
///

import 'package:aiia/config/variables.dart';
import 'package:aiia/grade_upload_page/select_page.dart';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MyGrade extends StatefulWidget {
  const MyGrade({super.key});

  @override
  State<MyGrade> createState() => _MyGradeState();
}

class _MyGradeState extends State<MyGrade> {
  bool isUpload = false;

  // 성적 관련 변수
  // 위에서부터 학년별 평균, 전체 평균, 산출 결과
  List<double> avgs = [0.0, 0.0, 0.0];
  double total_avg = 0.0;
  double reuslt = 0.0;

  // 성적 업로드 페이지 이동
  void _migratePage() {
    Navigator.of(context).push(
      PageRouteBuilder(
        // 슬라이드 애니메이션
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(-1.0, 0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(
            CurveTween(
              curve: curve,
            ),
          );
          return SlideTransition(
            position:
            animation.drive(tween),
            child: child,
          );
        },
        // 이동할 페이지
        pageBuilder: (context, animation, secondaryAnimation) => SelectPage(),
        // Dialog로 취급 안함
        fullscreenDialog: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 200,
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(widget_background)),
            child: Column(children: [
              // 타이틀
              Container(
                  height: 34,
                  child: Stack(children: [
                    // 아이콘
                    Positioned(
                      top: 11,
                      left: 11,
                      child: Row(
                        children: [
                          Icon(CustomIcon.document, size: 22, color: Color(btn_background)),
                          SizedBox(width: 4,),
                          AutoSizeText("My Grade",
                              style: TextStyle(
                                  fontWeight: medium,
                                  fontSize: font_size[4],
                                  color: Color(font_color_1)
                              )
                          )
                        ],
                      ),
                    ),
                    // 수정 버튼
                    if (isUpload)
                      Positioned(
                          top: 11,
                          right: 11,
                          child: GestureDetector(
                              onTap: _migratePage,
                              child: Icon(CustomIcon.edit,
                                  size: 20, color: Color(btn_background))))
                  ])),
              // 구분선
              Container(height: 1,margin: EdgeInsets.only(left: 0,top: 11,right: 0,bottom: 0),color: Color(line_color)),
              // 성적
              Expanded(
                  child: isUpload
                      // 성적이 업로드 된 경우
                      ? Container(
                          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 11),
                              child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(children: [
                                      AutoSizeText("1",
                                          style: TextStyle(
                                              fontWeight: regular,
                                              fontSize: font_size[1],
                                              color: Color(font_color_2))),
                                      AutoSizeText(avgs[0].toString(),
                                          style: TextStyle(
                                              fontWeight: bold,
                                              fontSize: font_size[3],
                                              color: Color(font_color_1)))
                                    ]),
                                    Column(children: [
                                      AutoSizeText("2",
                                          style: TextStyle(
                                              fontWeight: regular,
                                              fontSize: font_size[1],
                                              color: Color(font_color_2))),
                                      AutoSizeText(avgs[1].toString(),
                                          style: TextStyle(
                                              fontWeight: bold,
                                              fontSize: font_size[3],
                                              color: Color(font_color_1)))
                                    ]),
                                    Column(children: [
                                      AutoSizeText("3",
                                          style: TextStyle(
                                              fontWeight: regular,
                                              fontSize: font_size[1],
                                              color: Color(font_color_2))),
                                      AutoSizeText(avgs[2].toString(),
                                          style: TextStyle(
                                              fontWeight: bold,
                                              fontSize: font_size[3],
                                              color: Color(font_color_1)))
                                    ])
                                  ]),
                            ),
                            const Divider(
                                height: 1,
                                thickness: 1,
                                color: Color(line_color)),
                            Expanded(
                                child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                  Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AutoSizeText("나의 총 평균",
                                            style: TextStyle(
                                                fontWeight: regular,
                                                fontSize: font_size[1],
                                                color: Color(font_color_2))),
                                        AutoSizeText(total_avg.toString(),
                                            style: TextStyle(
                                                fontWeight: bold,
                                                fontSize: font_size[5],
                                                color: Color(font_color_1)))
                                      ]),
                                  VerticalDivider(
                                      width: 1,
                                      thickness: 1,
                                      color: Color(line_color)),
                                  Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AutoSizeText("가천대식 평균",
                                            style: TextStyle(
                                                fontWeight: regular,
                                                fontSize: font_size[1],
                                                color: Color(font_color_2))),
                                        AutoSizeText(reuslt.toString(),
                                            style: TextStyle(
                                                fontWeight: bold,
                                                fontSize: font_size[5],
                                                color: Color(font_color_1)))
                                      ])
                                ]))
                          ]))
                      // 성적이 업로드 되지 않은 경우
                      : Center(
                          child: GestureDetector(
                              onTap: _migratePage,
                              child: Icon(CustomIcon.add,
                                  size: 52, color: Color(btn_background)))))
            ])));
  }
}
