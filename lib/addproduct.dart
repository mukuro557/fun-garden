import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 50, right: 50),
          child: Row(
            children: [
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.lightBlue,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
              Spacer(),
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.lightBlue,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.android),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 300, bottom: 30, top: 50),
          child: Column(
            children: [
              Text(
                'เพิ่มหรือลบสินค้า',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, bottom: 30),
          child: Row(
            children: [
              Container(
                child: Text('ทั้งหมด',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              Spacer(),
              Container(
                child: Text('ประมูลแล้ว'),
              ),
              Spacer(),
              Container(
                child: Text('กำลังประมูล'),
              ),
              Spacer(),
              Container(
                child: Text('ยังไม่ประมูล'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: GestureDetector(
            onTap: () {
              print("Tapped a Container");
            },
            child: Container(
                height: 300,
                width: 500,
                decoration: BoxDecoration(
                  // color: Colors.yellow[600],
                  border: Border.all(
                    color: Colors.red[300],
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print("Tapped a Container");
                            },
                            child: Container(
                              height: 150,
                              width: 140,
                              child: Image.network(
                                  'https://lh3.googleusercontent.com/proxy/0E4OCgy7trxh-nD3Hdh_U82ozw8E1xW-uC6YSHkIBL9gfcX-H9MFezKE3CiMnx5wXsc-P8wjxPqHMamh6Rp9rXMxhBV7nbJzMV95FMxELYg'),
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 65, ),
                                child: Column(
                                  children: [
                                    Text('สวนลิ้นจี่คุณจ่า',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 35),
                                child: Column(
                                  children: [
                                    Text('54 ม.3 ต.รอบเวียง อ.เมือง จ.เชียงราย')
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, left: 230),
                      child: Column(
                        children: [
                          Text('ราคา 4,500 บาท',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 300),
                      child: Row(
                        children: [
                          ButtonTheme(
                            minWidth: 150.0,
                            height: 50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: RaisedButton(
                              elevation: 2.0,
                              hoverColor: Colors.green,
                              color: Color.fromRGBO(56,163, 165, 10),
                              child: Text(
                                "ชำระเงิน",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GestureDetector(
            onTap: () {
              print("Tapped a Container");
            },
            child: Container(
                height: 300,
                width: 500,
                decoration: BoxDecoration(
                  // color: Colors.yellow[600],
                  border: Border.all(
                    color: Colors.red[300],
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print("Tapped a Container");
                            },
                            child: Container(
                              height: 150,
                              width: 140,
                              child: Image.network(
                                  'https://www.prachachat.net/wp-content/uploads/2019/07/DSC_0471-1.jpg'),
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 65),
                                child: Column(
                                  children: [
                                    Text('สวนเงาะคุณผึ้ง',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 35),
                                child: Column(
                                  children: [
                                    Text('54 ม.3 ต.รอบเวียง อ.เมือง จ.เชียงราย')
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, left: 230),
                      child: Column(
                        children: [
                          Text('ราคา 5,500 บาท',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 300),
                      child: Row(
                        children: [
                          ButtonTheme(
                            minWidth: 150.0,
                            height: 50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: RaisedButton(
                              elevation: 2.0,
                              hoverColor: Colors.green,
                              color: Color.fromRGBO(56,163, 165, 10),
                              child: Text(
                                "ชำระเงิน",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
      ],
    ));
  }
}
