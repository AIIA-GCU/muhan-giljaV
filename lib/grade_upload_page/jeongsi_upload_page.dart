import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:aiia/config/variables.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'select_page.dart';

class SATPage extends StatefulWidget {
  const SATPage({Key? key}) : super(key: key);

  @override
  State<SATPage> createState() => _SATPageState();
}

class _SATPageState extends State<SATPage> {

  String url = " "; // 수능 성적표 사진 표시를 위한 파일 주소
  bool jeongsiPngOn = false;

  //수능 성적표 헤드 부분
  Widget tableHeadText(String id) {
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

  //수능 성적표 헤드 부분
  Widget tableDataText(String id, bool wrote) {
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

  //수능 성적표 화면에 띄우기
  Widget _loadSuNeungPng() {
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
                  // make sure we apply clip it properly
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      alignment: Alignment.center,
                      color: jeongsiPngOn
                          ? Colors.black.withOpacity(0.2)
                          : Colors.black.withOpacity(0.0),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      jeongsiPngOn ?
                      // 수능 성적표 사진 표시를 위한 함수, 버튼 클릭 시 이 함수를 실행해 url 주소를 입력함
                      setState(() {
                        url = "assets/images/suneung.jpg";
                      })
                          : showToast(); // 성적표 사진이 업로드 되지 않을 경우 토스트 메세지 출력
                    },
                    child: Icon(
                      CustomIcon.camera,
                      size: 62,
                      color:
                      jeongsiPngOn ? Color(0xffFFFFFF) : Color(btn_background),
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
                      color: jeongsiPngOn
                          ? Color(0xffFFFFFF)
                          : Color(btn_background),
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
              // 앱바
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
              SizedBox(height: 12),
              // 사진 업로드 위젯
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
                        "수능",
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
                      height:
                      MediaQuery.of(context).size.shortestSide * 0.75,
                      width: double.infinity,
                      child: _loadSuNeungPng(),
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
                            "수능",
                            style: TextStyle(
                              fontWeight: medium,
                              fontSize: font_size[4],
                              color: Color(font_color_1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Color(0xffDBDBDB),
                    ),
                    Table(
                      columnWidths: {
                        0: FractionColumnWidth(.5),
                        1: FractionColumnWidth(.5)
                      },
                      border: TableBorder.symmetric(
                        inside: BorderSide(
                          width: 1,
                          color: Color(0xffDBDBDB),
                        ),
                      ),
                      children: [
                        TableRow(
                          children: [
                            tableHeadText('과목명'),
                            tableHeadText('성적'),
                          ],
                        ),
                        TableRow(
                          children: [
                            tableDataText('국어', true),
                            tableDataText('97', true),
                          ],
                        ),
                        TableRow(
                          children: [
                            tableDataText('영어', true),
                            tableDataText('97', true),
                          ],
                        ),
                        TableRow(
                          children: [
                            tableDataText('수학', true),
                            tableDataText('100', true),
                          ],
                        ),
                        TableRow(
                          children: [
                            tableDataText('한국사', true),
                            tableDataText('100', false),
                          ],
                        ),
                        TableRow(
                          children: [
                            tableDataText('탐구1', true),
                            tableDataText('100', false),
                          ],
                        ),
                        TableRow(
                          children: [
                            tableDataText('탐구2', true),
                            tableDataText('100', false),
                          ],
                        ),
                      ],
                    )
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
                            "산출결과",
                            style: TextStyle(
                              fontWeight: medium,
                              fontSize: font_size[4],
                              color: Color(font_color_1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Color(0xffDBDBDB),
                    ),
                    Table(
                      columnWidths: {
                        0: FractionColumnWidth(.5),
                        1: FractionColumnWidth(.5)
                      },
                      border: TableBorder.symmetric(
                        inside: BorderSide(
                          width: 1,
                          color: Color(0xffDBDBDB),
                        ),
                      ),
                      children: [
                        TableRow(
                          children: [
                            tableHeadText('수능'),
                            tableHeadText('성적'),
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

class main_w extends StatelessWidget {
  const main_w({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      w1(),
      w2()
    ]);
  }
}

class w1 extends StatefulWidget {
  const w1({super.key});

  @override
  State<w1> createState() => _w1State();
}

class _w1State extends State<w1> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class w2 extends StatefulWidget {
  const w2({super.key});

  @override
  State<w2> createState() => _w2State();
}

class _w2State extends State<w2> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
