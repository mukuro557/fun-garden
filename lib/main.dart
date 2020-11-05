import 'package:flutter/material.dart';
import 'package:fungarden/adddelete_farm.dart';
import 'package:fungarden/addpro.dart';
import 'package:fungarden/addproduct.dart';
import 'package:fungarden/auction.dart';
import 'package:fungarden/auctionpro.dart';
import 'package:fungarden/history.dart';
import 'package:fungarden/money.dart';
import 'package:fungarden/newmain.dart';
import 'package:fungarden/productstatus.dart';
import 'package:fungarden/sellhistory.dart';
import 'package:fungarden/statusCus.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/add_pro',
    routes: {
      '/add_delete': (context) => Adddelete(),
      '/add_product': (context) => AddProduct(),
      '/add_pro': (context) => AddP(),
      '/auction': (context) => Auction(),
      '/auction_pro': (context) => AuctionProduct(),
      '/history': (context) => History(),
      '/money': (context) => Money(),
      '/newmain': (context) => NewmainPage(),
      '/producstatus': (context) => ProductSta(),
      '/sellhistory': (context) => Sellhistory(),
      '/statusCus': (context) => StatusCus(),
    },
  ));
}
