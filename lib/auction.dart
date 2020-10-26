import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'http://img.painaidii.com/images/20170425_8176_1493102751_242437.jpg',
  'https://lh3.googleusercontent.com/CyEh4E_n3bjSUD0GwiSgGkyk_8keXD1h9BHApMsDtvN7lb-az3RvfzVG-jSMyerVVt2SkM1K_0xQdcDLbQ=w1080-h608-p-no-v0',
  'https://scontent.fbkk10-1.fna.fbcdn.net/v/t1.0-9/21314537_1909470675982389_4004026494476561324_n.jpg?_nc_cat=109&ccb=2&_nc_sid=e3f864&_nc_eui2=AeF43JMydDNFQnDYgSiG0YGinqOX67zQIgGeo5frvNAiAQERBDegiCR2WgcK5m8mpQe_dEAKba3i1WMLpZpgdvlA&_nc_ohc=AiVM89Z6V1UAX9JPkSm&_nc_ht=scontent.fbkk10-1.fna&oh=c62f690e485829dfdb90922a5f87a492&oe=5FBBE404',
  'https://tripth.com/wp-content/uploads/2018/06/%E0%B8%AA%E0%B8%A7%E0%B8%99%E0%B8%A2%E0%B8%B2%E0%B8%A2%E0%B8%94%E0%B8%B22.jpg',
  'https://www.technologychaoban.com/wp-content/uploads/2018/12/zx001.jpg',
  'https://f.ptcdn.info/707/006/000/1372475416-DSC2429res-o.jpg'
];
var list = [
  "sattha duangmon  30000 บาท",
  "rattatuy hachita  25000 บาท",
  "hamony john  20000 บาท",
  "four slinder  15000"
];

class Auction extends StatefulWidget {
  @override
  _AuctionState createState() => _AuctionState();
}

class _AuctionState extends State<Auction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 204, 153),
        title: Text('Fun garden'),
      ),
      body: Column(
        children: [
          CarouselSlider(
            autoPlay: true,
            autoPlayAnimationDuration: Duration(milliseconds: 500),
            autoPlayCurve: Curves.fastOutSlowIn,
            height: MediaQuery.of(context).size.height / 2.5,
            items: imgList.map((card) {
              return Builder(builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    child: Image.network(card, fit: BoxFit.cover),
                  ),
                );
              });
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Column(
              children: [
                Text(
                  'สวนยายดา-เจ๊บุญชื่น',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  'เลขที่ 30 เขายายดา ตำบลตะพง อำเภอเมือง ระยอง 21000',
                  style: TextStyle(color: Colors.black54),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 0, 2),
                      child: Text(
                        'คำอธิบาย',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 95,
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: SingleChildScrollView(
                    child: Text(
                      'กิจกรรม : ชมสวน ชิมผลไม้  ข้าวเหนียว ส้มตำ ไก่ทอด ไอติมโบราณ ผลิตภัณฑ์แปรรูป ผลไม้ : เงาะ ลองกอง ทุเรียน มังคุด โทร. 089-0991297, 089-0431330',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Spacer(),
                      Column(
                        children: [
                          Text('เหลือเวลา'),
                          Text(
                            '10นาที 20วินาที',
                            style: TextStyle(color: Colors.black54),
                          )
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text('ราคาตอนนี้'),
                          Text(
                            '30000 บาท',
                            style: TextStyle(color: Colors.black54),
                          )
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text('ผู้ประมูลราคาสูงสุด'),
                          Text(
                            'sattha duangmon',
                            style: TextStyle(color: Colors.black54),
                          )
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            child: SingleChildScrollView(
                child: Column(
              children: [
                for (var item in list)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(item),
                  ),
              ],
            )),
            width: MediaQuery.of(context).size.width / 1.3,
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 29),
            child: ButtonTheme(
              minWidth: MediaQuery.of(context).size.width,
              child: RaisedButton(
                color: Color.fromARGB(255, 87, 204, 153),
                onPressed: () {},
                child: Text(
                  'ประมูล',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
