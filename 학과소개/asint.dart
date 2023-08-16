import 'package:flutter/material.dart';
import 'package:gcuprojects/introduction.dart';

import 'mainpage.dart';

class DepartmentIntroductionPage extends StatelessWidget {
  const DepartmentIntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'hello',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Container(
            padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(48, 63, 159, 1),
              Color.fromRGBO(41, 182, 246, 1)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.shortestSide * 0.075,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Container(
                        height: double.infinity,
                        child: FittedBox(
                          alignment: Alignment.bottomRight,
                          fit: BoxFit.fill,
                          child: Transform.scale(
                            scale: 1.85,
                            origin: Offset(0, 10),
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "◁",
                                style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 5,
                      ),
                      Container(
                        height: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  transitionsBuilder:
                                      // secondaryAnimation: 화면 전화시 사용되는 보조 애니메이션효과
                                      // child: 화면이 전환되는 동안 표시할 위젯을 의미(즉, 전환 이후 표시될 위젯 정보를 의미)
                                      (context, animation, secondaryAnimation,
                                          child) {
                                    // Offset에서 x값 1은 오른쪽 끝 y값 1은 아래쪽 끝을 의미한다.
                                    // 애니메이션이 시작할 포인트 위치를 의미한다.
                                    var begin = const Offset(1.0, 0);
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
                                      MainIntroductionPage(),
                                  // 이것을 true로 하면 dialog로 취급한다.
                                  // 기본값은 false
                                  fullscreenDialog: false,
                                ),
                              );
                            },
                            child: Text(
                              "학과 소개",
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "▷",
                            style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  transitionsBuilder:
                                      // secondaryAnimation: 화면 전화시 사용되는 보조 애니메이션효과
                                      // child: 화면이 전환되는 동안 표시할 위젯을 의미(즉, 전환 이후 표시될 위젯 정보를 의미)
                                      (context, animation, secondaryAnimation,
                                          child) {
                                    // Offset에서 x값 1은 오른쪽 끝 y값 1은 아래쪽 끝을 의미한다.
                                    // 애니메이션이 시작할 포인트 위치를 의미한다.
                                    var begin = const Offset(1.0, 0);
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
                                      CollegeIntroductionPage(),
                                  // 이것을 true로 하면 dialog로 취급한다.
                                  // 기본값은 false
                                  fullscreenDialog: false,
                                ),
                              );
                            },
                            child: Text(
                              "IT 융합대학",
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "▷",
                            style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "AI 소프트웨어학부",
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 3,
                ),
                Container(
                  height: 3,
                  color: Color.fromRGBO(84, 173, 255, 1),
                ),
                Expanded(
                    child: ListView(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(50),
                          top: Radius.circular(25),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.4),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 175,
                      child: Column(
                        children: [
                          Container(
                            height: 8,
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            height: 6,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(32, 126, 214, 1),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              width: 145,
                            ),
                          ),
                          Container(
                            height: 4,
                          ),
                          Container(
                            // color: Colors.purple.withOpacity(0.2),
                            height: 146,
                            child: Row(
                              children: [
                                Container(
                                  // color: Colors.black.withOpacity(0.2),
                                  width: 292,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 20, 0),
                                        alignment: Alignment.bottomRight,
                                        height: 83,
                                        // color: Colors.red,
                                        child: Text(
                                          "AI 소프트웨어학부",
                                          style: TextStyle(
                                              fontSize: 33,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 20, 0),
                                        alignment: Alignment.bottomRight,
                                        height: 53,
                                        // color: Colors.yellow,
                                        child: Text(
                                          "소프트웨어 전공 / 인공지능 전공",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Transform.scale(
                                  origin: Offset(0, 0),
                                  scale: 1.16,
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    width: 120,
                                    // color: Colors.yellow.withOpacity(0.2),
                                    child: Icon(
                                      Icons.access_time_outlined,
                                      size: 150,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 12,
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      height: 6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(144, 187, 226, 1),
                              borderRadius: BorderRadius.circular(2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.4),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 4), // changes position of shadow
                                ),
                              ],
                            ),
                            width: 275,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 12,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.4),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 110,
                      child: Row(
                        children: [
                          Container(
                            // color: Colors.black.withOpacity(0.2),
                            padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                            width: 312,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(15, 0, 20, 0),
                                  alignment: Alignment.bottomLeft,
                                  height: 43,
                                  // color: Colors.red,
                                  child: Text(
                                    "2024년 입학정원",
                                    style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(25, 0, 20, 0),
                                  alignment: Alignment.topLeft,
                                  // color: Colors.red,
                                  child: Text(
                                    "소프트웨어 전공 : 100명",
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(25, 0, 20, 0),
                                  alignment: Alignment.topLeft,
                                  // color: Colors.red,
                                  child: Text(
                                    "인공지능 전공 : 150명",
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(32, 126, 214, 1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            height: 86,
                            width: 5,
                          ),
                          Transform.scale(
                            origin: Offset(0, 0),
                            scale: 1.16,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              alignment: Alignment.center,
                              width: 120,
                              // color: Colors.yellow.withOpacity(0.2),
                              child: Icon(
                                Icons.access_time_outlined,
                                size: 90,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.4),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 345,
                      child: Container(
                        // color: Colors.black.withOpacity(0.2),
                        padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                        width: 312,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(18, 5, 0, 0),
                              alignment: Alignment.center,
                              height: 43,
                              // color: Colors.red,
                              child: Row(
                                children: [
                                  Container(
                                    child: Text(
                                      "교육과정",
                                      style: TextStyle(
                                        fontSize: 27,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    // color: Colors.yellow,
                                    width: 380,
                                  ),
                                  Container(
                                    // color: Colors.green,
                                    child: Transform.scale(
                                      scale: 1.7,
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.add_circle_outline,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(27, 0, 0, 0),
                              width: double.infinity,
                              child: Text(
                                '소프트웨어 전공 + 경영학기초 (부전공 수준)',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(27, 0, 0, 0),
                              width: double.infinity,
                              child: Text(
                                '소프트웨어 전공:\n• - 3,4학년 대상 심화과정 운영\n• ① Big Data 트랙\n• ② Smart Systems 트랙',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(27, 0, 0, 0),
                              width: double.infinity,
                              child: Text(
                                '소프트웨어 전공:\n• - 3,4학년 대상 심화과정 운영\n• ① Big Data 트랙\n• ② Smart Systems 트랙\n• ③ Smart Systems 트랙',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 15,
                    ),
                    Container(
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.4),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.fromLTRB(18, 5, 0, 0),
                            child: Text(
                              "교육과정 이수 체계",
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          Container(
                            height: 7,
                          ),
                          Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 175,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(32, 126, 214, 1),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(.2),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: Offset(
                                            0, 4), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "data",
                                      style: TextStyle(fontSize: 30, color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 55,
                                  height: 50,
                                ),
                                Container(
                                  width: 175,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(32, 126, 214, 1),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(.2),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: Offset(
                                            0, 4), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "data",
                                      style: TextStyle(fontSize: 30, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 15,
                    ),
                    Container(
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.4),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            // color: Colors.black.withOpacity(0.2),
                            width: 292,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  alignment: Alignment.bottomLeft,
                                  height: 56,
                                  // color: Colors.red,
                                  child: Text(
                                    "학과 사무실:",
                                    style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  alignment: Alignment.bottomLeft,
                                  // color: Colors.red,
                                  child: Text(
                                    "031-150-8659",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                Container(
                                  height: 15,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  alignment: Alignment.bottomLeft,
                                  // color: Colors.red,
                                  child: Text(
                                    "swdm@gachon.ac.kr",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  alignment: Alignment.bottomLeft,
                                  // color: Colors.red,
                                  child: Text(
                                    "sw@gachon.ac.kr",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // color: Colors.yellow.withOpacity(0.2),
                            child: IconButton(
                              iconSize: 140,
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_circle_outline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(height: 13),
                    Container(
                      decoration: BoxDecoration(),
                      height: 6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(144, 187, 226, 1),
                              borderRadius: BorderRadius.circular(2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.4),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 4), // changes position of shadow
                                ),
                              ],
                            ),
                            width: 275,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 32,
                    ),
                  ],
                )),
              ],
            ),
          ),
        ));
  }
}
