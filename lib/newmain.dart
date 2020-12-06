import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fungarden/firstpage.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:fungarden/auth.dart';

class NewmainPage extends StatefulWidget {
  @override
  _NewmainPageState createState() => _NewmainPageState();
}

class _NewmainPageState extends State<NewmainPage> {
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
      picture = 'https://img2.thaipng.com/20180401/klw/kisspng-user-profile-computer-icons-clip-art-profile-5ac092f6f2d337.1560498715225699749946.jpg';
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(56, 163, 165, 10),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          height: 60,
          child: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home, color: Colors.black),
                child: Text('หน้าแรก',style: TextStyle(color: Colors.black),),
              ),
              Tab(
                icon: Icon(Icons.shopping_cart, color: Colors.black),
                child: Text('รถเข็น',style: TextStyle(color: Colors.black),),
              ),
              Tab(
                icon: Icon(Icons.local_shipping, color: Colors.black),
                child: Text('ขนส่ง',style: TextStyle(color: Colors.black),),
              ),
              Tab(
                icon: Icon(Icons.person, color: Colors.black),
                child: Text('ฉัน',style: TextStyle(color: Colors.black),),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Firstpage(),
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
                                        'สเงาะลุงจ่า',
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
                            Text(
                              '101,000 บาท',
                              style: TextStyle(
                                color: Color.fromRGBO(56, 163, 165, 10),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          'จ่ายทั้งหมด',
                          style: TextStyle(color: Colors.white),
                        ),
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
        ]),
      ),
    );
  }
}
