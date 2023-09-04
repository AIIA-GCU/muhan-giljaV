import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _value = "-1";
  var _comboValue = "-1"; // New variable for the combo box value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Stack(
        children: [
          Positioned(
            top: 180,
            child: Container(
              height: 300.0, //박스 크기 조절
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white ,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child:Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 7.0),//icon add average 위치 조정
                    child:Row(
                      children: [
                        Icon(Icons.auto_graph_outlined),
                        SizedBox(width: 8),
                        Column(
                          children: [
                            Text(
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
                    child:Column(
                      children: [
                        Divider(
                          color: Colors.black26,
                          thickness: 1.0,
                        ),
                      ],
                    ),
                  ), //경계선
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),//간격
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 1.0),//크기조절
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        value: _value,
                        items: [
                          DropdownMenuItem(child: Text("-select City-"), value: "-1"),
                          DropdownMenuItem(child: Text("-select City-"),value:"1",),
                          DropdownMenuItem(child: Text("-select City-"),value:"2",),
                          DropdownMenuItem(child: Text("-select City-"),value:"3",),
                          DropdownMenuItem(child: Text("-select City-"),value:"4",),
                          DropdownMenuItem(child: Text("-select City-"),value:"5",),
                        ],
                        onChanged: (v) {
                          setState(() {
                            _value = v.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),//간격
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 1.0),//크기조절
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        value: _value,
                        items: [
                          DropdownMenuItem(child: Text("-select City-"), value: "-1"),
                          DropdownMenuItem(child: Text("-select City-"),value:"1",),
                          DropdownMenuItem(child: Text("-select City-"),value:"2",),
                          DropdownMenuItem(child: Text("-select City-"),value:"3",),
                          DropdownMenuItem(child: Text("-select City-"),value:"4",),
                          DropdownMenuItem(child: Text("-select City-"),value:"5",),
                        ],
                        onChanged: (v) {
                          setState(() {
                            _value = v.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0), //간격
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 1.0),//크기조절
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        value: _comboValue, // Use the new variable for value
                        items: [
                          DropdownMenuItem(child: Text("-select Option-"), value: "-1"),
                          DropdownMenuItem(child: Text("-select City-"),value:"1",),
                          DropdownMenuItem(child: Text("-select City-"),value:"2",),

                        ],
                        onChanged: (v) {
                          setState(() {
                            _comboValue = v.toString(); // Update the new variable
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height:15.0),//dropdown버튼과 등록하기 버튼 사이 간격
                  Center(
                    child: Container(
                      height: 40.0,
                      width: MediaQuery.of(context).size.width - 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ElevatedButton(onPressed: () {},
                        child:Text('등록하기'),
                      ),
                    ),
                  ),//등록하기 버튼
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




