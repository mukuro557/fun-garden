import 'package:flutter/material.dart';
import 'package:fungarden/auction.dart';

class Adddelete extends StatefulWidget {
  @override
  _AdddeleteState createState() => _AdddeleteState();
}

class _AdddeleteState extends State<Adddelete> {
  var farmnum = [
    {
      'img':
          'http://img.painaidii.com/images/20170425_8176_1493102751_242437.jpg',
      'farmname': 'สวนยายดา-เจ๊บุญชื่น',
      'address': 'เลขที่ 30 เขายายดา ตำบลตะพง อำเภอเมือง ระยอง 21000',
      'price': '30000'
    },
    {
      'img':
          'https://www.technologychaoban.com/wp-content/uploads/2018/12/zx001.jpg',
      'farmname': 'สวนยายดา-เจ๊บุญชื่น',
      'address': 'เลขที่ 30 เขายายดา ตำบลตะพง อำเภอเมือง ระยอง 21000',
      'price': '30000'
    }
  ];
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
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
            child: Row(
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
          ),
          new Expanded(
              child: new ListView.builder(
            itemCount: farmnum.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Card(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                        child: Container(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            farmnum[index]['img'],
                            width: 100,
                          ),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              farmnum[index]['farmname'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              farmnum[index]['address'],
                              style: TextStyle(fontSize: 9),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 120),
                              child: Text(
                                'ราคา ' + farmnum[index]['price'] + ' บาท',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 150),
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'ชำระเงิน',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Color.fromARGB(255, 87, 204, 153),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
