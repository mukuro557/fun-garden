import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _gValue = 0;
  String name = '';

  void changeRadio(int value) {
    setState(() {
      _gValue = value;
    });
  }

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
                  text: 'ยังไม่ได้ชำระ',
                ),
                Tab(
                  text: 'ชำระแล้ว',
                ),
              ],
            ),
            title: Center(
              child: Text(
                'รถเข็น',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                color: Colors.grey[200],
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 1),
                            child: Container(
                              width: 500,
                              height: 50,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Radio(
                                        value: 0,
                                        groupValue: _gValue,
                                        onChanged: changeRadio),
                                    Text('ทั้งหมด'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 500,
                            height: 140,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Radio(
                                      value: 0,
                                      groupValue: _gValue,
                                      onChanged: changeRadio),
                                  Image.asset(
                                    'assets/images/rambutan.jpg',
                                    width: 150,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Column(
                                          children: [
                                            Text(
                                              'สวนเงาะลุงจ่า',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 25),
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
                                            Text('ราคา 101,000 บาท'),
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
                    Spacer(),
                    Row(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 380,
                          height: 50,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('รวมทั้งหมด'),
                                ),
                                Spacer(),
                                Text(
                                  '101,000 บาท',
                                  style: TextStyle(
                                    color: Color.fromRGBO(56, 163, 165, 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          child: RaisedButton(
                            onPressed: () {},
                            child: Text(
                              'จ่ายทั้งหมด',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Color.fromRGBO(56, 163, 165, 10),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey[200],
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Container(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Column(
                                            children: [
                                              Text(
                                                'สวนเงาะลุงจ่า',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right:45),
                                                child: Text(
                                                  'ยังไม่ได้ชำระ',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        254, 74, 73, 10),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text('ราคา 101,000 บาท'),
                                            ],
                                          ),
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
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey[200],
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Container(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Column(
                                            children: [
                                              Text(
                                                'สวนเงาะลุงจ่า',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 70),
                                                child: Text(
                                                  'ชำระแล้ว',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        42, 183, 202, 10),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text('ราคา 101,000 บาท'),
                                            ],
                                          ),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
