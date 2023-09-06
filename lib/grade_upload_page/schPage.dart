import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:aiia/config.dart';
import 'mainPage.dart';

class SCHPage extends StatefulWidget {
  const SCHPage({Key? key}) : super(key: key);

  @override
  State<SCHPage> createState() => _SCHPageState();
}

class _SCHPageState extends State<SCHPage> {
  String url = " "; // 교과 성적표 사진 표시를 위한 파일 주소
  bool suSiPngOn = false;

  //교과 성적표 헤드 부분
  Widget _tableHeadText(String id) {
    return Container(
      height: 53,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
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
          Text(
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
                  // make sure we apply clip it properly
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      alignment: Alignment.center,
                      color: suSiPngOn
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
              IconButton(
                  onPressed: () {
                    // 수능 성적표 사진 표시를 위한 함수, 버튼 클릭 시 이 함수를 실행해 url 주소를 입력함
                    setState(() {
                      url = " ";
                    });
                    suSiPngOn = false;
                  },
                  icon: Icon(
                    Icons.close_rounded,
                    color: Color(app_background),
                    size: 50,
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // 수능 성적표 사진 표시를 위한 함수, 버튼 클릭 시 이 함수를 실행해 url 주소를 입력함
                      setState(() {
                        url = "assets/images/suneung.jpg";
                      });
                      suSiPngOn = true;
                    },
                    child: Icon(
                      CustomIcon.camera,
                      size: 62,
                      color: suSiPngOn
                          ? Color(0xffFFFFFF)
                          : Color(btn_background),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Text(
                    "성적 업로드",
                    style: TextStyle(
                      fontWeight: medium,
                      fontSize: font_size[4],
                      color: suSiPngOn
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          color: Color(app_background),
          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Column(
            children: [
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
                          transitionsBuilder:
                          // secondaryAnimation: 화면 전화시 사용되는 보조 애니메이션효과
                          // child: 화면이 전환되는 동안 표시할 위젯을 의미(즉, 전환 이후 표시될 위젯 정보를 의미)
                              (context, animation, secondaryAnimation,
                              child) {
                            // Offset에서 x값 1은 오른쪽 끝 y값 1은 아래쪽 끝을 의미한다.
                            // 애니메이션이 시작할 포인트 위치를 의미한다.
                            var begin = const Offset(-1.0, 0);
                            var end = Offset.zero;
                            // Curves.ease: 애니메이션이 부드럽게 동작하도록 명령
                            var curve = Curves.ease;
                            // 애니메이션의 시작과 끝을 담당한다.
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
                          // 함수를 통해 Widget을 pageBuilder에 맞는 형태로 반환하게 해야한다.
                          pageBuilder: (context, animation,
                              secondaryAnimation) =>
                          // (DetailScreen은 Stateless나 Stateful 위젯으로된 화면임)
                          MainPage(),
                          // 이것을 true로 하면 dialog로 취급한다.
                          // 기본값은 false
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
                      child: Text(
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
                      height:
                      MediaQuery.of(context).size.shortestSide * 0.75,
                      width: double.infinity,
                      child: _loadSuSiPng(),
                    ),
                  ],
                ),
              ),
              Container(
                height: 15,
              ),
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
                          Text(
                            "1학년 1학기",
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
                      height: 2.4,
                      width: double.infinity,
                      color: Color(0xffDBDBDB),
                    ),
                    Table(
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
                            _tableDataText('국어', true),
                            _tableDataText('교과', false),
                            _tableDataText('97', true),
                          ],
                        ),
                        TableRow(
                          children: [
                            _tableDataText('영어', true),
                            _tableDataText('교과', false),
                            _tableDataText('87', true),
                          ],
                        ),
                        TableRow(
                          children: [
                            _tableDataText('수학', true),
                            _tableDataText('교과', false),
                            _tableDataText('88', true),
                          ],
                        ),
                        TableRow(
                          children: [
                            _tableDataText('한국사', false),
                            _tableDataText('교과', false),
                            _tableDataText('100', false),
                          ],
                        ),
                        TableRow(
                          children: [
                            _tableDataText('탐구1', false),
                            _tableDataText('교과', false),
                            _tableDataText('100', false),
                          ],
                        ),
                        TableRow(
                          children: [
                            _tableDataText('탐구2', false),
                            _tableDataText('교과', false),
                            _tableDataText('100', false),
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
                          Text(
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
