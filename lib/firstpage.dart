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
      'id': '1',
      'location': '54 ม.3 ต.รอบเวียง อ.เมือง จ.เชียงราย',
      'image': 'rambutan.jpg',
      'price': '5000',
      'date_end': '6/12/2020',
      'left': '00:00:00',
    },
  ];
  String _url = 'http://10.0.2.2:35000/';
  DateTime todaay = DateTime.now();

  _reduce() {
    Timer.periodic(Duration(minutes: 1), (timer) {
      for (int i = 0; i < fruit.length - 1; i++) {
        DateTime end = DateTime.parse(fruit[i]['date_end']);
        int total = todaay.difference(end).inMilliseconds * -1;
        int minutefi = (total ~/ 6000) % 60;
        int hourfi = (total ~/ 360000) % 60;
        print('00:$hourfi:$minutefi');
        fruit[i]['left'] = '00:$hourfi:$minutefi';
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
            int total = todaay.difference(end).inMilliseconds * -1;
            int minutefi = (total ~/ 6000) % 60;
            int hourfi = (total ~/ 360000) % 60;
            setState(() {
              fruit[i]['name'] = res[0]['Farm_name'];
              fruit[i]['location'] = res[0]['Address'];
              fruit[i]['image'] = reson[0]['Image'];
              fruit[i]['date_end'] = res[0]['Date_end'];
              fruit[i]['id'] = res[0]['id'];
              fruit[i]['left'] = '00:$hourfi:$minutefi';
              fruit.add({});
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
    _reduce();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              child: ListView.builder(
                itemCount: fruit.length - 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/auction",
                            arguments: index);
                      },
                      child: Card(
                        child: Column(
                          children: [
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
