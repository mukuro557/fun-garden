import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              title: Text('เพิ่มหรือลบสินค้า'),
              centerTitle: true,
              backgroundColor: Color.fromRGBO(56, 163, 165, 10),
              bottom: TabBar(tabs: [
                Tab(
                  text: 'ทั้งหมด',
                ),
                Tab(text: 'ประมูลแล้ว'),
                Tab(text: 'กำลังประมูล'),
                Tab(text: 'ยังไม่ประมูล'),
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
                        height: 320,
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
                              padding: const EdgeInsets.only(),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 450),
                                    child: Ink(
                                      decoration: const ShapeDecoration(
                                        color: Colors.red,
                                        shape: CircleBorder(),
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.delete),
                                        color: Colors.white,
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
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
                                        padding: const EdgeInsets.only(
                                          right: 65,
                                        ),
                                        child: Column(
                                          children: [
                                            Text('สวนลิ้นจี่คุณจ่า',
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
                                            const EdgeInsets.only(left: 35),
                                        child: Column(
                                          children: [
                                            Text(
                                                '54 ม.3 ต.รอบเวียง อ.เมือง จ.เชียงราย')
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 20, left: 230),
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
                            Padding(
                              padding: const EdgeInsets.only(left: 300),
                              child: Row(
                                children: [
                                  ButtonTheme(
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
                                        "ชำระเงิน",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
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
                        height: 330,
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
                              padding: const EdgeInsets.only(),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 450),
                                    child: Ink(
                                      decoration: const ShapeDecoration(
                                        color: Colors.red,
                                        shape: CircleBorder(),
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.delete),
                                        color: Colors.white,
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
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
                                        padding: const EdgeInsets.only(
                                          right: 65,
                                        ),
                                        child: Column(
                                          children: [
                                            Text('สวนเงาะคุณผึ้ง',
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
                                            const EdgeInsets.only(left: 35),
                                        child: Column(
                                          children: [
                                            Text(
                                                '54 ม.3 ต.รอบเวียง อ.เมือง จ.เชียงราย')
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 20, left: 230),
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
                            Padding(
                              padding: const EdgeInsets.only(left: 300),
                              child: Row(
                                children: [
                                  ButtonTheme(
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
                                        "ชำระเงิน",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50,left: 450),
                  child: Ink(
                    decoration: const ShapeDecoration(
                       color: Color.fromRGBO(56, 163, 165, 10),
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            )));
  }
}
