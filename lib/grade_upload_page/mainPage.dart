import 'package:flutter/material.dart';
import 'package:aiia/satPage.dart';
import 'package:aiia/schPage.dart';

import 'package:aiia/config.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainIntroductionPageState();
}

class _MainIntroductionPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: font_family),
        title: "무한길잡이",
        home: Scaffold(
            body: ListView(
          children: [
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
                        onPressed: () {},
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
                    height: 150,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 17, 0, 0),
                            alignment: Alignment.topCenter,
                            child: Text(
                              "시험을 선택하세요.",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: medium,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Color(btn_background),
                                ),
                                width:
                                MediaQuery.of(context).size.shortestSide * 0.375,
                                height: 50,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        transitionsBuilder:
                                            // secondaryAnimation: 화면 전화시 사용되는 보조 애니메이션효과
                                            // child: 화면이 전환되는 동안 표시할 위젯을 의미(즉, 전환 이후 표시될 위젯 정보를 의미)
                                            (context, animation,
                                                secondaryAnimation, child) {
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
                                            SCHPage(),
                                        // 이것을 true로 하면 dialog로 취급한다.
                                        // 기본값은 false
                                        fullscreenDialog: false,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    '교과',
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 18,
                                        fontWeight: regular),
                                  ),
                                ),
                              ),
                              Container(
                                width: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Color(0xff00438C),
                                ),
                                width:
                                MediaQuery.of(context).size.shortestSide * 0.375,
                                height: 50,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        transitionsBuilder:
                                            // secondaryAnimation: 화면 전화시 사용되는 보조 애니메이션효과
                                            // child: 화면이 전환되는 동안 표시할 위젯을 의미(즉, 전환 이후 표시될 위젯 정보를 의미)
                                            (context, animation,
                                                secondaryAnimation, child) {
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
                                            SATPage(),
                                        // 이것을 true로 하면 dialog로 취급한다.
                                        // 기본값은 false
                                        fullscreenDialog: false,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    '수능',
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 18,
                                        fontWeight: regular),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 11,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )));
  }
}
