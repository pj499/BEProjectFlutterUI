import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentDashboardPage extends StatefulWidget {
  @override
  _StudentDashboardPageState createState() => _StudentDashboardPageState();
}

class _StudentDashboardPageState extends State<StudentDashboardPage> {
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
    //checkAuthentication();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[50],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal,
          actions: [
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  _auth.signOut();
                  Navigator.pop(context);
                })
          ],
          title: Text(
            'Student Dashboard',
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
                    "Download My Grade-Card",
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
