import 'package:flutter/material.dart';
import 'package:fungarden/auction.dart';
import 'package:fungarden/auction1.dart';

class AddP extends StatefulWidget {
  @override
  _AddPState createState() => _AddPState();
}

class _AddPState extends State<AddP> {
  var farmnum = [
    {
      'img': 'https://mpics.mgronline.com/pics/Images/561000005187502.JPEG',
      'farmname': 'สวนยายดา-เจ๊บุญชื่น',
      'address': 'เลขที่ 30 เขายายดา ตำบลตะพง อำเภอเมือง ระยอง 21000',
      'price': '30000'
    },
    {
      'img': 'https://mpics.mgronline.com/pics/Images/561000005187502.JPEG',
      'farmname': 'สวนยายดา-เจ๊บุญชื่น',
      'address': 'เลขที่ 30 เขายายดา ตำบลตะพง อำเภอเมือง ระยอง 21000',
      'price': '30000'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              title: Text('ประมูลสินค้า'),
              centerTitle: true,
              backgroundColor: Color.fromRGBO(56, 163, 165, 10),
              bottom: TabBar(tabs: [
                Tab(
                  text: 'ทั้งหมด',
                ),
                Tab(text: 'กำลังประมูล'),
                Tab(text: 'รอชำระ'),
                Tab(text: 'ชำระแล้ว'),
              ]),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 50, right: 50),
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
                        height: 250,
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
                                        padding:
                                            const EdgeInsets.only(right: 65),
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
                                  const EdgeInsets.only(left: 190, top: 20),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(),
                                    child: ButtonTheme(
                                      minWidth: 150.0,
                                      height: 50,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: RaisedButton(
                                        elevation: 2.0,
                                        hoverColor: Colors.green,
                                        color: Color.fromRGBO(56, 163, 165, 10),
                                        child: Text(
                                          "ข้อมูล",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Auction()),
                                          );
                                        },
                                      ),
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
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () {
                      print("Tapped a Container");
                    },
                    child: Container(
                        height: 250,
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
                                        padding:
                                            const EdgeInsets.only(right: 65),
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
                              padding: const EdgeInsets.only(left: 180, top: 20),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ButtonTheme(
                                      minWidth: 150.0,
                                      height: 50,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: RaisedButton(
                                        elevation: 2.0,
                                        hoverColor: Colors.red,
                                        color: Color.fromRGBO(56, 163, 165, 10),
                                        child: Text(
                                          "ข้อมูล",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                         onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Auction1()),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              ],
            )));
  }
}
