import 'package:flutter/material.dart';

const Color bgColor = Color(0XFFD3D3D3);

class Mainpage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Row(
            children: [
              Container(
                color: Color.fromRGBO(56, 163, 165, 10),
                width: 360,
                height: 100,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonTheme(
                  minWidth: 80.0,
                  height: 35,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: RaisedButton(
                    elevation: 2.0,
                    hoverColor: Colors.green,
                    color: Colors.grey[100],
                    child: Text(
                      "ล่าสุด",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 10),
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 5),
                ButtonTheme(
                  minWidth: 80.0,
                  height: 35,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: RaisedButton(
                    elevation: 2.0,
                    hoverColor: Colors.green,
                    color: Colors.grey[100],
                    child: Text(
                      "ใกล้สุด",
                      style: TextStyle(
                          color: Color.fromRGBO(105, 105, 105, 105),
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 5),
                ButtonTheme(
                  minWidth: 80.0,
                  height: 35,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: RaisedButton(
                    elevation: 2.0,
                    hoverColor: Colors.green,
                    color: Colors.grey[100],
                    child: Text(
                      "ราคาดี",
                      style: TextStyle(
                          color: Color.fromRGBO(105, 105, 105, 105),
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 5),
                ButtonTheme(
                  minWidth: 80.0,
                  height: 35,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: RaisedButton(
                    elevation: 2.0,
                    hoverColor: Colors.green,
                    color: Colors.grey[100],
                    child: Text(
                      "แพง",
                      style: TextStyle(
                          color: Color.fromRGBO(105, 105, 105, 105),
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            height: MediaQuery.of(context).size.height * 0.35,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 8,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'asset/image/durian.jpg',
                          width: 150,
                          height: 100,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'สวนทุเรียนลุงจ่า',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          '54 ม.3 ต.รอบเวียง อ.เมือง ',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Container(
                                width: 60,
                                height: 35,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(9),
                                  child: Text(' 1,000'),
                                ),
                              ),
                            ),
                            Text('ราคาเริ่มต้นที่')
                          ],
                        ),
                        Text(
                          'เหลือเวลา 2 : 00 : 00 ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        RaisedButton(
                          onPressed: null,
                          child: Text(
                            'ประมูล',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.lightBlue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            height: MediaQuery.of(context).size.height * 0.35,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 8,
               child: Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'asset/image/durian.jpg',
                          width: 150,
                          height: 100,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'สวนทุเรียนลุงจ่า',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          '54 ม.3 ต.รอบเวียง อ.เมือง ',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Container(
                                width: 60,
                                height: 35,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(9),
                                  child: Text(' 1,000'),
                                ),
                              ),
                            ),
                            Text('ราคาเริ่มต้นที่')
                          ],
                        ),
                        Text(
                          'เหลือเวลา 2 : 00 : 00 ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        RaisedButton(
                          onPressed: null,
                          child: Text(
                            'ประมูล',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.lightBlue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
