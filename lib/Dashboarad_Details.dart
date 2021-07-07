import 'package:Sample/constants.dart';
import 'package:Sample/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:Sample/Navigation_Menu.dart';
import 'package:Sample/LecturesList.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'default_player.dart';

class StoreData extends StatefulWidget {
  String Course;
  StoreData(String course_name) {
    this.Course = course_name;
  }

  @override
  _State createState() => _State(Course);
}

class _State extends State<StoreData> {
  List<LectureList> ListofLinks = [];
  String Course;
  _State(course_name) {
    this.Course = course_name;
  }
  @override
  void initState() {
    // print("Har Har Mahadev");
    final fb = FirebaseDatabase.instance
        .reference()
        .child("Subjects")
        .child("AWS")
        .child("Lecture List");

    fb.once().then((DataSnapshot snap) {
      print(snap);
      int index = 0;
      String No_of_course;
      var data = snap.value;
      // var lecture = snap.value.keys;
      print(data);
      ListofLinks.clear();

      data.forEach((key, value) {
        index = index + 1;
        No_of_course = (index < 9) ? "0" + "$index" : "$index";
        ListofLinks.add(new LectureList(No_of_course, value['link'], key));
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
            SizedBox(height: 15),
            Positioned(top: 40, left: 0, child: _backButton()),
            SizedBox(height: MediaQuery.of(context).size.height - 420.0),
            Container(
              padding: EdgeInsets.only(left: 20),
              width: double.infinity,
              height: 90.0,
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Text("Course Name",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 32.0,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.left),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Author Name",
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

            //),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 1,

                  // _State stat =  new _State(),

                  itemCount: ListofLinks.length,
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
          ],
        ),
      ),
      bottomNavigationBar: Navigation_Menu(),
    );
  }
}

class Dashboard_Details extends StatelessWidget {
  String Course_name;
  Dashboard_Details(Name) {
    this.Course_name = Name;
  }
  @override
  Widget build(BuildContext context) {
    return StoreData(Course_name);
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
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Text(
                    number,
                    style: kHeadingextStyle.copyWith(
                      color: kTextColor.withOpacity(.5),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 20),
                  RichText(
                    text: TextSpan(
                      children: [
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
                      //shape: BoxShape.circle,
                      color: kGreenColor.withOpacity(0),
                    ),
                    child: Icon(Icons.play_arrow, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
