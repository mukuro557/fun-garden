import 'package:flutter/material.dart';

class Landingpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("asset/image/greenbg.jpg"), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Spacer(),
          Container(child: Image.asset('asset/image/logo12.png', width: 150,)),
          Column(
            children: [
              Text('fun garden'.toUpperCase(),
                  style: Theme.of(context).textTheme.headline4),
              Text('ประมูลผลผลิต'.toUpperCase(),
                  style: Theme.of(context).textTheme.headline6)
            ],
          ),
          Spacer(flex:1,),
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
                  "ลงชื่อเข้าใช้",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
              ),
            ),
            // Spacer(),
            SizedBox(height: 20,),
            ButtonTheme(
              minWidth: 300.0,
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  ),
              child: RaisedButton(
                elevation: 2.0,
                hoverColor: Colors.green,
                color: Colors.grey[100],
                child: Text(
                  "ลงทะเบียน",
                  style: TextStyle(
                      color: Color.fromRGBO(56, 163, 165, 10), fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
              ),
            ),
            Spacer(flex: 3,),
        ],
      ),
    );
  }
}

