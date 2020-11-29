import 'package:flutter/material.dart';
import 'package:fungarden/login.dart';
import 'login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profilescreen extends StatelessWidget {
  final UserDetail detailUser;
  Profilescreen({Key key, @required this.detailUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoogleSignIn _signin = GoogleSignIn();
    Scaffold(
      appBar: AppBar(
        title: Text(detailUser.username),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.dangerous),
              onPressed: () {
                _signin.signOut();
                print("signout");
                Navigator.pop(context);
              })
        ],
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(detailUser.photouri),
            )
          ],
        ),
      ),
    );
  }
}
