import 'package:flutter/material.dart';
import 'package:fungarden/auctionpro.dart';
import 'package:fungarden/login.dart';
import 'package:fungarden/newAuction.dart';
import 'package:fungarden/newmain.dart';
import 'package:fungarden/owner.dart';
import 'package:fungarden/regis.dart';
import 'package:fungarden/thefristpageapp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() 
 
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: '/thefristpageapp',
    routes: {
      '/thefristpageapp': (context) => Thefristpageapp(),
      '/auction': (context) => NewAuction(),
      '/auction_pro': (context) => AuctionProduct(),
      '/owner': (context) => Owner(),
      '/newmain': (context) => NewmainPage(),
      '/login': (context) => Login(),
      '/regis': (context) => Regis(),
    },
  ));
}

