import 'package:flutter/material.dart';

class Owner extends StatefulWidget {
  @override
  _OwnerState createState() => _OwnerState();
}

class _OwnerState extends State<Owner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(56, 163, 165, 10),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonTheme(
                    minWidth: 5.0,
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: RaisedButton(
                      color: Colors.yellow[100],
                      child: Image.asset(
                        'assets/images/user.png',
                        height: 30,
                        width: 25,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'คุณจ่าพฤษา',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('ผู้ขาย', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('สถานะของผู้ขาย',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18))
                ],
              ),
            
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 33.0),
              height: MediaQuery.of(context).size.height * 0.35,
              child: Card(
                color: Colors.grey[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 8,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/durian.jpg',
                            width: 150,
                            height: 130,
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'สวนทุเรียนลุงจ่า',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  '54 ม.3 ต.รอบเวียง อ.เมือง ',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                )
                              ],
                            ),
                            
                          ),
                          SizedBox(height: 40,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('การจัดส่ง: จัดส่งแล้ว', style: TextStyle( fontSize: 12)),
                              Text('ค่าสินค้า: ยังไม่ได้รับ', style: TextStyle( fontSize: 12)),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.shopping_cart,color: Colors.white,size: 40,),
                      Text('สถานะของผู้ซื้อ', style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Spacer(),
                   Column(
                    children: [
                      Icon(Icons.history,color: Colors.white,size: 40,),
                      Text('ประวัติการซื้อขาย', style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Spacer(),
                   Column(
                    children: [
                      Icon(Icons.attach_money,color: Colors.white,size: 40,),
                      Text('สถานะของผู้ซื้อ', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ],
              ),
              
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Row(
                children: [
                  Column(
                      children: [
                        Icon(Icons.add_shopping_cart,color: Colors.white,size: 40,),
                        Text('เพิ่มลบสินค้า', style: TextStyle(color: Colors.white))
                      ],
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
