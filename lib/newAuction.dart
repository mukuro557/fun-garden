import 'dart:async';
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
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
  var userinfo = [
    {
      'auctioneer': 'สวนเงาะลุงจ่า',
      'price': '50',
    }
  ];
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
  var _image = [];
  int top;
  String dropdownValue = '5';

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

  _getimage() async {
    SharedPreferences fruitid = await SharedPreferences.getInstance();
    data = fruitid.getString('id');
    try {
      http.Response responses = await http.post(_url + 'image',
          body: {"id": data}).timeout(Duration(seconds: 5));
      var respon = responses.body;
      if (responses.statusCode == 200) {
        var reson = jsonDecode(respon);
        for (int i = 0; i < reson.length; i++) {
          _image.add(reson[i]['Image']);
        }
      }
    } on TimeoutException catch (e) {
      print('Timeout: $e');
    } catch (e) {
      print('Error: $e');
    }
  }

  _getaucinfo() async {
    SharedPreferences fruitid = await SharedPreferences.getInstance();
    data = fruitid.getString('id');
    try {
      http.Response responses = await http.post(_url + 'checkmostp',
          body: {"id": data}).timeout(Duration(seconds: 5));
      var respon = responses.body;

      if (responses.statusCode == 200) {
        var reson = jsonDecode(respon);
        for (int i = 0; i < reson.length; i++) {
          setState(() {
            if (reson[i]['Auctioneer'] != null) {
              userinfo[i]['auctioneer'] = reson[i]['Auctioneer'];
            } else {
              userinfo[i]['auctioneer'] = '';
            }
            if (reson[i]['price'] != null) {
              userinfo[i]['price'] = "${reson[i]['price']}";
            } else {
              userinfo[i]['price'] = '';
            }
            userinfo.add({});
          });
        }
      }
      print(userinfo);
    } on TimeoutException catch (e) {
      print('Timeout: $e');
    } catch (e) {
      print('Error: $e');
    }
  }

  _getalldata() async {
    SharedPreferences fruitid = await SharedPreferences.getInstance();
    data = fruitid.getString('id');

    try {
      http.Response responses = await http.post(_url + 'allfarminfoauc',
          body: {"id": data}).timeout(Duration(seconds: 5));
      var respon = responses.body;
      if (responses.statusCode == 200) {
        var reson = jsonDecode(respon);
        var date = reson[0]['Date_end'];
        DateTime end = DateTime.parse(date);
        todaay.difference(end).inHours;
        int total = todaay.difference(end).inMinutes * -1;
        int minutefi = total % 60;
        int hourfi = total ~/ 60;

        setState(() {
          if (reson[0]['Farm_name'] != null) {
            fruit[0]['name'] = reson[0]['Farm_name'];
          } else {
            fruit[0]['name'] = '';
          }
          if (reson[0]['Address'] != null) {
            fruit[0]['location'] = reson[0]['Address'];
          } else {
            fruit[0]['location'] = '';
          }
          if (reson[0]['Tel1'] != null) {
            fruit[0]['tel'] = reson[0]['Tel1'];
          } else {
            fruit[0]['tel'] = '';
          }
          if (reson[0]['Descript'] != null) {
            fruit[0]['descript'] = reson[0]['Descript'];
          } else {
            fruit[0]['descript'] = '';
          }
          if (reson[0]['Fruit'] != null) {
            fruit[0]['fruit'] = reson[0]['Fruit'];
          } else {
            fruit[0]['fruit'] = '';
          }
          if (reson[0]['Price'] != null) {
            fruit[0]['price'] = reson[0]['Price'];
          } else {
            fruit[0]['price'] = '';
          }
          if (reson[0]['Sell_id'] != null) {
            fruit[0]['id'] = reson[0]['Sell_id'];
          } else {
            fruit[0]['id'] = '';
          }
          if (reson[0]['Date_end'] != null) {
            fruit[0]['date_end'] = reson[0]['Date_end'];
          } else {
            fruit[0]['date_end'] = '';
          }
          fruit[0]['left'] = '00:$hourfi:$minutefi';
          fruit[0]['time'] = total;
        });
        _reduce();
      }
    } on TimeoutException catch (e) {
      print('Timeout: $e');
    } catch (e) {
      print('Error: $e');
    }
  }

  _auction() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int price = int.parse(userinfo[0]['price']);
    int plus = int.parse(dropdownValue);
    int sum = price + plus;
    print(sum);
    try {
      http.Response responses = await http.post(_url + 'auctionsstart', body: {
        "id_user": prefs.getString('name'),
        "id_sell": "${fruit[0]['id']}",
        "price": "$sum"
      }).timeout(Duration(seconds: 5));
      var respon = responses.body;
      if (responses.statusCode == 200) {
        Navigator.pop(context);
        _getaucinfo();
      }
    } on TimeoutException catch (e) {
      print('Timeout: $e');
    } catch (e) {
      print('Error: $e');
    }
  }

  _showAlert() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('กดเพิ่ม'),
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return DropdownButton(
              value: dropdownValue,
              items: <String>['5', '10', '20', '30', '40', '50']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
            );
          }),
          actions: [
            RaisedButton(
              onPressed: () {
                _auction();
              },
              child: Text('ประมูล'),
            )
          ],
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getaucinfo();
    _getalldata();
    _getimage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 196, 154, 10),
        title: Text('สวนองุ่นน้าแวว'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: CarouselSlider(
                autoPlay: true,
                autoPlayAnimationDuration: Duration(milliseconds: 500),
                autoPlayCurve: Curves.fastOutSlowIn,
                height: MediaQuery.of(context).size.height / 2.5,
                items: _image.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 2.5,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        child: Image.network(card, fit: BoxFit.cover),
                      ),
                    );
                  });
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
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
            //จำนวนคนประมูล
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
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
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            //อันดับผู้ประมูล
            Container(
              width: 400,
              height: 200,
              child: ListView.builder(
                itemCount: userinfo.length >= 5 ? 5 : userinfo.length - 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 20),
                        child: Row(children: [
                          index < 1
                              ? Icon(
                                  Icons.stars,
                                  color: Colors.yellow[700],
                                )
                              : Icon(
                                  Icons.receipt,
                                  color: Colors.yellow[700],
                                ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('${index + 1}'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(userinfo[index]['auctioneer']),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${userinfo[index]['price']}"),
                          )
                        ]),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    'รายละเอียด',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            //ที่อยู่
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
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
            //เบอร์โทร
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
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
              padding: const EdgeInsets.only(right: 355, top: 10),
              child: Text(
                'เกี่ยวกับ:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            //เกี่ยวกับ
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Row(
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
                          child: Text(fruit[0]['descript']),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
              width: 240,
              height: 50,
              child: RaisedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text('ติดตาม'),
                color: Colors.white,
                elevation: 10,
              )),
          Container(
            width: 240,
            height: 50,
            child: RaisedButton.icon(
              color: Color.fromRGBO(56, 163, 165, 10),
              icon: Image.asset(
                'assets/images/auction.png',
                width: 20,
              ),
              onPressed: () => _showAlert(),
              label: Text(
                'ประมูล',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
