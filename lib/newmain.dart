import 'package:flutter/material.dart';

class NewmainPage extends StatefulWidget {
  @override
  _NewmainPageState createState() => _NewmainPageState();
}

class _NewmainPageState extends State<NewmainPage> {
  int _gValue = 0;
  void changeRadio(int value) {
    setState(() {
      _gValue = value;
    });
  }

  final List fruit = [
    {
      'name': 'สวนเงาะลุงจ่า',
      'location': '54 ม.3 ต.รอบเวียง อ.เมือง จ.เชียงราย',
      'image': 'rambutan.jpg'
    },
    {
      'name': 'สวนส้มป้าจี้ด',
      'location': '54 ม.3 ต.รอบเวียง อ.เมือง จ.เชียงราย',
      'image': 'orange.jpg'
    },
    {
      'name': 'สวนองุ่นน้าแวว',
      'location': '54 ม.3 ต.รอบเวียง อ.เมือง จ.เชียงราย',
      'image': 'grape.jpg'
    }
  ];
  Future<void> refresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      fruit.add(
        {'name': 'Kiwi', 'price': 14, 'image': 'rambutan.jpg'},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(56, 163, 165, 10),
        ),
        bottomNavigationBar: Container(
          color: Colors.grey,
          height: 60,
          child: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home, color: Colors.black),
                text: 'หน้าแรก',
              ),
              Tab(
                icon: Icon(Icons.shopping_cart, color: Colors.black),
                text: ('รถเข็น'),
              ),
              Tab(
                icon: Icon(Icons.local_shipping, color: Colors.black),
                text: 'ขนส่ง',
              ),
              Tab(
                icon: Icon(Icons.person, color: Colors.black),
                text: 'ฉัน',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Container(
            color: Colors.grey[200],
            child: Column(
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.red[300],
                            textColor: Colors.white,
                            child: Image.asset(
                              'assets/images/hot.png',
                              width: 18,
                            ),
                            padding: EdgeInsets.all(14),
                            shape: CircleBorder(),
                          ),
                          Text('มาแรง')
                        ],
                      ),
                      Column(
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.yellow[300],
                            textColor: Colors.white,
                            child: Icon(
                              Icons.pin_drop,
                              size: 20,
                              color: Colors.black,
                            ),
                            padding: EdgeInsets.all(14),
                            shape: CircleBorder(),
                          ),
                          Text('ใกล้สุด')
                        ],
                      ),
                      Column(
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.orangeAccent,
                            textColor: Colors.white,
                            child: Image.asset(
                              'assets/images/sale.png',
                              width: 20,
                            ),
                            padding: EdgeInsets.all(14),
                            shape: CircleBorder(),
                          ),
                          Text('ราคาดี')
                        ],
                      ),
                      Column(
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            color: Color.fromRGBO(56, 163, 165, 10),
                            textColor: Colors.white,
                            child: Image.asset(
                              'assets/images/premium.png',
                              width: 18,
                            ),
                            padding: EdgeInsets.all(14),
                            shape: CircleBorder(),
                          ),
                          Text('พรีเมี่ยม')
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Row(
                    children: [
                      Text(
                        'ล่าสุด',
                        style: TextStyle(fontSize: 28),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: refresh,
                    child: ListView.builder(
                      itemCount: fruit.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Container(
                                    child: Image.asset(
                                      'assets/images/' + fruit[index]['image'],
                                      height: 200,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(fruit[index]['name']),
                                    Text('${fruit[index]['location']} '),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.alarm,
                                            size: 20,
                                          ),
                                          SizedBox(width: 5),
                                          Text('00:59:34'),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/auction.png',
                                            width: 20,
                                          ),
                                          SizedBox(width: 5),
                                          Text('5000 บาท'),
                                          Spacer(),
                                          Icon(Icons.people),
                                          Text('10 คน')
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
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
                        padding: const EdgeInsets.only(top: 1),
                        child: Container(
                          width: 360,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Container(
                          width: 360,
                          height: 140,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Radio(
                                    value: 0,
                                    groupValue: _gValue,
                                    onChanged: changeRadio),
                                Image.asset(
                                  'assets/images/rambutan.jpg',
                                  width: 130,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'สวนเงาะลุงจ่า',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                      Text(
                                        'ประมูลเสร็จสิ้น          ',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(56, 163, 165, 10),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text('ราคา 101,000 บาท   '),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
                      width: 260,
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
                            Text('101,000 บาท',style: TextStyle(color: Color.fromRGBO(56, 163, 165, 10),),)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text('จ่ายทั้งหมด',style: TextStyle(color: Colors.white),),
                        color: Color.fromRGBO(56, 163, 165, 10),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Colors.grey[100],
          ),
          Container(
            color: Colors.grey[100],
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/bg.jpg',
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(
                                'assets/images/V.jpg',
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'คุณ ทาทา',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Container(
                        width: 360,
                        height: 50,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.money_off),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('ยอดเงินคงเหลือ'),
                              ),
                              Spacer(),
                              Text('200,000')
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Container(
                          width: 360,
                          height: 50,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/add.png',
                                  width: 25,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('เติมเงิน'),
                                ),
                                Spacer(),
                                Text('200,000')
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Container(
                          width: 360,
                          height: 50,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/auction.png',
                                  width: 25,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('ประมูลแล้ว'),
                                ),
                                Spacer(),
                                Text('2 รายการ')
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Container(
                          width: 360,
                          height: 50,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/auction.png',
                                  width: 25,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('กำลังประมูล'),
                                ),
                                Spacer(),
                                Text('0')
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          width: 360,
                          height: 50,
                          child: RaisedButton(
                            color: Colors.white,
                            onPressed: () {},
                            child: Text(
                              'ออกจากระบบ',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
