import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cast/myHomePage.dart';
import 'FormLoginMailPassword.dart';
import 'auth.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Hello World!')), body: Body());
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  User user;

  @override
  void initState() {
    super.initState();
    signOutGoogle();
  }

  void click() {
    signInWithGoogle().then((user) => {
          this.user = user,
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyHomePage(user)))
        });
  }

  void clickMailPasswordLogin() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => FormLoginMailPassword()));
  }

  void clickFacebookLogin() {
   // Navigator.push(context,
     //   MaterialPageRoute(builder: (context) => FacebookLogin()));
  }

  Widget googleLoginButton() {
    return OutlineButton(
        onPressed: this.click,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        splashColor: Colors.grey,
        borderSide: BorderSide(color: Colors.grey),
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage('assets/google_logo.png'), height: 25),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('Sign in with Google',
                        style: TextStyle(color: Colors.grey, fontSize: 15)))
              ],
            )));
  }

  Widget mailPasswordLoginButton() {
    return OutlineButton(
        onPressed: this.clickMailPasswordLogin,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        splashColor: Colors.grey,
        borderSide: BorderSide(color: Colors.grey),
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage('assets/mail_password_login.png'), height: 25),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('Login con mail e password',
                        style: TextStyle(color: Colors.grey, fontSize: 15)))
              ],
            )));
  }

  Widget facebookLoginButton() {
    return OutlineButton(
        onPressed: this.clickFacebookLogin,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        splashColor: Colors.grey,
        borderSide: BorderSide(color: Colors.grey),
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage('assets/facebookLogin.png'), height: 25),
                Padding(
                    padding: EdgeInsets.only(left: 10)),
              ],
            )));
  }

  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
          googleLoginButton(),
          mailPasswordLoginButton(),
          facebookLoginButton(),
        ]));
  }

}
