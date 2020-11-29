import 'package:flutter/material.dart';

class NewAuction extends StatefulWidget {
  @override
  _NewAuctionState createState() => _NewAuctionState();
}

class _NewAuctionState extends State<NewAuction> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(56, 163, 165, 10),
        title: Text('สวนองุ่นน้าแวว'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset(
                'assets/images/grape.jpg',
                fit: BoxFit.cover,
                width: 500,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'สวนองุ่นน้าแวว',
                        style: TextStyle(fontSize: 26),
                      ),
                      Text(
                        'ราคาเริ่มต้น 5,000 บาท',
                        style: TextStyle(
                            color: Color.fromRGBO(56, 163, 165, 10),
                            fontSize: 16),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.person_outline,
                  ),
                  Text('กำลังประมูล 10 คน'),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 1,
                      height: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Icon(Icons.access_alarms),
                  Text('เหลือเวลา 00:59:59')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Row(
                children: [
                  Text(
                    'ประเภท',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 5),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'องุ่น',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'อันดับผู้ประมูล',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.yellow[300],
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    '1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Text('มะม่วง โหฮิ้ว'),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('100,000'),
              )
            ]),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      '2',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Text('แตงโม ลาล่า'),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('90,000'),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent[200],
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      '3',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Text('แป้ง'),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('50,000'),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 2),
              child: Row(
                children: [
                  Text('4'),
                  SizedBox(width: 15),
                  Text('ลีลี่'),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('20,000'),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 2),
              child: Row(
                children: [
                  Text('5'),
                  SizedBox(width: 15),
                  Text('lalalili'),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('13,000'),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'รายละเอียด',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'ที่อยู่:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(' เลขที่ 30 ต.รอบเวียง จ.เชียงราย 57100'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'ข้อมูลติดต่อ:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(' 077-7777777'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'เกี่ยวกับ:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 250,
                          child: Text(
                              '“ไร่องุ่นน้าแวว” อ.มวกเหล็ก จ.สระบุรี มีพื้นที่ขนาด 60 ไร่ บรรยากาศร่มรื่นกลางหุบเขา แม้จะเป็นไร่ที่ไม่ใหญ่นัก แต่นักท่องเที่ยวสามารถสัมผัสบรรยากาศภายในไร่ได้อย่างใกล้ชิด ได้เห็นหารทำงานของชาวไร่ การดูแล เพาะพันธุ์ และการเก็บเกี่ยวองุ่นพันธุ์ดีกว่าหมื่นต้น ผลองุ่นที่นี่รสชาติหวานกรอบ อร่อยชุ่มลิ้น นอกจากนี้ยังปลอดสารพิษอีกด้วย ผลิตภัณฑ์ที่ไม่ซ้ำใครของที่นี่คือ ท็อฟฟี่องุ่นแท้ ซึ่งเป็นที่นิยมมาก รวมถึงน้ำองุ่นที่รสชาติอร่อย เหมาะกับการซื้อเป็นของฝากยิ่ง'),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: FloatingBtn(),
    );
  }
}

class FloatingBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
            width: 180,
            height: 50,
            child: RaisedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text('ติดตาม'),
              color: Colors.white,
            )),
        Container(
          width: 180,
          height: 50,
          child: RaisedButton.icon(
            color: Color.fromRGBO(56, 163, 165, 10),
            icon: Image.asset('assets/images/auction.png',width: 20,),
            onPressed: (){},
            label: Text(
              'ประมูล',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
