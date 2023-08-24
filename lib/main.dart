///
/// 메인페이지
/// - (앱의 상단 메뉴 : 메인 페이지) = 1 : 12
/// - 위젯은 모두 같은 크기
///

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "무한길잡이",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(),
        child: SafeArea(child: Column(
          children: [
            // 상단 메뉴
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.black
                    )
                  ),
                  color: Colors.grey.shade300
                ),
                child: Center(child: Text(
                  "상단 메뉴",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16
                  )
                ))
              )
            ),
            // 메인 페이지
            Flexible(
              flex: 12,
              child: Container(
                child: Column(children: [
                  // My Grade 위젯
                  Flexible(
                      flex: 1,
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Colors.black
                                  )
                              )
                          ),
                          child: Center(child: Text(
                              "My Grade",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16
                              )
                          ))
                      )
                  ),
                  // 입시 결과표 위젯
                  Flexible(
                      flex: 1,
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Colors.black
                                  )
                              )
                          ),
                          child: Center(child: Text(
                              "입시 결과표",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16
                              )
                          ))
                      )
                  ),
                  // 표 생성 위젯
                  Flexible(
                      flex: 1,
                      child: Container(
                          child: Center(child: Text(
                              "표 생성",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16
                              )
                          ))
                      )
                  ),
                ])
              ),
            )
          ]
        ))
      )
    );
  }
}
