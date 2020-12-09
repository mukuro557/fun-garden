import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fungarden/firstpage.dart';
import 'package:fungarden/cart.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:fungarden/auth.dart';

class Myuser extends StatefulWidget {
  @override
  _MyuserState createState() => _MyuserState();
}

class _MyuserState extends State<Myuser> {
  int _gValue = 0;
  String name = '';

  void changeRadio(int value) {
    setState(() {
      _gValue = value;
    });
  }

  String picture =
      'https://img2.thaipng.com/20180401/klw/kisspng-user-profile-computer-icons-clip-art-profile-5ac092f6f2d337.1560498715225699749946.jpg';

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

  _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences pic = await SharedPreferences.getInstance();
    prefs.remove('name');
    pic.remove('picture');
    setState(() {
      picture =
          'https://img2.thaipng.com/20180401/klw/kisspng-user-profile-computer-icons-clip-art-profile-5ac092f6f2d337.1560498715225699749946.jpg';
    });
    await signOutGoogle();
    Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
  }

  _userinfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences pic = await SharedPreferences.getInstance();
    if (prefs.getString('name') != null) {
      setState(() {
        name = prefs.getString('name');
      });
    }
    if (pic.getString('picture') != null) {
      setState(() {
        picture = pic.getString('picture');
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _userinfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                          backgroundImage: NetworkImage(picture),
                        ),
                      ),
                    ),
                    Text(
                      name,
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
                        onPressed: () {
                          _logout();
                        },
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
    );
  }
}
