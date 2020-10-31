import 'package:flutter/material.dart';

class ProductSta extends StatefulWidget {
  @override
  _ProductStaState createState() => _ProductStaState();
}

class _ProductStaState extends State<ProductSta> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text('สถานะสินค้า'),
              centerTitle: true,
              backgroundColor: Color.fromRGBO(56, 163, 165, 10),
              bottom: TabBar(tabs: [
                Tab(
                  text: 'ทั้งหมด',
                ),
                Tab(text: 'กำลังจัดส่ง'),
                Tab(text: 'ได้รับสินค้าแล้ว'),
              ]),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
                  child: Row(
                    children: [],
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
                              padding: const EdgeInsets.only(
                                  left: 15, top: 20, right: 320),
                              child: Row(
                                children: [
                                  Ink(
                                    decoration: const ShapeDecoration(
                                      color: Color.fromRGBO(56, 163, 165, 10),
                                      shape: CircleBorder(),
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.check),
                                      color: Colors.white,
                                      onPressed: () {},
                                    ),
                                  ),
                                  Spacer(),
                                  Text('สวนลิ้นจี่คุณจ่า',style: TextStyle(fontWeight: FontWeight.bold))
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
                                        padding: const EdgeInsets.only(),
                                        child: Column(
                                          children: [
                                            Text('ลิ้นจี่เกรด A',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          children: [
                                            Text(
                                                'สถานะ: กำลังจัดส่ง', style: TextStyle(color: Colors.grey))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 300),
                              child: Row(
                                children: [
                                  Text('เลขพัสดุ: 1212312121', style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                            )
                          ],
                        )),
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
                              padding: const EdgeInsets.only(
                                  left: 15, top: 20, right: 320),
                              child: Row(
                                children: [
                                  Ink(
                                    decoration: const ShapeDecoration(
                                      color: Color.fromRGBO(56, 163, 165, 10),
                                      shape: CircleBorder(),
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.check),
                                      color: Colors.white,
                                      onPressed: () {},
                                    ),
                                  ),
                                  Spacer(),
                                  Text('สวนเงาะคุณผึ้ง',style: TextStyle(fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 10),
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
                                        padding: const EdgeInsets.only(),
                                        child: Column(
                                          children: [
                                            Text('เงาะเกรด A',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          children: [
                                            Text(
                                                'สถานะ: กำลังจัดส่ง', style: TextStyle(color: Colors.grey),)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 300),
                              child: Row(
                                children: [
                                  Text('เลขพัสดุ1313213312',style: TextStyle(fontWeight: FontWeight.bold),)
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
