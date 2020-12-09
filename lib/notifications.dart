import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Container(
              color: Color.fromRGBO(0, 196, 154, 10),
              width: 500,
              height: 100,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 40,
                      ),
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/newmain', (route) => false);
                      },
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      'การแจ้งเตือน',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Container(
                      width: 500,
                      height: 140,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/rambutan.jpg',
                              width: 150,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        'สวนเงาะลุงจ่า',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 45),
                                        child: Text(
                                          'ยังไม่ได้ชำระ',
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(254, 74, 73, 10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Text('กรุณาทำการชำระเงิน'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
