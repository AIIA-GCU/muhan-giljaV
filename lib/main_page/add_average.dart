import 'package:flutter/material.dart';
import 'package:aiia/config/variables.dart';



class AddAverage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            MyExpansionTile(title: 'Drawer 1'),
            MyExpansionTile(title: 'Drawer 2'),
            MyExpansionTile(title: 'Drawer 3'),
            ElevatedButton(
              onPressed: () {},
              child: Text('Button'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyExpansionTile extends StatelessWidget {
  final String title;

  const MyExpansionTile({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      children: [
        ListTile(
          title: Text('Option 1'),
          onTap: () {},
        ),
        ListTile(
          title: Text('Option 2'),
          onTap: () {},
        ),
        // 여기에 더 많은 ListTile 위젯을 추가할 수 있습니다.
      ],
    );
  }
}
/*

class _AddAverageState extends State<AddAverage> {
  String selectedDropdownItem1 = "대학을 선택하세요.";
  String selectedDropdownItem2 = "학부/학과를 선택하세요.";
  String dropdownTitle3 = "전형을 선택하세요.";
  bool isDropdownOpen1 = false;
  bool isDropdownOpen2 = false;
  bool isDropdownOpen3 = false;
  List<String> selectedOptions = [];
  double H = 296;
  ScrollController _scrollController = ScrollController();

  TextStyle dropdownTextStyle = TextStyle(
    fontSize: 15, // dropdown 글자 크기 설정
    fontWeight: FontWeight.w400,
    color: Color(font_color_1), // dropdown 글자 색상 설정
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: H,
      child: Stack(
        children: [
          // 메인
          Positioned(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 7.0),
                    child: Row(
                      children: [
                        Icon(CustomIcon.statistic, size: 22, color: Color(btn_background)),
                        SizedBox(width: 8),
                        Column(
                          children: [
                            Text(
                              'Add Average',
                              style: TextStyle(
                                  fontWeight: medium,
                                  fontSize: font_size[4],
                                  color: Color(font_color_1)
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        //구분선
                        Container(height: 1,margin: EdgeInsets.only(left: 0,top: 11,right: 0,bottom: 0),color: Color(line_color)),
                        SizedBox(height: 10),
                        // CustomDropdown 위젯 사용 예제 1:
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isDropdownOpen1 = !isDropdownOpen1;
                              H = 326;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color:Color(app_background),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Color(app_background), // 테두리 색상을 원하는 색으로 변경
                                width: 1.0, // 테두리 두께를 조절
                              ),
                            ),
                            width: 313,
                            height: 44,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:const EdgeInsets.symmetric(horizontal: 6.0, vertical:9.0),
                                  child:Text(
                                    selectedDropdownItem1,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color:Color(font_color_2), //텍스트 색상
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right:10.0), //화살표의 위치 조절
                                  child:Icon(
                                    isDropdownOpen1
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    size:17,
                                    color:Color(font_color_2), //화살표 색상
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        // CustomDropdown 위젯 사용 예제 2:
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isDropdownOpen2 = !isDropdownOpen2;
                              H = 336;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color:Color(app_background),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Color(app_background), // 테두리 색상을 원하는 색으로 변경
                                width: 1.0, // 테두리 두께를 조절
                              ),
                            ),
                            width: 313,
                            height: 44,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:const EdgeInsets.symmetric(horizontal: 6.0, vertical:9.0),
                                  child:Text(
                                    selectedDropdownItem2,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color:Color(font_color_2), //텍스트 색상
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right:10.0), //화살표의 위치 조절
                                  child:Icon(
                                    isDropdownOpen2
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    size:17,
                                    color:Color(font_color_2), //화살표 색상
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isDropdownOpen3 = !isDropdownOpen3;
                              isDropdownOpen3 ? H = 395 : H = 296;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color:Color(app_background),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Color(app_background), // 테두리 색상을 원하는 색으로 변경
                                width: 1.0, // 테두리 두께를 조절
                              ),
                            ),
                            width: 313,
                            height: 44,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:const EdgeInsets.symmetric(horizontal: 6.0, vertical:9.0),
                                  child: Text(
                                    selectedOptions.length == 0
                                        ? dropdownTitle3
                                        : selectedOptions.length == 1
                                        ? selectedOptions[0]
                                        : selectedOptions[0] + ' 외 ${selectedOptions.length - 1}개' , // Dropdown title을 변수로 설정
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color:Color(font_color_2),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right:10.0), //화살표의 위치 조절
                                  child:Icon(
                                    isDropdownOpen3
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    size:17,
                                    color:Color(font_color_2), //화살표 색상
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {},
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
                ],
              ),
            ),
          ),
          if (isDropdownOpen1)
            Positioned(
              top: 107,// Dropdown이 열렸을 때, 위치 조절
              left:20,
              child: Container(
                width:313,
                height:220,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Color(app_background), //dropdown 색상
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child:Scrollbar(
                  controller: _scrollController,
                  thickness: 6.0,// 스크롤 컨트롤러 두께
                  child:SingleChildScrollView(
                    child: Column(
                      children: [
                        ListTile(
                          title:Padding(
                            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                            child:Text("가천리버럴아츠칼리지",style:dropdownTextStyle),
                          ),
                          onTap: () {
                            setState(() {
                              selectedDropdownItem1 = "가천리버럴아츠칼리지";
                              isDropdownOpen1 = false;
                              H = 296;
                            });
                          },
                        ),
                        Container(height: 1,margin: EdgeInsets.only(left: 0,top:0,right: 0,bottom: 0),color: Color(line_color)),//구분선
                        Padding(
                          padding: EdgeInsets.all(0.1),
                          child:ListTile(
                            title: Text("경영대학",style:dropdownTextStyle),
                            onTap: () {
                              setState(() {
                                selectedDropdownItem1 = "경영대학";
                                isDropdownOpen1 = false;
                                H = 296;
                              });
                            },
                          ),
                        ),
                        Container(height: 1,margin: EdgeInsets.only(left: 0,top:0,right: 0,bottom: 0),color: Color(line_color)),
                        Padding(
                          padding:EdgeInsets.all(0.1),
                          child:ListTile(
                            title: Text("사회과학대학",style:dropdownTextStyle),
                            onTap: () {
                              setState(() {
                                selectedDropdownItem1 = "사회과학대학";
                                isDropdownOpen1 = false;
                                H = 296;
                              });
                            },
                          ),
                        ),

                        Container(height: 1,margin: EdgeInsets.only(left: 0,top:0,right: 0,bottom: 0),color: Color(line_color)),
                        Padding(
                          padding:EdgeInsets.all(0.1),
                          child:
                          ListTile(
                            title: Text("인문대학",style:dropdownTextStyle),
                            onTap: () {
                              setState(() {
                                selectedDropdownItem1 = "인문대학";
                                isDropdownOpen1 = false;
                                H = 296;
                              });
                            },
                          ),
                        ),
                        Container(height: 1,margin: EdgeInsets.only(left: 0,top:0,right: 0,bottom: 0),color: Color(line_color)),
                        Padding(
                          padding: EdgeInsets.all(0.1),
                          child:ListTile(
                            title: Text("법과대학",style:dropdownTextStyle),
                            onTap: () {
                              setState(() {
                                selectedDropdownItem1 = "법과대학";
                                isDropdownOpen1 = false;
                                H = 296;
                              });
                            },
                          ),
                        ),
                        Container(height: 1,margin: EdgeInsets.only(left: 0,top:0,right: 0,bottom: 0),color: Color(line_color)),
                        Padding(
                          padding: EdgeInsets.all(0.1),
                          child:ListTile(
                            title: Text("IT융합대학",style:dropdownTextStyle),
                            onTap: () {
                              setState(() {
                                selectedDropdownItem1 = "IT융합대학";
                                isDropdownOpen1 = false;
                                H = 296;
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          if (isDropdownOpen2)
            Positioned(
              top: 161, // Dropdown이 열렸을 때, 위치 조절
              left:20,
              child: Container(
                width:313,
                height:216,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Color(app_background),//dropdown 색상
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child:Scrollbar(
                  controller: _scrollController,
                  thickness: 6.0,// 스크롤 컨트롤러 두께
                  child:SingleChildScrollView(
                    controller: _scrollController, // 스크롤 컨트롤러를 설정합니다.
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(0.1),
                          child:ListTile(
                            title: Text("AI/SW학부",style:dropdownTextStyle),
                            onTap: () {
                              setState(() {
                                selectedDropdownItem2 = "AI/SW학부";
                                isDropdownOpen2 = false;
                                H = 296;
                              });
                            },
                          ),
                        ),
                        Container(height: 1,margin: EdgeInsets.only(left: 0,top:0,right: 0,bottom: 0),color: Color(line_color)),
                        Padding(
                          padding: EdgeInsets.all(0.1),
                          child:ListTile(
                            title: Text("컴퓨터공학부",style:dropdownTextStyle),
                            onTap: () {
                              setState(() {
                                selectedDropdownItem2 = "컴퓨터공학부";
                                isDropdownOpen2 = false;
                                H = 296;
                              });
                            },
                          ),
                        ),
                        Container(height: 1,margin: EdgeInsets.only(left: 0,top:0,right: 0,bottom: 0),color: Color(line_color)),
                        Padding(
                          padding: EdgeInsets.all(0.1),
                          child:ListTile(
                            title: Text("전기공학부",style:dropdownTextStyle),
                            onTap: () {
                              setState(() {
                                selectedDropdownItem2 = "전기공학부";
                                isDropdownOpen2 = false;
                                H = 296;
                              });
                            },
                          ),
                        ),
                        Container(height: 1,margin: EdgeInsets.only(left: 0,top:0,right: 0,bottom: 0),color: Color(line_color)),
                        Padding(
                          padding: EdgeInsets.all(0.1),
                          child:ListTile(
                            title: Text("전기공학과",style:dropdownTextStyle),
                            onTap: () {
                              setState(() {
                                selectedDropdownItem2 = "전기공학과";
                                isDropdownOpen2 = false;
                                H = 296;
                              });
                            },
                          ),
                        ),
                        Container(height: 1,margin: EdgeInsets.only(left: 0,top:0,right: 0,bottom: 0),color: Color(line_color)),
                        Padding(
                          padding: EdgeInsets.all(0.1),
                          child:ListTile(
                            title: Text("스마트시티융합과",style:dropdownTextStyle),
                            onTap: () {
                              setState(() {
                                selectedDropdownItem2 = "스마트시티융합과";
                                isDropdownOpen2 = false;
                                H = 296;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          if (isDropdownOpen3)
            Positioned(
              top: 215, // Dropdown이 열렸을 때, 위치 조절
              left:20,
              child: Container(
                width:313,
                height:216,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Color(app_background), //dropdown색상
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child:Scrollbar(
                  controller: _scrollController,
                  thickness: 6.0,// 스크롤 컨트롤러 두께
                  child:SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedOptions.contains("교과우수")) {
                                  selectedOptions.remove("교과우수");
                                } else {
                                  selectedOptions.add("교과우수");
                                }
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.all(11.0), //아이콘과 텍스트 사이의 간격
                              child: Icon(
                                CustomIcon.check,
                                size:24.0,
                                color: selectedOptions.contains("교과우수")
                                    ?Color(btn_background) //체크된 상태의 아이콘 색상
                                    :Color(line_color), //체크되지 않은 상태의 아이콘 색상
                              ),
                            ),
                          ),
                            Text("교과우수", style: dropdownTextStyle),
                          ],
                        ),
                        Container(height: 1,margin: EdgeInsets.only(left: 0,top:0,right: 0,bottom: 0),color: Color(line_color)),
                        Row(
                          children: [GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedOptions.contains("가천바람개비")) {
                                  selectedOptions.remove("가천바람개비");
                                } else {
                                  selectedOptions.add("가천바람개비");
                                }
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.all(11.0), //아이콘과 텍스트 사이의 간격
                              child: Icon(
                                CustomIcon.check,
                                size:24.0,
                                color: selectedOptions.contains("가천바람개비")
                                    ?Color(btn_background) //체크된 상태의 아이콘 색상
                                    :Color(line_color), //체크되지 않은 상태의 아이콘 색상
                              ),
                            ),
                          ),
                            Text("가천바람개비", style: dropdownTextStyle),
                          ],
                        ),
                        Container(height: 1,margin: EdgeInsets.only(left: 0,top:0,right: 0,bottom: 0),color: Color(line_color)),
                        Row(
                          children: [GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedOptions.contains("농어촌")) {
                                  selectedOptions.remove("농어촌");
                                } else {
                                  selectedOptions.add("농어촌");
                                }
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.all(11.0), //아이콘과 텍스트 사이의 간격
                              child: Icon(
                                CustomIcon.check,
                                size:24.0,
                                color: selectedOptions.contains("농어촌")
                                    ?Color(btn_background) //체크된 상태의 아이콘 색상
                                    :Color(line_color), //체크되지 않은 상태의 아이콘 색상
                              ),
                            ),
                          ),
                            Text("농어촌", style: dropdownTextStyle),
                          ],
                        ),
                        Container(height: 1,margin: EdgeInsets.only(left: 0,top:0,right: 0,bottom: 0),color: Color(line_color)),
                        Row(
                          children: [GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedOptions.contains("지역균형")) {
                                  selectedOptions.remove("지역균형");
                                } else {
                                  selectedOptions.add("지역균형");
                                }
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.all(11.0), //아이콘과 dropdown 테두리 간격
                              child: Icon(
                                CustomIcon.check,
                                size:24.0,
                                color: selectedOptions.contains("지역균형")
                                    ?Color(btn_background) //체크된 상태의 아이콘 색상
                                    :Color(line_color), //체크되지 않은 상태의 아이콘 색상
                              ),
                            ),
                          ),
                            Text("지역균형", style: dropdownTextStyle),
                          ],
                        ),
                        Container(height: 1,margin: EdgeInsets.only(left: 0,top:0,right: 0,bottom: 0),color: Color(line_color)),
                        Row(
                          children: [GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedOptions.contains("논술")) {
                                  selectedOptions.remove("논술");
                                } else {
                                  selectedOptions.add("논술");
                                }
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.all(11.0), //아이콘과 텍스트 사이의 간격
                              child: Icon(
                                CustomIcon.check,
                                size:24.0,
                                color: selectedOptions.contains("논술")
                                    ?Color(btn_background) //체크된 상태의 아이콘 색상
                                    :Color(line_color), //체크되지 않은 상태의 아이콘 색상
                              ),
                            ),
                          ),
                            Text("논술", style: dropdownTextStyle),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
*/
