import 'package:flutter/material.dart';
import 'package:Sample/Navigation_Menu.dart';

class Wishlist extends StatefulWidget {

  @override
  _Wishlist createState() => _Wishlist();
}

class _Wishlist extends State<Wishlist> {

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
          "Wishlist",
          style: TextStyle(
            fontWeight:FontWeight.bold,
            fontSize: 24,
            letterSpacing: 0.8,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Image(
                image: AssetImage('images/wishlist.png'),
                height: 100,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Your Wishlist is empty !",
                style: TextStyle(
                  fontSize: 22,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ],
        ),
         
      ),
     bottomNavigationBar: Navigation_Menu(),
    );
  }
}