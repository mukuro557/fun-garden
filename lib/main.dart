import 'package:flutter/material.dart';
import 'package:fungarden/adddelete_farm.dart';
import 'package:fungarden/addpro.dart';
import 'package:fungarden/addproduct.dart';
import 'package:fungarden/auction.dart';
import 'package:fungarden/auctionpro.dart';
import 'package:fungarden/history.dart';
import 'package:fungarden/login.dart';
import 'package:fungarden/money.dart';
import 'package:fungarden/newAuction.dart';
import 'package:fungarden/newmain.dart';
import 'package:fungarden/owner.dart';
import 'package:fungarden/productstatus.dart';
import 'package:fungarden/sellhistory.dart';
import 'package:fungarden/statusCus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fungarden/auction.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/add_delete': (context) => Adddelete(),
     
      '/add_product': (context) => AddProduct(),
      '/add_pro': (context) => AddP(),
      '/auction': (context) => NewAuction(),
      '/auction_pro': (context) => AuctionProduct(),
      '/owner': (context) => Owner(),
      '/history': (context) => History(),
      '/money': (context) => Money(),
      '/newmain': (context) => NewmainPage(),
      '/producstatus': (context) => ProductSta(),
      '/sellhistory': (context) => Sellhistory(),
      '/statusCus': (context) => StatusCus(),
      '/login': (context) => Login(),
    },
  ));
}

