import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'login_page.dart';
import 'package:get/get.dart';
import 'Navigation_Menu.dart';
import 'constants.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = new GoogleSignIn();
bool isGoogleSignIn = false;
String errorMessage = '';
String successMessage = '';

Future<bool> _googleSignout() async {
  try {
    await FirebaseAuth.instance.signOut();
    await auth.signOut();
    await googleSignIn.signOut();
    print("Har Har Har Mahadev");
    return true;
  } catch (e) {
    print("Har Har Mahadev");
    print(e);
  }
  Get.off(LoginPage());
}

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  void initState() {
    print("Hello");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Account",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 0.8,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.account_circle,
              size: 100,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Meet Manvar",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                letterSpacing: 0.8,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 55, right: 55, top: 0, bottom: 10),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5),
                  // child:Icon(Icons.email_outlined)
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "meet.manvar@gmail.com",
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      //fontWeight:FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: 0.8,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: FlatButton(
              child: Text(
                "Sign out",
                style: TextStyle(
                  color: Color(0xFF046eF1),
                  fontSize: 22,
                  //letterSpacing: 0.8,
                ),
              ),
              onPressed: () {
                _googleSignout().then((response) {
                  if (response) {
                    setState(() {
                      isGoogleSignIn = false;
                      successMessage = '';
                    });
                  }
                });
                Get.off(LoginPage());
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Navigation_Menu(),
    );
  }
}
