import 'package:flutter/material.dart';

class Regis extends StatelessWidget {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _phone = TextEditingController();
  
  _register() {
    
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
                                    controller: _password,
                                    decoration: InputDecoration(
                                      hintText: 'ยืนยันรหัสผ่าน',
                                      hintStyle: TextStyle(color: Colors.black),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                    ),
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
                                  onPressed: () {},
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
