import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:aiia/config/variables.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'select_page.dart';
import 'dart:math' as math;

class SCHPage extends StatefulWidget {
  const SCHPage({Key? key}) : super(key: key);

  @override
  State<SCHPage> createState() => _SCHPageState();
}

class _SCHPageState extends State<SCHPage> {
  String url = " "; // 교과 성적표 사진 표시를 위한 파일 주소
  bool susiPngOn = false;
  List grade = ['1학년 1학기', '1학년 2학기', '2학년 1학기', '2학년 2학기', '3학년 1학기'];
  int gradeSelector = 0;

  //교과 성적표 헤드 부분
  Widget _tableHeadText(String id) {
    return Container(
      height: 53,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            id,
            style: TextStyle(
              fontSize: font_size[4],
              color: Color(font_color_2),
              fontWeight: regular,
            ),
          )
        ],
      ),
    );
  }

  //교과 성적표 헤드 부분
  Widget _tableDataText(String id, bool wrote) {
    return Container(
      height: 53,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            id,
            style: wrote
                ? TextStyle(
                    //성적 입력 여부에 따라 글자 색 변경
                    fontSize: font_size[4],
                    color: Color(0xff191919),
                    fontWeight: regular,
                  )
                : TextStyle(
                    fontSize: font_size[4],
                    color: Color(0xff999999),
                    fontWeight: regular,
                  ),
          )
        ],
      ),
    );
  }

  //교과 성적표 화면에 띄우기
  Widget _loadSuSiPng() {
    return Stack(
      children: [
        // 수정 버튼
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: Color(app_background),
          ),
          child: Center(
            child: Stack(children: [
              Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(url),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      alignment: Alignment.center,
                      color: susiPngOn
                          ? Colors.black.withOpacity(0.2)
                          : Colors.black.withOpacity(0.0),
                    ),
                  ),
                ),
              ),
              // Image(
              //   width: double.infinity,
              //   height: double.infinity,
              //   image: AssetImage(url),
              //   fit: BoxFit.fitWidth,
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      susiPngOn
                          ? setState(() => url = "assets/images/suneung.jpg")
                          : showToast();
                    },
                    child: Icon(
                      CustomIcon.camera,
                      size: 62,
                      color: susiPngOn ? Color(0xffFFFFFF) : Color(btn_background),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  AutoSizeText(
                    "성적 업로드",
                    style: TextStyle(
                      fontWeight: medium,
                      fontSize: font_size[4],
                      color: susiPngOn ? Color(0xffFFFFFF) : Color(btn_background),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _loadGrade(
      String a,
      String b,
      String c,
      String d,
      String e,
      String f,
      String a1,
      String b1,
      String c1,
      String d1,
      String e1,
      String f1,
      String a2,
      String b2,
      String c2,
      String d2,
      String e2,
      String f2,
      bool a3,
      bool b3,
      bool c3,
      bool d3,
      bool e3,
      bool f3) {
    return Table(
      columnWidths: {
        0: FractionColumnWidth(.36),
        1: FractionColumnWidth(.3),
        2: FractionColumnWidth(.34),
      },
      border: TableBorder.symmetric(
          inside: BorderSide(
        width: 2.4,
        color: Color(0xffDBDBDB),
      )),
      children: [
        TableRow(
          children: [
            _tableHeadText('과목명'),
            _tableHeadText('교과 / 비교과'),
            _tableHeadText('성적'),
          ],
        ),
        TableRow(
          children: [
            _tableDataText(a, a3),
            _tableDataText(a1, a3),
            _tableDataText(a2, a3),
          ],
        ),
        TableRow(
          children: [
            _tableDataText(b, b3),
            _tableDataText(b1, b3),
            _tableDataText(b2, b3),
          ],
        ),
        TableRow(
          children: [
            _tableDataText(c, c3),
            _tableDataText(c1, c3),
            _tableDataText(c2, c3),
          ],
        ),
        TableRow(
          children: [
            _tableDataText(d, d3),
            _tableDataText(d1, d3),
            _tableDataText(d2, d3),
          ],
        ),
        TableRow(
          children: [
            _tableDataText(e, e3),
            _tableDataText(e1, e3),
            _tableDataText(e2, e3),
          ],
        ),
        TableRow(
          children: [
            _tableDataText(f, f3),
            _tableDataText(f1, f3),
            _tableDataText(f2, f3),
          ],
        ),
      ],
    );
  }

  void showToast() {
    Fluttertoast.showToast(
      msg: '사진이 업로드되지 않았습니다.',
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          color: Color(app_background),
          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Column(
            children: [
              // 앱 바
              Container(
                alignment: Alignment.centerLeft,
                child: Transform.translate(
                  offset: Offset(-10, 0),
                  child: IconButton(
                    icon: Icon(
                      color: Colors.black,
                      Icons.arrow_back_rounded,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(
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
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                          // 이동할 페이지
                          pageBuilder: (context, animation, secondaryAnimation) => SelectPage(),
                          // Dialog로 취급 안함
                          fullscreenDialog: false,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                height: 12,
              ),
              // 이미지 업로드 위젯
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Color(widget_background),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 17, 0, 0),
                      alignment: Alignment.topCenter,
                      child: AutoSizeText(
                        "교과",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: font_size[4],
                          fontWeight: medium,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Color(widget_background),
                      ),
                      padding: EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.shortestSide * 0.75,
                      width: double.infinity,
                      child: _loadSuSiPng(),
                    ),
                  ],
                ),
              ),
              Container(
                height: 15,
              ),
              // 이미지 분석표 위젯
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Color(widget_background),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(11),
                      child: Stack(
                        children: [
                          Positioned(
                            child: Row(
                              children: [
                                //아이콘
                                Icon(CustomIcon.document,
                                    size: 20, color: Color(btn_background)),
                                Container(
                                  width: 4,
                                ),
                                // 이름
                                AutoSizeText(
                                  grade[gradeSelector],
                                  style: TextStyle(
                                    fontWeight: medium,
                                    fontSize: font_size[4],
                                    color: Color(font_color_1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: Row(
                              children: [
                                Transform.scale(
                                  scale: 1.75,
                                  child: Transform.rotate(
                                    angle: 90 * math.pi / 180,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (gradeSelector > 0)
                                            gradeSelector = gradeSelector - 1;
                                        });
                                      },
                                      child: Icon(
                                        CustomIcon.chevron_down,
                                        color: Color(font_color_1),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20,
                                ),
                                Transform.scale(
                                  scale: 1.75,
                                  child: Transform.rotate(
                                    angle: 90 * math.pi / 180,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (gradeSelector < 4)
                                            gradeSelector = gradeSelector + 1;
                                        });
                                      },
                                      child: Icon(
                                        CustomIcon.chevron_up,
                                        color: Color(font_color_1),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 5,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 2.4,
                      width: double.infinity,
                      color: Color(0xffDBDBDB),
                    ),
                    if (gradeSelector == 0)
                      _loadGrade(
                          '국어',
                          '영어',
                          '수학(상)',
                          '한국사',
                          '통합과학',
                          '통합사회',
                          '교과',
                          '교과',
                          '교과',
                          '교과',
                          '교과',
                          '교과',
                          '97',
                          '87',
                          '88',
                          '100',
                          '100',
                          '100',
                          true,
                          true,
                          true,
                          false,
                          false,
                          false),
                    if (gradeSelector == 1)
                      _loadGrade(
                          '국어',
                          '영어',
                          '수학(하)',
                          '한국사',
                          '통합과학',
                          '통합사회',
                          '교과',
                          '교과',
                          '교과',
                          '교과',
                          '교과',
                          '교과',
                          '97',
                          '87',
                          '88',
                          '100',
                          '100',
                          '100',
                          true,
                          true,
                          true,
                          false,
                          false,
                          false),
                    if (gradeSelector == 2)
                      _loadGrade(
                          '국어',
                          '영어',
                          '수학 I',
                          '한국사',
                          '물리학 I',
                          '화학 I',
                          '교과',
                          '교과',
                          '교과',
                          '교과',
                          '교과',
                          '교과',
                          '97',
                          '87',
                          '88',
                          '100',
                          '100',
                          '100',
                          true,
                          true,
                          true,
                          false,
                          false,
                          false),
                    if (gradeSelector == 3)
                      _loadGrade(
                          '국어',
                          '영어',
                          '수학 II',
                          '한국사',
                          '물리학 II',
                          '화학 II',
                          '교과',
                          '교과',
                          '교과',
                          '교과',
                          '교과',
                          '교과',
                          '97',
                          '87',
                          '100',
                          '21',
                          '12',
                          '46',
                          true,
                          true,
                          true,
                          false,
                          false,
                          false),
                    if (gradeSelector == 4)
                      _loadGrade(
                          '언어와 매체',
                          '영어',
                          '미적분',
                          '한국사',
                          '탐구1',
                          '탐구2',
                          '교과',
                          '교과',
                          '교과',
                          '교과',
                          '교과',
                          '교과',
                          '12',
                          '87',
                          '21',
                          '100',
                          '100',
                          '100',
                          true,
                          true,
                          true,
                          false,
                          false,
                          false),
                  ],
                ),
              ),
              Container(
                height: 15,
              ),
              // 산출 결과 위젯
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Color(widget_background),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(11),
                      child: Row(
                        children: [
                          //아이콘
                          Icon(CustomIcon.document,
                              size: 20, color: Color(btn_background)),
                          Container(
                            width: 4,
                          ),
                          // 이름
                          AutoSizeText(
                            "산출 결과",
                            style: TextStyle(
                              fontWeight: medium,
                              fontSize: font_size[4],
                              color: Color(font_color_1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Table(
                      columnWidths: {
                        0: FractionColumnWidth(.36),
                        1: FractionColumnWidth(.3),
                        2: FractionColumnWidth(.34),
                      },
                      border: TableBorder.all(
                        width: 2,
                        color: Color(app_background),
                      ),
                      children: [
                        TableRow(
                          children: [
                            _tableHeadText('학년 학기'),
                            _tableHeadText('비교과 반영'),
                            _tableHeadText('비교과 미반영'),
                          ],
                        ),
                        TableRow(
                          children: [
                            _tableDataText('1학년 1학기', true),
                            _tableDataText('성적', true),
                            _tableDataText('성적', true),
                          ],
                        ),
                        TableRow(
                          children: [
                            _tableDataText('1학년 2학기', true),
                            _tableDataText('성적', true),
                            _tableDataText('성적', true),
                          ],
                        ),
                        TableRow(
                          children: [
                            _tableDataText('2학년 1학기', true),
                            _tableDataText('성적', true),
                            _tableDataText('성적', true),
                          ],
                        ),
                        TableRow(
                          children: [
                            _tableDataText('2학년 2학기', true),
                            _tableDataText('성적', true),
                            _tableDataText('성적', true),
                          ],
                        ),
                        TableRow(
                          children: [
                            _tableDataText('3학년 1학기', true),
                            _tableDataText('성적', true),
                            _tableDataText('성적', true),
                          ],
                        ),
                        TableRow(
                          children: [
                            _tableDataText('3학년 2학기', true),
                            _tableDataText('성적', true),
                            _tableDataText('성적', true),
                          ],
                        ),
                      ],
                    ),
                    Table(
                      columnWidths: {
                        0: FractionColumnWidth(.5),
                        1: FractionColumnWidth(.5),
                      },
                      children: [
                        TableRow(
                          children: [
                            _tableDataText('가천대식 성적', true),
                            _tableDataText('성적', true),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 55,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
