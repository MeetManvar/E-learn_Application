// import 'package:firebase_auth/firebase_auth.dart';
import 'package:Sample/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Sample/mysql.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // final FirebaseAuth auth = FirebaseAuth.instance;
  // final fb = FirebaseDatabase.instance.reference().child("Students");
  String errorMessage = '';
  String successMessage = '';
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  String _emailId;
  String _password, _FirstName, _LastName;
  final _firstnameController = TextEditingController(text: '');
  final _lastnameController = TextEditingController(text: '');
  final _emailIdController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  final _confirmPasswordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Charusat E-learn'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Charusat E-learn',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20),
                    )),
                Form(
                  key: _formStateKey,
                  autovalidate: true,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          onSaved: (value) {
                            _FirstName = value;
                          },
                          keyboardType: TextInputType.text,
                          controller: _firstnameController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.blue,
                                    width: 2,
                                    style: BorderStyle.solid)),
                            labelText: 'First Name',
                            icon: Icon(
                              Icons.textsms,
                              color: Colors.blue,
                            ),
                            fillColor: Colors.white,
                            labelStyle: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          onSaved: (value) {
                            _LastName = value;
                          },
                          keyboardType: TextInputType.text,
                          controller: _lastnameController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.blue,
                                    width: 2,
                                    style: BorderStyle.solid)),
                            labelText: 'Last Name',
                            icon: Icon(
                              Icons.textsms,
                              color: Colors.blue,
                            ),
                            fillColor: Colors.white,
                            labelStyle: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          validator: validateEmail,
                          onSaved: (value) {
                            _emailId = value;
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailIdController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.blue,
                                    width: 2,
                                    style: BorderStyle.solid)),
                            labelText: 'Email Id',
                            icon: Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                            fillColor: Colors.white,
                            labelStyle: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          validator: validatePassword,
                          onSaved: (value) {
                            _password = value;
                          },
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.blue,
                                    width: 2,
                                    style: BorderStyle.solid)),
                            labelText: 'Password',
                            icon: Icon(
                              Icons.lock,
                              color: Colors.blue,
                            ),
                            fillColor: Colors.white,
                            labelStyle: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: TextFormField(
                          validator: validateConfirmPassword,
                          obscureText: true,
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.blue,
                                    width: 2,
                                    style: BorderStyle.solid)),
                            labelText: ' Confirm Password',
                            icon: Icon(
                              Icons.lock,
                              color: Colors.blue,
                            ),
                            fillColor: Colors.white,
                            labelStyle: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /*FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),*/
                (errorMessage != ''
                    ? Text(
                        errorMessage,
                        style: TextStyle(color: Colors.red),
                      )
                    : Container()),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Register'),
                      onPressed: () {
                        //print(_emailIdController.text);
                        // print(_passwordController.text);
                        if (_formStateKey.currentState.validate()) {
                          _formStateKey.currentState.save();
                          signUp(_FirstName, _LastName, _emailId, _password);
                        }
                      },
                    )),
                (successMessage != ''
                    ? Text(
                        successMessage,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      )
                    : Container()),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                      ),
                      Text('or'),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Already have an account?'),
                    FlatButton(
                      textColor: Colors.blue,
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )),
              ],
            )));
  }

  Future signUp(FirstName, LastName, email, password) {
    // fb.child(_emailId).set(true).then((value){print("Done");});
    try {
      var db = new Mysql();
      db.getConnection().then((conn) async {
        int i = 0;
        //    var result = await conn.query(
        // 'insert into users (name, email, age) values (?, ?, ?)',
        // ['Bob', 'bob@bob.com', 25]);
        // String Query = "INSERT INTO NPTEL.user_account (auth_provider,email,last_name,password) VALUES (?,?,?,?)", "["Local", _emailId, _LastName, _password]";
        // conn.query(Query).then((value) {
        //   print(value);
        // });
        var result2 = await conn.query(
            "INSERT INTO NPTEL.user_account (auth_provider,email,last_name,password) VALUES (?,?,?,?)",
            ["Local", _emailId, _LastName, _password]);
        conn.close();
        setState(() {});
      });
    } catch (e) {
      handleError(e);
      return null;
    }
  }

  handleError(PlatformException error) {
    print(error);
    switch (error.code) {
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        setState(() {
          errorMessage = 'Email Id already Exist!!!';
        });
        break;
      default:
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty || !regex.hasMatch(value))
      return 'Enter Valid Email Id!!!';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.trim().isEmpty || value.length < 6 || value.length > 14) {
      return 'Minimum 6 & Maximum 14 Characters!!!';
    }
    return null;
  }

  String validateConfirmPassword(String value) {
    if (value.trim() != _passwordController.text.trim()) {
      return 'Password Mismatch!!!';
    }
    return null;
  }
}
