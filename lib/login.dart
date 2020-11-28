import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Login extends StatelessWidget {
String _login = 'http://10.0.2.2:35000/auth/google';

void getUser() async {
    // create connection client for multiple uses
    var client = http.Client();
    try {
      final response = await client
          .get(_login)
          .timeout(
            Duration(seconds: 5),
          );
 
      if (response.statusCode == 200) {
        
      }
    } on TimeoutException catch (e) {
      print('Error: $e');
    } catch (e) {
      print('Error: $e');
    } finally {
      //end the connection and free resources
      client.close();
    }
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
                'เข้าสู่ระบบ',
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
                                    decoration: InputDecoration(
                                      hintText: 'รหัสผ่าน',
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
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Spacer(),
                              Text(
                                'ลืมรหัสผ่าน?',
                                style: TextStyle(
                                  color: Color.fromRGBO(34, 87, 122, 10),
                                ),
                              )
                            ],
                          ),
                        ),
                        ButtonTheme(
                          minWidth: 300.0,
                          height: 50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(44, 20, 44, 5),
                            child: RaisedButton(
                              elevation: 2.0,
                              hoverColor: Colors.green,
                              color: Color.fromRGBO(56, 163, 165, 10),
                              child: Text(
                                "ลงชื่อเข้าใช้",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        ButtonTheme(
                          minWidth: 300.0,
                          height: 50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(44, 10, 44, 5),
                            child: RaisedButton(
                              elevation: 2.0,
                              hoverColor: Colors.white,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Image(
                                      image: AssetImage(
                                          'assets/images/google.png')),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Sign in with Google".toUpperCase(),
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(34, 87, 122, 10),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        ButtonTheme(
                          minWidth: 300.0,
                          height: 50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(44, 5, 44, 5),
                            child: RaisedButton(
                              elevation: 2.0,
                              hoverColor: Colors.grey,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Image(
                                      image: AssetImage(
                                          'assets/images/facebook.png')),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Sign in with facebook".toUpperCase(),
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(34, 87, 122, 10),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {},
                            ),
                          ),
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
