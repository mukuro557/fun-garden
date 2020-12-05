import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String nameau;
String email;
String imageUrl;

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded: $user');

    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);

    nameau = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;

    if (nameau.contains(" ")) {
      nameau = nameau.substring(0, nameau.indexOf(" "));
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences pic = await SharedPreferences.getInstance();
    pic.setString('picture', user.photoURL);
    prefs.setString('name', user.displayName);
    return '$user';
  }
  return null;
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  print('User Signed Out');
}
