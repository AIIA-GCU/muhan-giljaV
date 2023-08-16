import 'package:flutter/material.dart';
import 'package:gcuprojects/introduction.dart';
import 'asint.dart';

class MainIntroductionPage extends StatefulWidget {
  const MainIntroductionPage({ Key? key }) : super(key: key);

  @override
  State<MainIntroductionPage> createState() => _MainIntroductionPageState();
}

class _MainIntroductionPageState extends State<MainIntroductionPage> {

  Widget DepartmentList(String id) {
    return InkWell(
      onTap: (){
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
      child: Container(
        height: 50,
        width: 120,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
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
        child: Container(
          alignment: Alignment.center,
          // color: Colors.black.withOpacity(0.3),
          child: Text(
            id,
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
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
                  Color.fromRGBO(41, 182, 246, 1),
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
                            onPressed: () {},
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
                          height: 135,
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
                              Expanded(
                                flex: 7,
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  // color: Colors.black.withOpacity(0.3),
                                  height: double.infinity,
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      "학과소개",
                                      style: TextStyle(
                                        fontSize: 70,
                                        color: Colors.black,
                                      ),
                                    ),

                                  ),
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
                          height: 5,
                        ),
                        DepartmentList('가천리버럴아츠칼리지'),
                        DepartmentList('경영대학'),
                        DepartmentList('사회과학대학'),
                        DepartmentList('인문대학'),
                        DepartmentList('법과대학'),
                        DepartmentList('공과대학'),
                        DepartmentList('바이오나노대학'),
                        DepartmentList('IT융합대학'),
                        DepartmentList('한의과대학'),
                        DepartmentList('예술·체육대학'),
                        DepartmentList('미래산업대학'),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}