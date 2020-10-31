import 'package:flutter/material.dart';

class Money extends StatefulWidget {
  @override
  _MoneyState createState() => _MoneyState();
}

class _MoneyState extends State<Money> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              title: Text('ยอดเงินที่ได้รับ'),
              centerTitle: true,
              backgroundColor: Color.fromRGBO(56, 163, 165, 10),
              
            ),
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 50, right: 50),
          child: Row(
            children: [
              
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 48, bottom: 30, top: 10, right: 50),
          child: Row(
            children: [
              Text(
                'รวม 10,000 บาท',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              
            ],
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: GestureDetector(
            onTap: () {
              print("Tapped a Container");
            },
            child: Container(
                height: 300,
                width: 500,
                decoration: BoxDecoration(
                  // color: Colors.yellow[600],
                  border: Border.all(
                    color: Colors.grey[500],
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 20, right: 340),
                      child: Row(
                        children: [
                          Ink(
                            decoration: const ShapeDecoration(
                              color: Colors.lightBlue,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.android),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                          Spacer(),
                          Text('การซื้อสำเร็จ')
                        ],
                      ),
                    ),
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
                                padding: const EdgeInsets.only(right: 65),
                                child: Column(
                                  children: [
                                    Text('สวนลิ้นจี่คุณจ่า',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 35),
                                child: Column(
                                  children: [
                                    Text('54 ม.3 ต.รอบเวียง อ.เมือง จ.เชียงราย')
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
                          Text('ราคา 4,500 บาท',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GestureDetector(
            onTap: () {
              print("Tapped a Container");
            },
            child: Container(
                height: 300,
                width: 500,
                decoration: BoxDecoration(
                  // color: Colors.yellow[600],
                  border: Border.all(
                    color: Colors.grey[500],
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 20, right: 340),
                      child: Row(
                        children: [
                          Ink(
                            decoration: const ShapeDecoration(
                              color: Colors.lightBlue,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.android),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                          Spacer(),
                          Text('การซื้อสำเร็จ')
                        ],
                      ),
                    ),
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
                                  'https://mpics.mgronline.com/pics/Images/561000005187502.JPEG'),
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 65),
                                child: Column(
                                  children: [
                                    Text('สวนเงาะคุณผึ้ง',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 35),
                                child: Column(
                                  children: [
                                    Text('54 ม.3 ต.รอบเวียง อ.เมือง จ.เชียงราย')
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
                          Text('ราคา 5,500 บาท',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ],
    )));
  }
}
