import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fungarden/auction.dart';
import 'package:fungarden/profile.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  String _url = 'http://10.0.2.2:35000/';
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  void showAlert(String message) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Result'),
          content: Text(message),
        );
      },
    );
  }

  Future<FirebaseUser> _signIn(BuildContext context) async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    FirebaseUser userdetail =
        (await _firebaseAuth.signInWithCredential(credential)).user;
    ProviderDetail providerinfo = new ProviderDetail(userdetail.tenantId);
    List<ProviderDetail> provideData = new List<ProviderDetail>();
    provideData.add(providerinfo);
    UserDetail detail = new UserDetail(
        userdetail.tenantId,
        userdetail.displayName,
        userdetail.photoURL,
        userdetail.email,
        provideData);
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => Profilescreen(detailUser: detail)));
    return userdetail;
  }

  _normallogin() async {
    try {
      http.Response response = await http.post(
        _url + 'login',
        body: {'username': _username.text, 'password': _password.text},
      ).timeout(Duration(seconds: 5));
      
      var res =jsonDecode(response.body) ;
      if (response.statusCode == 200) {
        print(res['Role']);
        if(res['Role'] == 0){
Navigator.pushNamed(context, "/newmain");
        }else{}
        Navigator.pushNamed(context, "/owner");
      } else {
        showAlert(response.body.toString());
      }
    } on TimeoutException catch (e) {
      print('Timeout: $e');
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 0, 5),
              child: Text(
                'เข้าสู่ระบบ',
                style: TextStyle(
                    color: Color.fromRGBO(34, 87, 122, 10),
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            )),
            SizedBox(
              height: 35,
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 20, 0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 30, 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.alternate_email,
                                  color: Color.fromRGBO(34, 87, 122, 10),
                                ),
                              ),
                              Expanded(
                                  flex: 9,
                                  child: TextField(
                                    controller: _username,
                                    decoration: InputDecoration(
                                      hintText: 'ชื่อผู้ใช้',
                                      hintStyle: TextStyle(color: Colors.black),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 30, 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.lock_open,
                                  color: Color.fromRGBO(34, 87, 122, 10),
                                ),
                              ),
                              Expanded(
                                  flex: 9,
                                  child: TextField(
                                    controller: _password,
                                    decoration: InputDecoration(
                                      hintText: 'รหัสผ่าน',
                                      hintStyle: TextStyle(color: Colors.black),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Spacer(),
                              Text(
                                'ลืมรหัสผ่าน?',
                                style: TextStyle(
                                  color: Color.fromRGBO(34, 87, 122, 10),
                                ),
                              )
                            ],
                          ),
                        ),
                        ButtonTheme(
                          minWidth: 300.0,
                          height: 50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(44, 20, 44, 5),
                            child: RaisedButton(
                              elevation: 2.0,
                              hoverColor: Colors.green,
                              color: Color.fromRGBO(56, 163, 165, 10),
                              child: Text(
                                "ลงชื่อเข้าใช้",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                _normallogin();
                              },
                            ),
                          ),
                        ),
                        ButtonTheme(
                          minWidth: 300.0,
                          height: 50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(44, 10, 44, 5),
                            child: RaisedButton(
                              elevation: 2.0,
                              hoverColor: Colors.white,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Image(
                                      image: AssetImage(
                                          'assets/images/google.png')),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Sign in with Google".toUpperCase(),
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(34, 87, 122, 10),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () => _signIn(context)
                                  .then((FirebaseUser user) => print(user))
                                  .catchError((e) => print(e)),
                            ),
                          ),
                        ),
                        ButtonTheme(
                          minWidth: 300.0,
                          height: 50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(44, 5, 44, 5),
                            child: RaisedButton(
                              elevation: 2.0,
                              hoverColor: Colors.grey,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Image(
                                      image: AssetImage(
                                          'assets/images/facebook.png')),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Sign in with facebook".toUpperCase(),
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(34, 87, 122, 10),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Image.asset(
                  'assets/images/greenbg2.png',
                  alignment: FractionalOffset.bottomCenter,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserDetail {
  final String detailprovide;
  final String username;
  final String photouri;
  final String userEmail;
  final List<ProviderDetail> provideData;
  UserDetail(this.detailprovide, this.username, this.photouri, this.userEmail,
      this.provideData);
}

class ProviderDetail {
  ProviderDetail(this.detailprovide);
  final String detailprovide;
}
