import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'login_student.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_student.dart';

//void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textcontrol1 = TextEditingController();
  final textcontrol2 = TextEditingController();
  final _auth = FirebaseAuth.instance;
  //final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String email;
  String password;
  bool showProgress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Center(
          child: Text("Registration Page"),
        ),
        backgroundColor: Colors.teal[300],
      ),
      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: showProgress,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Register",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: textcontrol1,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                    hintText: "Enter your Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(32.0)))),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: textcontrol2,
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                    hintText: "Enter your Password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(32.0)))),
              ),
              SizedBox(
                height: 20.0,
              ),
              Material(
                elevation: 5,
                color: Colors.teal[100],
                borderRadius: BorderRadius.circular(32.0),
                child: MaterialButton(
                  onPressed: () async {
                    textcontrol1.clear();
                    textcontrol2.clear();
                    setState(() {
                      showProgress = true;
                    });
                    final player = AudioCache();
                    player.play('click.wav');
                    try {
                      final new_user =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (new_user != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyLoginPage()),
                        );
                      }
                      setState(() {
                        showProgress = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  splashColor: Colors.teal[900],
                  elevation: 20.0,
                  highlightElevation: 0.0,
                  minWidth: 200.0,
                  height: 45.0,
                  child: Text(
                    "Register",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              Text(
                "Already Registered?",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Material(
                elevation: 5,
                color: Colors.teal[100],
                borderRadius: BorderRadius.circular(32.0),
                child: MaterialButton(
                  onPressed: () {
                    textcontrol1.clear();
                    textcontrol2.clear();
                    final player = AudioCache();
                    player.play('click.wav');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyLoginPage()),
                    );
                  },
                  splashColor: Colors.teal[900],
                  elevation: 20.0,
                  highlightElevation: 0.0,
                  minWidth: 200.0,
                  height: 45.0,
                  child: Text(
                    "Go to Login",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
