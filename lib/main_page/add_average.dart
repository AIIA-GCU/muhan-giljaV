import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AddAverage extends StatefulWidget {
  const AddAverage({super.key});

  @override
  State<AddAverage> createState() => _AddAverageState();
}
class _AddAverageState extends State<AddAverage> {
  String selectedDropdownItem1 = "대학을 선택하세요";
  String selectedDropdownItem2 = "학부/학과를 선택하세요";
  String dropdownTitle3 = "전형을 선택하세요";
  bool isDropdownOpen1 = false;
  bool isDropdownOpen2 = false;
  bool isDropdownOpen3 = false;
  List<String> selectedOptions = [];
  double H = 296;

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
              margin: EdgeInsets.symmetric(horizontal: 20.0),
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
                        Icon(Icons.auto_graph_outlined),
                        SizedBox(width: 8),
                        Column(
                          children: [
                            AutoSizeText(
                              'Add Average',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
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
                        Divider(
                          color: Colors.black26,
                          thickness: 1.0,
                        ),
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
                            color: Colors.white70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  selectedDropdownItem1,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Icon(
                                  isDropdownOpen1
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
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
                            color: Colors.white70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  selectedDropdownItem2,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Icon(
                                  isDropdownOpen2
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isDropdownOpen3 = !isDropdownOpen3;
                              isDropdownOpen3 ? H = 395 : H = 296;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(3),
                            color: Colors.white,  // dropdown되기 전 색상
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  selectedOptions.length == 0
                                      ? dropdownTitle3
                                      : selectedOptions.length == 1
                                      ? selectedOptions[0]
                                      : selectedOptions[0] + ' 외 ${selectedOptions.length - 1}개' , // Dropdown title을 변수로 설정
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Icon(
                                  isDropdownOpen3
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 26.0),
                        Center(
                          child: Container(
                            height: 40.0,
                            width: MediaQuery.of(context).size.width - 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: AutoSizeText('등록하기'),
                            ),
                          ),
                        ),//등록하기 버튼
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isDropdownOpen1)
            Positioned(
              top: 90, // Dropdown이 열렸을 때, 위치 조절
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: AutoSizeText("가천리버럴아츠칼리지"),
                      onTap: () {
                        setState(() {
                          selectedDropdownItem1 = "가천리버럴아츠칼리지";
                          isDropdownOpen1 = false;
                          H = 296;
                        });
                      },
                    ),
                    ListTile(
                      title: AutoSizeText("경영대학"),
                      onTap: () {
                        setState(() {
                          selectedDropdownItem1 = "경영대학";
                          isDropdownOpen1 = false;
                          H = 296;
                        });
                      },
                    ),
                    ListTile(
                      title: AutoSizeText("사회과학대학"),
                      onTap: () {
                        setState(() {
                          selectedDropdownItem1 = "사회과학대학";
                          isDropdownOpen1 = false;
                          H = 296;
                        });
                      },
                    ),
                    ListTile(
                      title: AutoSizeText("인문대학"),
                      onTap: () {
                        setState(() {
                          selectedDropdownItem1 = "인문대학";
                          isDropdownOpen1 = false;
                          H = 296;
                        });
                      },
                    ),
                    ListTile(
                      title: AutoSizeText("법과대학"),
                      onTap: () {
                        setState(() {
                          selectedDropdownItem1 = "법과대학";
                          isDropdownOpen1 = false;
                          H = 296;
                        });
                      },
                    ),
                    ListTile(
                      title: AutoSizeText("IT융합대학"),
                      onTap: () {
                        setState(() {
                          selectedDropdownItem1 = "IT융합대학";
                          isDropdownOpen1 = false;
                          H = 296;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          if (isDropdownOpen2)
            Positioned(
              top: 140, // Dropdown이 열렸을 때, 위치 조절
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: AutoSizeText("AI.소프트웨어 학부"),
                      onTap: () {
                        setState(() {
                          selectedDropdownItem2 = "AI.소프트웨어 학부";
                          isDropdownOpen2 = false;
                          H = 296;
                        });
                      },
                    ),
                    ListTile(
                      title: AutoSizeText("컴퓨터공학부"),
                      onTap: () {
                        setState(() {
                          selectedDropdownItem2 = "컴퓨터공학부";
                          isDropdownOpen2 = false;
                          H = 296;
                        });
                      },
                    ),
                    ListTile(
                      title: AutoSizeText("전자공학부"),
                      onTap: () {
                        setState(() {
                          selectedDropdownItem2 = "전자공학부";
                          isDropdownOpen2 = false;
                          H = 296;
                        });
                      },
                    ),
                    ListTile(
                      title: AutoSizeText("전기공학과"),
                      onTap: () {
                        setState(() {
                          selectedDropdownItem2 = "전기공학과";
                          isDropdownOpen2 = false;
                          H = 296;
                        });
                      },
                    ),
                    ListTile(
                      title: AutoSizeText("스마트시티융합학과"),
                      onTap: () {
                        setState(() {
                          selectedDropdownItem2 = "스마트시티융합학과";
                          isDropdownOpen2 = false;
                          H = 296;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          if (isDropdownOpen3)
            Positioned(
              top: 200, // Dropdown이 열렸을 때, 위치 조절
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white, //dropdown색상
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: AutoSizeText("교과우수"),
                      trailing: Checkbox(
                        value: selectedOptions.contains("교과우수"),
                        onChanged: (value) {
                          setState(() {
                            if (value != null) {
                              if (value) {
                                selectedOptions.add("교과우수");
                              } else {
                                selectedOptions.remove("교과우수");
                              }
                            }
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: AutoSizeText("가천바람개비"),
                      trailing: Checkbox(
                        value: selectedOptions.contains("가천바람개비"),
                        onChanged: (value) {
                          setState(() {
                            if (value != null) {
                              if (value) {
                                selectedOptions.add("가천바람개비");
                              } else {
                                selectedOptions.remove("가천바람개비");
                              }
                            }
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: AutoSizeText("농어촌"),
                      trailing: Checkbox(
                        value: selectedOptions.contains("농어촌"),
                        onChanged: (value) {
                          setState(() {
                            if (value != null) {
                              if (value) {
                                selectedOptions.add("농어촌");
                              } else {
                                selectedOptions.remove("농어촌");
                              }
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
