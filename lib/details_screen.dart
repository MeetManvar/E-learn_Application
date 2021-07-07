import 'package:Sample/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Sample/default_player.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:Sample/LecturesList.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Dashboarad_Details.dart';
import 'package:Sample/mysql.dart';

class StoreData extends StatefulWidget {
  String Course;
  String image;
  StoreData(String course_name, String course_image) {
    this.Course = course_name;
    this.image = course_image;
  }

  @override
  _State createState() => _State(Course, image);
}

class _State extends State<StoreData> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String UserId = '';
  String Enroll = 'Enroll Now';
  // String image =
  //   'https://firebasestorage.googleapis.com/v0/b/fir-demo-46019.appspot.com/o/Images%2Fcomputer_networking.jpg?alt=media&token=f5263185-fdba-4241-b701-8a013b4cfae3';
  // getCurrentUser() async {
  //   final FirebaseUser user = await auth.currentUser();
  //   final uid = user.uid;
  //   // Similarly we can get email as well
  //   //final uemail = user.email;
  //   UserId = uid;
  //   //Useremail = uemail;
  //   //print('User ID:  '+UserId);
  //   print("Updated");
  //   //print(uemail);
  // }

  final fb = FirebaseDatabase.instance.reference().child("Students");
  //final check = FirebaseDatabase.instance.reference().child("Students").child(UserId);
  List<LectureList> ListofLinks = [];
  String Course, UserEmail;
  int check = 0;
  String image;
  _State(course_name, Image) {
    this.Course = course_name;
    this.image = Image;
  }
  @override
  void initState() {
    // print("Har Har Mahadev");

    final fb = FirebaseDatabase.instance
        .reference()
        .child("Subjects")
        .child("AWS")
        .child("Lecture List");

    //getCurrentUser();

    print(UserId);
    fb.once().then((DataSnapshot snap) {
      // print(snap);
      int index = 0;
      String No_of_course;
      var data = snap.value;
      // var lecture = snap.value.keys;
      // print(data);
      ListofLinks.clear();

      data.forEach((key, value) {
        index = index + 1;
        No_of_course = (index < 9) ? "0" + "$index" : "$index";
        String Name = "Preview " + No_of_course;
        ListofLinks.add(new LectureList(No_of_course, value['link'], Name));
      });
      setState(() {});
    });
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF5F4EF),
          image: DecorationImage(
            image: AssetImage("images/ux_big.png"),
            alignment: Alignment.topRight,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 18),
            Positioned(left: 0, child: _backButton()),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // SvgPicture.asset("icons/arrow-left.svg"),
                      //SvgPicture.asset("icons/more-vertical.svg"),
                    ],
                  ),
                  SizedBox(height: 30),
                  ClipPath(
                    clipper: BestSellerClipper(),
                    child: Container(
                      color: kBestSellerColor,
                      padding: EdgeInsets.only(
                          left: 10, top: 5, right: 20, bottom: 5),
                      child: Text(
                        "10k Students Enrolled...".toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(Course, style: kHeadingextStyle),
                  SizedBox(height: 16),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(height: 60),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.white,
                ),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 1,

                  // _State stat =  new _State(),

                  itemCount: (ListofLinks.length < 5) ? ListofLinks.length : 5,
                  // crossAxisSpacing: 20,
                  // mainAxisSpacing: 20,
                  itemBuilder: (context, index) {
                    return FlatButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  VideoPlayer(ListofLinks[index].link)),
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Text("Course Content", style: kTitleTextStyle),
                                SizedBox(height: 10),
                                CourseContent(
                                  number: ListofLinks[index].number,
                                  // duration: 5.35,
                                  title: ListofLinks[index].title,
                                  link: ListofLinks[index].link,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },

                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),

                  //
                ),
              ),
            ),
            //  Expanded(
            // Container(
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(50),
            //     color: Colors.white,
            //   ),
            //   child: Column(
            //     children: <Widget>[
            Positioned(
              // right: 0,
              // left: 0,
              // bottom: 0,
              child: Container(
                padding: EdgeInsets.all(10),
                height: 65,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -3),
                      blurRadius: 1,
                      spreadRadius: 0.5,
                      color: kTextColor.withOpacity(0.1),
                    ),
                  ],
                ),
                child: FlatButton(
                  onPressed: () {
                    var db = new Mysql();
                    db.getConnection().then((conn) async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      UserEmail = prefs.getString('email');
                      print(UserEmail);
                      print("Mahadev");
                      int i = 0;

                      String GetEmailIDQuery =
                          'SELECT id FROM NPTEL.user_account where email="${UserEmail}";';
                      var results1 = await conn.query(GetEmailIDQuery);
                      int GetEmail;
                      for (var row in results1) {
                        GetEmail = row[0];
                      }
                      String CourseIDQuery =
                          'SELECT id FROM NPTEL.course where course_title="$Course";';
                      var results2 = await conn.query(CourseIDQuery);
                      int GetCourseID;
                      for (var row in results2) {
                        GetCourseID = row[0];
                      }
                      String IDQuery =
                          'SELECT COUNT(*) FROM NPTEL.course_enrollment ;';
                      var results3 = await conn.query(IDQuery);
                      int ID;
                      for (var row in results3) {
                        ID = row[0];
                      }
                      String CheckCourseExitsOrNot =
                          'SELECT COUNT(id) FROM NPTEL.course_enrollment where course_id=$GetCourseID AND student_id=$GetEmail;';
                      var results4 = await conn.query(CheckCourseExitsOrNot);
                      int check;
                      for (var row in results2) {
                        check = row[0];
                      }
                       if (check == 0) {
                      var Insert = await conn.query(
                          "INSERT INTO NPTEL.course_enrollment (id,course_id,student_id) VALUES (?,?,?)",
                          [ID, GetCourseID, GetEmail]);
                       } else {
                      print("You Have  Enrolled this course..");
                       }

                      // String GetImg = 'select course_authored_by from NPTEL.course;';

                      // var results = await conn.query(GetName);
                      // for (var row in results) {
                      //   CourseNames.add(new CoursesName('${row[0]}'));
                      //   print("Har Har Mahadev");
                      //   i = i + 1;
                      // }

                      conn.close();
                      setState(() {});
                    });
                    //  int check = 0;
                    // final Check = FirebaseDatabase.instance
                    //     .reference()
                    //     .child("Students")
                    //     .child(UserId);
                    // print(UserId);
                    // Check.once().then((DataSnapshot snap1) {
                    //   var data1 = snap1.value;
                    //   print(data1);
                    //   if (data1 == true) {
                    //     fb.child(UserId).push().set(
                    //         {"Course": Course, "image": image}).then((value) {
                    //       print("UserId");
                    //       Enroll =
                    //           "You have Succesfully Enrolled to this course";
                    //     });
                    //   }

                    //   data1.forEach((key, value) {
                    //     // Categories.add(new Category(value['Course'], value['image']));
                    //     if (value['Course'] == Course) {
                    //       check = 1;
                    //       print("Har Har Mahadev");
                    //       check = check + 1;
                    //       Enroll = "You have already Enrolled to this course";
                    //     }
                    //   });
                    //   if (check == 0) {
                    //     print(check);
                    //     fb.child(UserId).push().set(
                    //         {"Course": Course, "image": image}).then((value) {
                    //       print("UserId");
                    //       Enroll =
                    //           "You have Succesfully Enrolled to this course";
                    //     });
                    //   }
                    // });
                  },
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Free",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: kBestSellerColor,
                          ),
                          child: Text(
                            Enroll,
                            style: kSubtitleTextSyule.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //  ],
            //  ),
            //  ),
            // )
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  String Course_name;
  String Course_image;
  DetailsScreen(Name, Image) {
    this.Course_name = Name;
    this.Course_image = Image;
  }
  @override
  Widget build(BuildContext context) {
    return StoreData(Course_name, Course_image);
  }
}

class CourseContent extends StatelessWidget {
  final String number;
  // final double duration;
  final String title;
  final String link;
  const CourseContent({
    Key key,
    this.number,
    //this.duration,
    this.title,
    this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: <Widget>[
          Text(
            number,
            style: kHeadingextStyle.copyWith(
              color: kTextColor.withOpacity(.15),
              fontSize: 32,
            ),
          ),
          SizedBox(width: 20),
          RichText(
            text: TextSpan(
              children: [
                // TextSpan(
                //   text: link,
                //   style: TextStyle(
                //     color: kTextColor.withOpacity(.5),
                //     fontSize: 18,
                //   ),
                // ),
                TextSpan(
                  text: title,
                  style: kSubtitleTextSyule.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: 20),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kGreenColor.withOpacity(1),
            ),
            child: Icon(Icons.play_arrow, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
