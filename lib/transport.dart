import 'package:flutter/material.dart';

class Transport extends StatefulWidget {
  @override
  _TransportState createState() => _TransportState();
}

class _TransportState extends State<Transport> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(0, 196, 154, 10),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'ทั้งหมด',
                ),
                Tab(
                  text: 'กำลังส่ง',
                ),
                Tab(
                  text: 'ส่งแล้ว',
                ),
              ],
            ),
            title: Center(
              child: Text(
                'ขนส่ง',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Scaffold(
                backgroundColor: Colors.grey[200],
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: 500,
                        height: 140,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/rambutan.jpg',
                                width: 150,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Column(
                                      children: [
                                        Text(
                                          'สวนเงาะลุงจ่า',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 30),
                                          child: Text(
                                            'ประมูลเสร็จสิ้น',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  56, 163, 165, 10),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 25),
                                          child: Row(
                                            children: [
                                              Text('สถานะ: '),
                                              Text(
                                                'กำลังส่ง',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      251, 143, 103, 10),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Scaffold(
                backgroundColor: Colors.grey[200],
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: 500,
                        height: 140,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/rambutan.jpg',
                                width: 150,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Column(
                                      children: [
                                        Text(
                                          'สวนเงาะลุงจ่า',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 30),
                                          child: Text(
                                            'ประมูลเสร็จสิ้น',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  56, 163, 165, 10),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 25),
                                          child: Row(
                                            children: [
                                              Text('สถานะ: '),
                                              Text(
                                                'กำลังส่ง',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      251, 143, 103, 10),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Scaffold(
                backgroundColor: Colors.grey[200],
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: 500,
                        height: 140,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/rambutan.jpg',
                                width: 150,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Column(
                                      children: [
                                        Text(
                                          'สวนเงาะลุงจ่า',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 30),
                                          child: Text(
                                            'ประมูลเสร็จสิ้น',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  56, 163, 165, 10),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 25),
                                          child: Row(
                                            children: [
                                              Text('สถานะ: '),
                                              Text(
                                                'ส่งแล้ว',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      260, 225, 108, 10),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
