import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Firstpage extends StatefulWidget {
  @override
  _FirstpageState createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  final List fruit = [
    {
      'name': 'สวนเงาะลุงจ่า',
      'location': '54 ม.3 ต.รอบเวียง อ.เมือง จ.เชียงราย',
      'image': 'rambutan.jpg'
    },
  ];
  String _url = 'http://10.0.2.2:35000/';
  _getallfriut() async {
    try {
      http.Response response = await http
          .get(
            _url + 'allfruit',
          )
          .timeout(Duration(seconds: 5));
      var res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        double county = res[0].length / 6;
        int count = county.toInt();

        for (int i = 0; i < count; i++) {
          String idsen = (res[i]['Farm_id']).toString();
          print(idsen);
          try {
            http.Response responses = await http.post(_url + 'allfruit',
                body: {"id": idsen}).timeout(Duration(seconds: 5));
            var respon = responses.body;

            setState(() {
              var reson = jsonDecode(respon);

              fruit.add(
                {
                  'name': reson[0]['Farm_name'],
                  'location': reson[0]['Address'],
                  'image': 'rambutan.jpg'
                },
              );
            });
          } on TimeoutException catch (e) {
            print('Timeout: $e');
          } catch (e) {
            print('Error: $e');
          }
        }
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
                itemCount: fruit.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 35, right: 35, top: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/auction");
                      },
                      child: Container(
                        width: 200,
                        height: 380,
                        child: Card(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  child: Image.asset(
                                    'assets/images/' + fruit[index]['image'],
                                    height: 200,
                                    width: 600,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 220),
                                    child: Text(
                                      fruit[index]['name'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 105, bottom: 20),
                                    child: Text('${fruit[index]['location']} '),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/auction.png',
                                              width: 20,
                                            ),
                                            SizedBox(width: 5),
                                            Text('5000 บาท'),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
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
                        ),
                      ),
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
