import 'package:flutter/material.dart';
import 'package:fungarden/auction.dart';

class Add_delete extends StatefulWidget {
  @override
  _Add_deleteState createState() => _Add_deleteState();
}

class _Add_deleteState extends State<Add_delete> {
  var farmnum = [{'img':'http://img.painaidii.com/images/20170425_8176_1493102751_242437.jpg','farmname':'สวนยายดา-เจ๊บุญชื่น','address':'เลขที่ 30 เขายายดา ตำบลตะพง อำเภอเมือง ระยอง 21000','price':'30000'}];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 204, 153),
        title: Text('Fun garden'),
      ),
      body: Column(
        children: [
          Text('เพิ่มหรือลบสินค้า'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Auction()),
                  );
                },
                child: Text('ทั้งหมด'),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Auction()),
                  );
                },
                child: Text('กำลังประมูล'),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Auction()),
                  );
                },
                child: Text('รอชำระ'),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Auction()),
                  );
                },
                child: Text('ชำระแล้ว'),
              ),
            ],
          ),
          new Expanded(
              child: new ListView.builder(
            itemCount: farmnum.length,
            itemBuilder: (BuildContext ctxt, int Index) {
              return new Card(
                child: Row(children: [Image.network(farmnum[Index]['img']),Column(),],),
              );
            },
          ))
        ],
      ),
    );
  }
}
