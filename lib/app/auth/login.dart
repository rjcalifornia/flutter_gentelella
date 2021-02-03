import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: new GestureDetector(
          onTap: () {
            // call this method here to hide soft keyboard
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.height / 4,
                        margin: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        child: Column(
                          children: [
                            Flexible(
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    left: 0,
                                    bottom: 0,
                                    child: Container(
                                      child: Image.asset(
                                        'assets/main_logo.png',
                                        width: 120,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Sign in',
                        style: TextStyle(
                            color: Color(0xff73879C),
                            fontSize: 25.0,
                            fontWeight: FontWeight.normal),
                      ),
                      Container(
                        width: width < 800
                            ? MediaQuery.of(context).size.width
                            : MediaQuery.of(context).size.width / 2.65,
                        padding: EdgeInsets.symmetric(
                            vertical: 35.0, horizontal: 35.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 24,
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
                              decoration:
                                  InputDecoration(labelText: "Username"),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            TextField(
                              obscureText: true,
                              style: TextStyle(color: Colors.black),
                              decoration:
                                  InputDecoration(labelText: "Password"),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            RaisedButton(
                              child: Text(
                                "Ingresar",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, '/');
                              },
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
