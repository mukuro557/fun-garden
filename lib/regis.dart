import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Regis extends StatefulWidget {
  @override
  _RegisState createState() => _RegisState();
}

class _RegisState extends State<Regis> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _conpassword = TextEditingController();
  TextEditingController _phone = TextEditingController();
  String _url = 'http://10.0.2.2:35000/';

  _register() async {
    if (_password.text == _conpassword.text) {
      if (_password.text != '' && _username.text != '' && _phone.text != '') {
        try {
          http.Response responses = await http.post(_url + 'register', body: {
            "username": _username.text,
            "password": _username.text,
            "role": _username.text,
          }).timeout(Duration(seconds: 5));
          var respon = responses.body;
          showAlert();
        } on TimeoutException catch (e) {
          print('Timeout: $e');
        } catch (e) {
          print('Error: $e');
        }
      } else {
        showAlertloinfail('กรุณากรอข้อความให้ครบถ้วน');
      }
    } else {
      showAlertloinfail('รหัสผ่านไม่ตรงกัน');
    }
  }

  Future showAlertloinfail(String word) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(word),
          actions: [
            FlatButton(
              onPressed: () {
                _username.text = '';
                _password.text = '';
                _conpassword.text = '';
                _phone.text = '';
                Navigator.pop(context);
              },
              child: Text('ตกลง'),
            )
          ],
        );
      },
    );
  }

  Future showAlert() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/corrnect.png',
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'สำเร็จ',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text('เข้าสู่หน้าต่อไป'),
            ],
          ),
          actions: [
            FlatButton(
              onPressed: () {
                setState(() {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                });
              },
              child: Text('ต่อไป'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 0, 5),
              child: Text(
                'ลงทะเบียน',
                style: TextStyle(
                    color: Color.fromRGBO(34, 87, 122, 10),
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            )),
            SizedBox(
              height: 35,
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 20, 0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 30, 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.alternate_email,
                                  color: Color.fromRGBO(34, 87, 122, 10),
                                ),
                              ),
                              Expanded(
                                  flex: 9,
                                  child: TextField(
                                    controller: _username,
                                    decoration: InputDecoration(
                                      hintText: 'ชื่อผู้ใช้',
                                      hintStyle: TextStyle(color: Colors.black),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 30, 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.lock_open,
                                  color: Color.fromRGBO(34, 87, 122, 10),
                                ),
                              ),
                              Expanded(
                                  flex: 9,
                                  child: TextField(
                                    controller: _password,
                                    decoration: InputDecoration(
                                      hintText: 'รหัสผ่าน',
                                      hintStyle: TextStyle(color: Colors.black),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                    ),
                                    autofocus: false,
                                    obscureText: true,
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 30, 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.lock_open,
                                  color: Color.fromRGBO(34, 87, 122, 10),
                                ),
                              ),
                              Expanded(
                                  flex: 9,
                                  child: TextField(
                                    controller: _conpassword,
                                    decoration: InputDecoration(
                                      hintText: 'ยืนยันรหัสผ่าน',
                                      hintStyle: TextStyle(color: Colors.black),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                    ),
                                    autofocus: false,
                                    obscureText: true,
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 30, 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.phone,
                                  color: Color.fromRGBO(34, 87, 122, 10),
                                ),
                              ),
                              Expanded(
                                  flex: 9,
                                  child: TextField(
                                    controller: _phone,
                                    decoration: InputDecoration(
                                      hintText: 'เบอร์โทรศัพท์',
                                      hintStyle: TextStyle(color: Colors.black),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: ButtonTheme(
                                minWidth: 300.0,
                                height: 50,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: RaisedButton(
                                  elevation: 2.0,
                                  hoverColor: Colors.green,
                                  color: Color.fromRGBO(56, 163, 165, 10),
                                  child: Text(
                                    "ลงทะเบียน",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    _register();
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: ButtonTheme(
                                minWidth: 300.0,
                                height: 50,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: RaisedButton(
                                  elevation: 2.0,
                                  hoverColor: Colors.green,
                                  color: Colors.white,
                                  child: Text(
                                    "ยกเลิก",
                                    style: TextStyle(
                                        color: Color.fromRGBO(34, 87, 122, 10),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, '/login', (route) => false);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Image.asset(
                  'assets/images/greenbg2.png',
                  alignment: FractionalOffset.bottomCenter,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
