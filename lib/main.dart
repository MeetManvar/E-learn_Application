import 'dart:convert';
import 'package:Sample/Navigation_Menu.dart';
import 'package:Sample/constants.dart';
import 'package:Sample/details_screen.dart';
import 'package:Sample/model/category.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:Sample/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'package:flutter/material.dart';
import 'package:Sample/mysql.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sample App',
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: SplashScreen(),
    );
  }
}

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  String Username = "Avi";

  String User = " ";
  List<Category> Categories = [];
  List<CoursesName> CourseNames = [];
  List<CoursesImg> CourseImgs = [];

  void initState() {
    print("Har Har Mahadev");
    // final fb = FirebaseDatabase.instance.reference().child("Subjects");

    var db = new Mysql();
    db.getConnection().then((conn) async {
      CourseNames.clear();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Username = prefs.getString('UserName');
      int i = 0;
      String GetName = 'select course_title from NPTEL.course;';
      // String GetImg = 'select course_authored_by from NPTEL.course;';

      var results = await conn.query(GetName);
      for (var row in results) {
        CourseNames.add(new CoursesName('${row[0]}'));
        print("Har Har Mahadev");
        i = i + 1;
      }

      conn.close();
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Top Courses',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 200.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: CourseNames.length,
                itemBuilder: (BuildContext context, int index) {
                  // Destination destination = destinations[index];

                  return FlatButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: EdgeInsets.all(10),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                CourseNames[index].name,
                                "https://firebasestorage.googleapis.com/v0/b/fir-demo-46019.appspot.com/o/Images%2Fpython-programming-course-1588245473-5401649.png?alt=media&token=0a3e59aa-1436-4f12-be1d-c2a1cf006f9a")),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          //height: index.isEven ? 200 : 240,
                          height: 120,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://firebasestorage.googleapis.com/v0/b/fir-demo-46019.appspot.com/o/Images%2Fpython-programming-course-1588245473-5401649.png?alt=media&token=0a3e59aa-1436-4f12-be1d-c2a1cf006f9a"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              CourseNames[index].name,
                              style: kTitleTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Courses of Charusat',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 206.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: CourseNames.length,
                itemBuilder: (BuildContext context, int index) {
                  // Destination destination = destinations[index];

                  return FlatButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: EdgeInsets.all(10),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                CourseNames[index].name,
                                "https://firebasestorage.googleapis.com/v0/b/fir-demo-46019.appspot.com/o/Images%2Fpython-programming-course-1588245473-5401649.png?alt=media&token=0a3e59aa-1436-4f12-be1d-c2a1cf006f9a")),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          //height: index.isEven ? 200 : 240,
                          height: 120,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://firebasestorage.googleapis.com/v0/b/fir-demo-46019.appspot.com/o/Images%2Fpython-programming-course-1588245473-5401649.png?alt=media&token=0a3e59aa-1436-4f12-be1d-c2a1cf006f9a"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              CourseNames[index].name,
                              style: kTitleTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Navigation_Menu(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class SearchBar extends SearchDelegate<String> {
  final Courses = [
    "Python",
    "Aws",
    "Computer Networking",
    "Java",
    "Operating System"
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    // throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query, style: TextStyle(fontSize: 20)),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final my_list = query.isEmpty
        ? Courses
        : Courses.where((str) =>
                str.startsWith(query[0].toUpperCase() + query.substring(1)))
            .toList();
    return my_list.isEmpty
        ? Text("No Course Found....", style: TextStyle(fontSize: 20))
        : ListView.builder(
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                showResults(context);
              },
              title: Text(my_list[index]),
            ),
            itemCount: my_list.length,
          );
  }
}
