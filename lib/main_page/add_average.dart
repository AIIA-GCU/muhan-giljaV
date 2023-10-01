import 'dart:async';

import 'package:aiia/main_page/entrance_chart.dart';
import 'package:flutter/material.dart';
import 'package:aiia/config/variables.dart';
import 'package:fluttertoast/fluttertoast.dart';

// 스트림 컨트롤러
StreamController<Map<int, List<String>>> addavg_sctr = StreamController<Map<int, List<String>>>.broadcast();

// 메인
class AddAverage extends StatefulWidget {
  const AddAverage({super.key});

  @override
  State<AddAverage> createState() => _AddAverageState();
}
class _AddAverageState extends State<AddAverage> {
  // 위젯에 필요한 요소
  double H = 296;
  Stream<Map<int, List<String>>> stream = addavg_sctr.stream;
  
  // 대학
  String selectedDropdownItem1 = "대학을 선택하세요";
  bool isDropdownOpen1 = false;
  List<String> colleges = [
    "가천리버럴아츠칼리지",
    "경영대학",
    "사회과학대학",
    "인문대학",
    "법과대학",
    "IT융합대학"
  ];
  // 학부&학과
  String selectedDropdownItem2 = "학부/학과를 선택하세요";
  bool isDropdownOpen2 = false;
  List<String> departments = [
    "AI/SW 학부",
    "컴퓨터공학부",
    "전기공학부",
    "전기공학과",
    "스마트시티융합부"
  ];
  // 전형
  String selectedDropdownItem3 = "전형을 선택하세요";
  List<String> selectedOptions = [];
  bool isDropdownOpen3 = false;
  List<String> examinations = [
    "교과우수",
    "가천바람개비",
    "농어촌",
    "지역균형",
    "논술"
  ];

  // 차트 등록하기
  void regist() {
    // 유효성 검사
    if (selectedDropdownItem2 == "학부/학과를 선택하세요")
      Fluttertoast.showToast(
        msg: '학부를 선택해주세요',
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Color(app_background),
        textColor: Color(font_color_1),
        toastLength: Toast.LENGTH_SHORT,
      );
    else if (selectedOptions.isEmpty)
      Fluttertoast.showToast(
        msg: '전형을 1개 이상 선택해주세요',
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Color(app_background),
        textColor: Color(font_color_1),
        toastLength: Toast.LENGTH_SHORT,
      );
    else {
      // 반영
      chart_sctr.add({ selectedDropdownItem2 : selectedOptions.toList() });
      setState(() {
        selectedDropdownItem1 = "대학을 선택하세요";
        selectedDropdownItem2 = "학부/학과를 선택하세요";
        selectedDropdownItem3 = "전형을 선택하세요";
        selectedOptions.clear();
      });
    }
  }

  // 업데이트
  void update(Map<int, List<String>> m) {
    if (mounted) {
      setState(() {
        int key = m.keys.first;
        if (key == 0) {
          H = 296;
          isDropdownOpen1 = false;
          isDropdownOpen2 = false;
          isDropdownOpen3 = false;
        }
        else if (key == 1) {
          H = 296;
          selectedDropdownItem1 = m[key]![0];
          isDropdownOpen1 = false;
        }
        else if (key == 2) {
          H = 296;
          selectedDropdownItem2 = m[key]![0];
          isDropdownOpen2 = false;
        }
        else if (key == 3) {
          selectedOptions = m[key]!;
          if (m[key]!.length == 0)
            selectedDropdownItem3 = "전형을 선택하세요";
          else if (m[key]!.length == 1)
            selectedDropdownItem3 = m[key]!.first;
          else
            selectedDropdownItem3 =
            "${m[key]!.first} 외 ${m[key]!.length - 1}개";
        }
      });
    }
  }

