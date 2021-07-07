import 'package:Sample/Navigation_Menu.dart';
import 'package:flutter/material.dart';

//import 'package:dynamic_treeview/dynamic_treeview.dart';

class MyHomePage extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);
  //final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: [BoxShadow(
            color: Color(0xFFD2D2D2),
            blurRadius: 1.0, // soften the shadow
            spreadRadius: 0.5, //extend the shadow
           /* offset: Offset(
              1.0, // Move to right 10  horizontally
              1.0, // Move to bottom 10 Vertically
            ),*/
          )]
              ),
              child: Row(
                children: <Widget>[
                  //  SvgPicture.asset("icons/search.svg"),
                  // IconButton(
                  //     icon: Icon(Icons.search),
                  //     onPressed: () {
                  //       showSearch(context: context, delegate: SearchBar());
                  //     }),
                  // Icons.search;
                  FlatButton(
                    
                    onPressed: () {
                      //showSearch(context: context, delegate: SearchBar());
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.search),
                        SizedBox(width: 10),
                        
                        Text(
                          "Search all Courses",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFA0A5BD),
                          ),
                        ),
                        SizedBox(width: 70),
                      ],
                    ),
                  ),
                  // Icon(Icons.search),
                ],
              ),
            ),
            ),
            
            
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          "Top Search:",
                          style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold,),
                        ),
                      ),
                    ])),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          //  textColor: Colors.white,
                          //  color: Colors.black,
                          child: Text("Daa"),
                          onPressed: () {},
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: RaisedButton(
                          //  textColor: Colors.white,
                          //  color: Colors.black,
                          child: Text("Python"),
                          onPressed: () {},
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: RaisedButton(
                          //  textColor: Colors.white,
                          //  color: Colors.black,
                          child: Text("Php"),
                          onPressed: () {},
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: RaisedButton(
                          //  textColor: Colors.white,
                          // color: Colors.black,
                          child: Text("Php"),
                          onPressed: () {},
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ])),
            SizedBox(height:10),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          "Categories:",
                          style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold,),
                        ),
                      ),
                    ])),
            Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 30,
                    width: 30,
                    child: Icon(Icons.account_balance_wallet, color: Colors.grey,size: 22,),
                  ),
                  SizedBox(width: 10),
                  Text("Finance & Accounting",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18.0,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.left),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 40,
                    width: 40,
                    child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                  ),
                ],
              ),),
            Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 30,
                    width: 30,
                    child: Icon(Icons.developer_mode, color: Colors.grey,size: 22,),
                  ),
                  SizedBox(width: 10),
                  Text("Development",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18.0,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.left),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 40,
                    width: 40,
                    child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                  ),
                ],
              ),),
            Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 30,
                    width: 30,
                    child: Icon(Icons.insert_chart, color: Colors.grey,size: 22),
                  ),
                  SizedBox(width: 10),
                  Text("Business",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18.0,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.left),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 40,
                    width: 40,
                    child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                  ),
                ],
              ),),
            Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 30,
                    width: 30,
                    child: Icon(Icons.desktop_windows, color: Colors.grey,size: 22),
                  ),
                  SizedBox(width: 10),
                  Text("IT & Software",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18.0,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.left),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 40,
                    width: 40,
                    child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                  ),
                ],
              ),),
            Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 30,
                    width: 30,
                    child: Icon(Icons.music_note, color: Colors.grey,size: 22),
                  ),
                  SizedBox(width: 10),
                  Text("Music",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18.0,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.left),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 40,
                    width: 40,
                    child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                  ),
                ],
              ),),
          ],
        ),
      ),
      bottomNavigationBar: Navigation_Menu(),
    );
  }
}
