import 'package:Sample/Dashboard.dart';
import 'package:Sample/main.dart';
import 'package:Sample/profile.dart';
import 'package:get/get.dart';
import 'package:Sample/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Sample/searchbar.dart';
import 'constants.dart';

class Navigation_Menu extends StatefulWidget {
//     int number;
// // number;
//   Navigation_Menu(this.number);
  @override
  _Navigation_MenuState createState() => _Navigation_MenuState();
}

class _Navigation_MenuState extends State<Navigation_Menu> {
  // _Navigation_MenuState(this.number);
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        // Navigator.pushReplacement(
        //   context,
        //   new MaterialPageRoute(
        //     builder: (context) => HomePage(),
        //   ),
        // );
        Get.off(HomePage());
      }
      if (index == 1) {
        // Navigator.pushReplacement(
        //   context,
        //   new MaterialPageRoute(
        //     builder: (context) => MyHomePage(),
        //   ),
        // );
        Get.off(MyHomePage());
      }
      if (index == 2) {
        // Navigator.pushReplacement(
        //   context,
        //   new MaterialPageRoute(
        //     builder: (context) => Dashboard(),
        //   ),
        // );
        Get.off(Dashboard());
      }
      if (index == 3) {
        // Navigator.pushReplacement(
        //   context,
        //   new MaterialPageRoute(
        //     builder: (context) => Wishlist(),
        //   ),
        // );
        Get.off(Wishlist());
      }
      if (index == 4) {
        // Navigator.pushReplacement(
        //   context,
        //   new MaterialPageRoute(
        //     builder: (context) => Profile(),
        //   ),
        // );
        Get.off(Profile());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 9,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.star_border, size: 30.0),
          title: Text("Featured"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, size: 30.0),
          title: Text("Search"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_filled, size: 30.0),
          title: Text("My Courses"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border, size: 30.0),
          title: Text("Wishlist"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle, size: 30.0),
          title: Text("Account"),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: kBestSellerColor,
      onTap: _onItemTapped,

    );
  }
}
