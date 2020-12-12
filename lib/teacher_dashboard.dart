import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class TeacherDashboardPage extends StatefulWidget {
  @override
  _TeacherDashboardPageState createState() => _TeacherDashboardPageState();
}

class _TeacherDashboardPageState extends State<TeacherDashboardPage> {
  final _auth = auth.FirebaseAuth.instance;
  auth.User loggedInUser;
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal[50],
        appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  _auth.signOut();
                  Navigator.pop(context);
                })
          ],
          backgroundColor: Colors.teal,
          title: Text(
            'Exam Section Dashboard',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.5,
              fontFamily: 'Sans Source Pro',
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: "Enter GR No. of Student",
                    prefixIcon: Icon(Icons.arrow_forward_rounded),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)))),
              ),
              SizedBox(
                height: 50.0,
              ),
              Material(
                elevation: 5,
                color: Colors.teal[600],
                borderRadius: BorderRadius.circular(32.0),
                child: MaterialButton(
                  onPressed: () async {
                    final player = AudioCache();
                    player.play('click.wav');
                  },
                  minWidth: 200.0,
                  height: 45.0,
                  splashColor: Colors.teal[900],
                  elevation: 20.0,
                  highlightElevation: 0.0,
                  child: Text(
                    "Upload Grade-Card",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.5,
                      fontFamily: 'Sans Source Pro',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
