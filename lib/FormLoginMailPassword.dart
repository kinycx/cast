import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cast/database.dart';
import 'myHomePage.dart';
import 'auth.dart';

class FormLoginMailPassword extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Login con mail e password';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  User user;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: mail,
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'Inserisci la tua mail',
              labelText: 'Mail',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Perfavore inserisci la tua mail';
              }
              return null;
            },
          ),
          TextFormField(
            controller: password,
            enableSuggestions: false,
            autocorrect: false,
            obscureText:true,
            decoration: const InputDecoration(
              icon: Icon(Icons.enhanced_encryption_rounded),
              hintText: 'Inserisci la tua password',
              labelText: 'Password',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Perfavore inserisci la tua password';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                createUserWithEmailAndPassword(this.mail.text, this.password.text)
                    .then((user) => {
                  this.user = user.user,
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage(this.user)))
                });
              },
              child: Text('Login'),
            ),
          ),
        ],
      ),

    );
  }
}


