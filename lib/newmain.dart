import 'package:flutter/material.dart';

class NewmainPage extends StatefulWidget {
  @override
  _NewmainPageState createState() => _NewmainPageState();
}

class _NewmainPageState extends State<NewmainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('รายชื่อสวน'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(56, 163, 165, 10),
          bottom: TabBar(tabs: [
            Tab(
              text: 'ล่าสุด',
            ),
            Tab(text: 'ใกล้สุด'),
            Tab(text: 'ราคาดี'),
            Tab(text: 'แพง'),
          ]),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 50, right: 50),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 300,
                  width: 500,
                  decoration: BoxDecoration(
                    // color: Colors.yellow[600],
                    border: Border.all(
                      color: Color.fromRGBO(56, 163, 165, 10),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                print("Tapped a Container");
                              },
                              child: Container(
                                height: 150,
                                width: 140,
                                child: Image.network(
                                    'https://obs.line-scdn.net/0hgyYWTptTOFZkLhSPeVJHAV54OzlXQitVABhpVThAZmIZTSsAWUskOEcnNW9JSX8ICkB3MUAvI2dPSS8CXkgk/w644'),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Container(
                                          width: 60,
                                          height: 35,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      56, 163, 165, 10)),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(9),
                                            child: Text('1,000'),
                                          ),
                                        ),
                                      ),
                                      Text('เริ่มต้นที่',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(),
                                  child: Column(
                                    children: [
                                      Text('เหลือเวลา 48:00:00',
                                          style: TextStyle(color: Colors.grey))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, left: 230),
                        child: Column(
                          children: [
                            Text('สวนลิ้นจี่คุณจ่า',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            Text('54 ม.3 ต.รอบเวียง อ.เมือง จ.เชียงราย',
                                style: TextStyle(color: Colors.black))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 290),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ButtonTheme(
                                minWidth: 150.0,
                                height: 50,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: RaisedButton(
                                  elevation: 2.0,
                                  hoverColor: Colors.green,
                                  color: Color.fromRGBO(56, 163, 165, 10),
                                  child: Text(
                                    "ประมูล",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
