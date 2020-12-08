import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NewAuction extends StatefulWidget {
  @override
  _NewAuctionState createState() => _NewAuctionState();
}

class _NewAuctionState extends State<NewAuction> {
  String data;
  String _url = 'http://10.0.2.2:35000/';
  DateTime todaay = DateTime.now();
  var fruit = [
    {
      'name': 'สวนเงาะลุงจ่า',
      'id': '1',
      'location': '54 ม.3 ต.รอบเวียง อ.เมือง จ.เชียงราย',
      'image': 'rambutan.jpg',
      'price': '5000',
      'date_end': '6/12/2020',
      'left': '00:00:00',
      'time': 50,
      'fruit': 'กล้วยน้ำว้า'
    }
  ];
  int top;

   _reduce() {
    for (int i = 0; i < fruit.length - 1; i++) {
      if (top == null || top < fruit[i]['time']) {
        setState(() {
          top = fruit[i]['time'];
        });
      }
    }

    Timer.periodic(Duration(minutes: 1), (timer) {
      top--;
      for (int i = 0; i < fruit.length - 1; i++) {
        setState(() {
          todaay = DateTime.now();
          DateTime end = DateTime.parse(fruit[i]['date_end']);
          int total = todaay.difference(end).inMinutes * -1;
          int minutefi = total % 60;
          int hourfi = total ~/ 60;
          fruit[i]['left'] = '00:$hourfi:$minutefi';
          
        });
      }
      if (top <= 0) {
        return timer.cancel();
      }
    });
  }

  _getid() async {
    SharedPreferences fruitid = await SharedPreferences.getInstance();
    setState(() {
      data = fruitid.getString('id');
    });
    _getalldata();
  }

  _getalldata() async {
    print(data);
    try {
      http.Response responses = await http.post(_url + 'allfarminfoauc',
          body: {"id": data}).timeout(Duration(seconds: 5));
      var respon = responses.body;
      print(respon);
      if (responses.statusCode == 200) {
        var reson = jsonDecode(respon);
        var date = reson[0]['Date_end'];
        DateTime end = DateTime.parse(date);
        todaay.difference(end).inHours;
        int total = todaay.difference(end).inMinutes * -1;
        int minutefi = total % 60;
        int hourfi = total ~/ 60;

        setState(() {
          fruit[0]['name'] = reson[0]['Farm_name'];
          fruit[0]['location'] = reson[0]['Address'];
          fruit[0]['tel'] = reson[0]['Tel1'];
          fruit[0]['descript'] = reson[0]['Descript'];
          fruit[0]['fruit'] = reson[0]['Fruit'];
          fruit[0]['price'] = reson[0]['Price'];
          fruit[0]['id'] = reson[0]['Sell_id:'];
          fruit[0]['date_end'] = reson[0]['Date_end'];
          fruit[0]['left'] = '00:$hourfi:$minutefi';
          fruit[0]['time'] = total;
          
          fruit.add({});
        });
         _reduce();
      }
    } on TimeoutException catch (e) {
      print('Timeout: $e');
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(56, 163, 165, 10),
        title: Text('สวนองุ่นน้าแวว'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset(
                'assets/images/grape.jpg',
                fit: BoxFit.cover,
                width: 500,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        fruit[0]['name'],
                        style: TextStyle(fontSize: 26),
                      ),
                      Text(
                        'ราคาเริ่มต้น ${fruit[0]['price']} บาท',
                        style: TextStyle(
                            color: Color.fromRGBO(56, 163, 165, 10),
                            fontSize: 16),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.person_outline,
                  ),
                  Text('กำลังประมูล 10 คน'),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 1,
                      height: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Icon(Icons.access_alarms),
                  Text('เหลือเวลา ' + fruit[0]['left'])
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Row(
                children: [
                  Text(
                    'ประเภท',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 5),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      fruit[0]['fruit'],
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'อันดับผู้ประมูล',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.yellow[300],
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    '1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Text('มะม่วง โหฮิ้ว'),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('100,000'),
              )
            ]),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      '2',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Text('แตงโม ลาล่า'),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('90,000'),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent[200],
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      '3',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Text('แป้ง'),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('50,000'),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 2),
              child: Row(
                children: [
                  Text('4'),
                  SizedBox(width: 15),
                  Text('ลีลี่'),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('20,000'),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 2),
              child: Row(
                children: [
                  Text('5'),
                  SizedBox(width: 15),
                  Text('lalalili'),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('13,000'),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'รายละเอียด',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'ที่อยู่: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(fruit[0]['location']),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'ข้อมูลติดต่อ: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(fruit[0]['tel']),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'เกี่ยวกับ: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 250,
                          child: Text(
                              fruit[0]['descript']),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: FloatingBtn(),
    );
  }
}

class FloatingBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
            width: 180,
            height: 50,
            child: RaisedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text('ติดตาม'),
              color: Colors.white,
            )),
        Container(
          width: 180,
          height: 50,
          child: RaisedButton.icon(
            color: Color.fromRGBO(56, 163, 165, 10),
            icon: Image.asset(
              'assets/images/auction.png',
              width: 20,
            ),
            onPressed: () {},
            label: Text(
              'ประมูล',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
