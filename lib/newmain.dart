import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fungarden/firstpage.dart';
import 'package:fungarden/cart.dart';
import 'package:fungarden/transport.dart';
import 'package:fungarden/myuser.dart';

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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.white,
          height: 80,
          child: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                  size: 40,
                ),
                child: Text(
                  'หน้าแรก',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                  size: 40,
                ),
                child: Text(
                  'รถเข็น',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.local_shipping,
                  color: Colors.black,
                  size: 40,
                ),
                child: Text(
                  'ขนส่ง',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 40,
                ),
                child: Text(
                  'ฉัน',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Container(
            child: Firstpage(),
            color: Colors.yellow,
          ),
          Container(
            child: Cart(),
            color: Colors.red,
          ),
          Container(
            child: Transport(),
            color: Colors.green,
          ),
          Container(
            child: Myuser(),
            color: Colors.blue,
          ),
        ]),
      ),
    );
  }
}
