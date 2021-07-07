import 'dart:collection';

import 'package:Sample/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Dashboarad_Details.dart';
import 'package:Sample/Navigation_Menu.dart';
import 'package:flutter/material.dart';
import 'package:Sample/model/category.dart';
import 'package:Sample/LecturesList.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:Sample/mysql.dart';

class Dash extends StatefulWidget {
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  List<Category> Categories = [];
  List<CoursesName> CourseNames = [];
  void initState() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    String UserId = '';
    int Len;
    //void getCurrentUser()  {
    // final FirebaseUser user = await auth.currentUser();
    // final uid = user.uid;
    // // Similarly we can get email as well
    // //final uemail = user.email;
    // UserId = uid;
    // //Useremail = uemail;
    // //print('User ID:  '+UserId);

    // //print(uemail);
    // final fb =
    //     FirebaseDatabase.instance.reference().child("Students").child(UserId);

    // fb.once().then((DataSnapshot snap) {
    //   print(snap);
    //   var data = snap.value;
    //   // var lecture = snap.value.keys;
    //   print(data);
    //   Categories.clear();

    //   data.forEach((key, value) {
    //     Categories.add(new Category(value['Course'], value['image']));
    //   });
    var db = new Mysql();
    db.getConnection().then((conn) async {
      CourseNames.clear();
      int i = 0;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String UserEmail = prefs.getString('email');
      print(UserEmail);
      print("Mahadev");
      //int i = 0;

      String GetEmailIDQuery =
          'SELECT id FROM NPTEL.user_account where email="${UserEmail}";';
      var results1 = await conn.query(GetEmailIDQuery);
      int GetEmail;
      for (var row in results1) {
        GetEmail = row[0];
      }
      print(GetEmail);
      print("Mahadev Har");
      String GetID =
          'select course_title from  NPTEL.course inner join NPTEL.course_enrollment on NPTEL.course_enrollment.course_id = NPTEL.course.id where student_id = $GetEmail';
      print("Mahadev Har Har");
      var results = await conn.query(GetID);
      for (var row in results) {
        CourseNames.add(new CoursesName(row[0]));
        print(results);

        i = i + 1;
      }
      Len = CourseNames.length;
      print(Len);
      conn.close();
      setState(() {});
    });

    //setState(() {});

    // getCurrentUser();
    print(UserId);

    // List<Category> result = LinkedHashSet<String>.from(Categories).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "My Courses",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 0.8,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 0, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //  SvgPicture.asset("icons/menu.svg")
                //Icon(Icons.menu),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(0),
                crossAxisCount: 1,
                itemCount: CourseNames.length,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                itemBuilder: (context, index) {
                  return FlatButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Dashboard_Details(CourseNames[index].name)),
                      );
                    },
                    child: InkWell(
                      child: Container(
                        height: 125.0,
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(20),
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://firebasestorage.googleapis.com/v0/b/fir-demo-46019.appspot.com/o/Images%2Fpython-programming-course-1588245473-5401649.png?alt=media&token=0a3e59aa-1436-4f12-be1d-c2a1cf006f9a"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(width: 15.0),
                            Container(
                              height: 100.0,
                              width: MediaQuery.of(context).size.width - 155,
                              child: ListView(
                                primary: false,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      CourseNames[index].name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20.0,
                                      ),
                                      maxLines: 2,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Jeff Bezos",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                        color: Colors.blueGrey[300],
                                      ),
                                      maxLines: 1,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          /*children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: NetworkImage(Categories[index].image),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              Categories[index].name,
                              style: kTitleTextStyle,
                            ),
                          ),
                        ),
                        // Text(
                        //   '${categories[index].Instructor}',
                        //   style: TextStyle(
                        //     color: kTextColor.withOpacity(.5),
                        //   ),
                        // )
                      ],*/
                        ),
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Navigation_Menu(),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dash();
  }
}