  @override
  void initState() {
    stream.listen((event) => update(event));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: H,
      margin: EdgeInsets.fromLTRB(24, 6, 24, 12),
      child: LayoutBuilder(builder: (context, constraints) =>
        Stack(
          children: [
            // 프레임
            Positioned(
              child: Container(
                height: 296,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 타이틀
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 7.0),
                      child: Row(children: [
                        Icon(CustomIcon.statistic, size: 22, color: Color(btn_background)),
                        SizedBox(width: 8),
                        Text(
                          'Add Average',
                          style: TextStyle(
                              fontWeight: medium,
                              fontSize: font_size[4],
                              color: Color(font_color_1))
                        )
                      ])
                    ),
                    Container(height: 1,margin: EdgeInsets.only(left: 0,top: 11,right: 0,bottom: 0),color: Color(line_color)),
                    SizedBox(height: 10),
                    // 대학
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDropdownOpen1 = !isDropdownOpen1;
                          isDropdownOpen2 = false;
                          isDropdownOpen3 = false;
                          H = 327;
                        });
                      },
                      child: ClosedDropdown(
                        text: selectedDropdownItem1,
                        isClosed: isDropdownOpen1
                      )
                    ),
                    SizedBox(height: 10.0),
                    // 학부&학과
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDropdownOpen1 = false;
                          isDropdownOpen2 = !isDropdownOpen2;
                          isDropdownOpen3 = false;
                          H = 380;
                        });
                      },
                      child: ClosedDropdown(
                          text: selectedDropdownItem2,
                          isClosed: isDropdownOpen2
                      )
                    ),
                    SizedBox(height: 10.0),
                    // 전형
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDropdownOpen1 = false;
                          isDropdownOpen2 = false;
                          isDropdownOpen3 = !isDropdownOpen3;
                          H = 434;
                        });
                      },
                      child: ClosedDropdown(
                        text: selectedDropdownItem3,
                        isClosed: isDropdownOpen3
                      )
                    ),
                    SizedBox(height: 26.0),
                    // 등록하기 버튼
                    ElevatedButton(
                      onPressed: regist,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:Color(btn_background), //버튼 배경화면 //색깔 문제!!!
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(313, 44), //버튼 크기
                      ),
                      child: Text(
                        '등록하기',
                        style: TextStyle(
                          color: Colors.white, // 텍스트 색상 변경 가능
                          fontSize: 14, // 필요에 따라 글꼴 크기 변경
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // 대학 드롭다운
            if (isDropdownOpen1)
              OpenDropdown(w: constraints.maxWidth, type: 1, data: colleges),
            // 학부&학과 드롭다운
            if (isDropdownOpen2)
              OpenDropdown(w: constraints.maxWidth, type: 2, data: departments),
            // 전형 드롭다운
            if (isDropdownOpen3)
              OpenDropdown(w: constraints.maxWidth, type: 3, data: examinations)
          ],
        ),
      ),
    );
  }
}

// 닫혔을 때 드롭다운
class ClosedDropdown extends StatelessWidget {
  const ClosedDropdown({super.key, required this.text, required this.isClosed});

  final String text;
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: EdgeInsets.all(3),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color(app_background),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Color(app_background), width: 1.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical:9.0),
              child: Text(text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: regular,
                  color: Color(font_color_2)))
          ),
          Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child:Icon(
                isClosed ? CustomIcon.chevron_up : CustomIcon.chevron_down,
                size:17,
                color:Color(isClosed ? font_color_1 : font_color_2),
              )
          )
        ],
      ),
    );
  }
}

// 열렸을 때 드롭다운
class OpenDropdown extends StatefulWidget {
  const OpenDropdown({
    super.key,
    required this.w,
    required this.type,
    required this.data,
  });

  final int type;
  final double w;
  final List<String> data;

  @override
  State<OpenDropdown> createState() => _OpenDropdownState();
}
class _OpenDropdownState extends State<OpenDropdown> {

  late final double top;
  ScrollController _scrollController = ScrollController();
  List<String> tmp = [];

  @override
  void initState() {
    if (widget.type == 1) top = 107;
    else if (widget.type == 2) top = 160;
    else if (widget.type == 3) top = 214;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: Container(
        width: widget.w - 32,
        height: 220,
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Color(app_background),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Scrollbar(
          thickness: 6.0,
          radius: Radius.circular(3),
          thumbVisibility: true,
          controller: _scrollController,
          child: ListView.separated(
            controller: _scrollController,
            itemCount: widget.data.length,
            separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(left: 6, right: 12),
              child: Container(height: 1, color: Color(0xFFCAD2DB)),
            ),
            itemBuilder: (context, index) {
              if (widget.type == 3)
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (tmp.contains(widget.data[index]))
                        tmp.remove(widget.data[index]);
                      else tmp.add(widget.data[index]);
                      addavg_sctr.add({ 3 : tmp });
                    });
                  },
                  child: LayoutBuilder(builder: (context, constrains) =>
                    Container(
                      width: constrains.maxWidth,
                      color: Color(app_background),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(11.0), //아이콘과 텍스트 사이의 간격
                            child: Icon(
                              CustomIcon.check,
                              size:24.0,
                              color: tmp.contains(widget.data[index])
                                  ? Color(btn_background) //체크된 상태의 아이콘 색상
                                  : Color(line_color), //체크되지 않은 상태의 아이콘 색상
                            ),
                          ),
                          Text(widget.data[index],
                              style: TextStyle(
                                  fontSize: font_size[2],
                                  fontWeight: regular,
                                  color: Color(font_color_1))
                          )
                        ]
                      ),
                    ),
                  )
                );
              else return ListTile(
                title: Text(widget.data[index],
                    style: TextStyle(
                      fontSize: font_size[2],
                      fontWeight: regular,
                      color: Color(font_color_1),
                    )),
                onTap: () =>addavg_sctr.add({ widget.type : [widget.data[index]] })
              );
            }
          ),
        ),
      ),
    );
  }
}
