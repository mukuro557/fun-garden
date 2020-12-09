import 'package:flutter/material.dart';

class Thefristpageapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 500,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/greenbg.jpg"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Spacer(),
              Container(child: Image.asset('assets/images/logo.png')),
              Column(
                children: [
                  Text(
                    'fun garden'.toUpperCase(),
                    style: TextStyle(
                      color: new Color.fromRGBO(34, 87, 122, 10),
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      letterSpacing: 2,
                      fontFamily: 'itckrist',
                    ),
                  ),
                  Text(
                    'Growth plant'.toUpperCase(),
                    style: TextStyle(
                      color: new Color.fromRGBO(34, 87, 122, 10),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontFamily: 'itckrist',
                    ),
                  )
                ],
              ),
              Spacer(
                flex: 2,
              ),
              ButtonTheme(
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
                    "เข้าสู่ระบบ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (route) => false);
                  },
                ),
              ),
              // Spacer(),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
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
                    "สมัครผู้ใช้ใหม่",
                    style: TextStyle(
                        color: Color.fromRGBO(34, 87, 122, 10),
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/regis', (route) => false);
                  },
                ),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
