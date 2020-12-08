import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Firstpage extends StatefulWidget {
  @override
  _FirstpageState createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  final List fruit = [
    {
      'name': 'สวนเงาะลุงจ่า',
      'id': '1',
      'location': '54 ม.3 ต.รอบเวียง อ.เมือง จ.เชียงราย',
      'image': 'rambutan.jpg',
      'price': '5000',
      'date_end': '6/12/2020',
      'left': '00:00:00',
      'time': 50
    },
  ];
  String _url = 'http://10.0.2.2:35000/';
  DateTime todaay = DateTime.now();

  int top;

  _keepdata(String id) async {
    SharedPreferences fruitid = await SharedPreferences.getInstance();
    fruitid.setString('id', id);
  }

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

  _getallfriut() async {
    try {
      http.Response response = await http
          .get(
            _url + 'allfruit',
          )
          .timeout(Duration(seconds: 5));
      var res = jsonDecode(response.body);

      if (response.statusCode == 200) {
        int count = res.length;

        for (int i = 0; i < count; i++) {
          String idsen = (res[i]['Sell_id']).toString();

          try {
            http.Response responses = await http.post(_url + 'image',
                body: {"id": idsen}).timeout(Duration(seconds: 5));
            var respon = responses.body;

            var reson = jsonDecode(respon);
            var date = res[0]['Date_end'];
            DateTime end = DateTime.parse(date);
            todaay.difference(end).inHours;
            int total = todaay.difference(end).inMinutes * -1;
            int minutefi = total % 60;
            int hourfi = total ~/ 60;
            setState(() {
              fruit[i]['name'] = res[0]['Farm_name'];
              fruit[i]['location'] = res[0]['Address'];
              fruit[i]['image'] = reson[0]['Image'];
              fruit[i]['date_end'] = res[0]['Date_end'];
              fruit[i]['price'] = res[0]['Price'];
              fruit[i]['id'] = res[0]['Sell_id'];
              fruit[i]['left'] = '00:$hourfi:$minutefi';
              fruit[i]['time'] = total;

              fruit.add({});
            });
          } on TimeoutException catch (e) {
            print('Timeout: $e');
          } catch (e) {
            print('Error: $e');
          }
        }
        _reduce();
      } else {
        showAlert(response.body.toString());
      }
    } on TimeoutException catch (e) {
      print('Timeout: $e');
    } catch (e) {
      print('Error: $e');
    }
  }

  void showAlert(String message) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Result'),
          content: Text(message),
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getallfriut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Container(
              width: 550,
              height: 260,
              color: Color.fromRGBO(0, 196, 154, 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: Row(
                          children: [
                            Text(
                              'สวัสดี',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              child: Icon(
                                Icons.notifications,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 280),
                        child: Text(
                          'กล้ามาก เก่งมาก',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            color: Color.fromRGBO(254, 74, 73, 10),
                            textColor: Colors.white,
                            child: Icon(
                              Icons.new_releases,
                              size: 30.0,
                            ),
                            padding: EdgeInsets.all(20),
                            shape: CircleBorder(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'มาแรง',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            color: Color.fromRGBO(248, 225, 108, 10),
                            textColor: Colors.white,
                            child: Icon(
                              Icons.pin_drop,
                              size: 30.0,
                            ),
                            padding: EdgeInsets.all(20),
                            shape: CircleBorder(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'ใกล้สุด',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            color: Color.fromRGBO(251, 143, 103, 10),
                            textColor: Colors.white,
                            child: Icon(
                              Icons.monetization_on,
                              size: 30.0,
                            ),
                            padding: EdgeInsets.all(20),
                            shape: CircleBorder(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'ราคาดี',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            color: Color.fromRGBO(42, 183, 202, 10),
                            textColor: Colors.white,
                            child: Icon(
                              Icons.local_play,
                              size: 30.0,
                            ),
                            padding: EdgeInsets.all(20),
                            shape: CircleBorder(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'พรีเมี่ยม',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 20),
              child: Row(
                children: [
                  Text(
                    'ล่าสุด',
                    style: TextStyle(fontSize: 28),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: fruit.length - 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 35, right: 35, top: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/auction");
                        _keepdata(fruit[index]['id'].toString());
                      },
                      child: Card(
                          child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Container(
                            child: Image.network(
                              fruit[index]['image'],
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
                                  Text(fruit[index]['left']),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/auction.png',
                                            width: 20,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                              fruit[index]['price'].toString()),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Row(
                                        children: [
                                          Icon(Icons.people),
                                          Text('10 คน')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ])),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
