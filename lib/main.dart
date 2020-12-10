import 'package:audioplayers/audio_cache.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'student_registration.dart';
import 'teacher_registration.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          backgroundColor: Colors.teal[50],
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.teal,
            title: Text(
              'WELCOME !',
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                fontSize: 30.0,
                letterSpacing: 1.5,
              ),
            ),
          ),
          body: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 200.0),
                    GestureDetector(
                      onTap: () {
                        final player = AudioCache();
                        player.play('click.wav');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return TeacherHomePage();
                          }),
                        );
                      },
                      child: CircleAvatar(
                        radius: 70.0,
                        backgroundImage: AssetImage('images/university.jpeg'),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    RaisedButton(
                      onPressed: () {
                        final player = AudioCache();
                        player.play('click.wav');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeacherHomePage()),
                        );
                      },
                      color: Colors.teal[600],
                      //borderRadius: BorderRadius.circular(32.0),
                      //highlightColor: Colors.teal[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      splashColor: Colors.teal[900],
                      padding: EdgeInsets.all(20.0),
                      elevation: 20.0,
                      highlightElevation: 0.0,
                      child: Text(
                        'EXAM SECTION',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.5,
                          fontFamily: 'Sans Source Pro',
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        final player = AudioCache();
                        player.play('click.wav');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MyHomePage();
                            },
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 70.0,
                        backgroundImage: AssetImage('images/student.jpeg'),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    RaisedButton(
                      onPressed: () {
                        final player = AudioCache();
                        player.play('click.wav');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      },
                      padding: EdgeInsets.all(20.0),
                      color: Colors.teal[600],
                      splashColor: Colors.teal[900],
                      elevation: 20.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      highlightElevation: 0.0,
                      child: Text(
                        'STUDENT',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.5,
                          fontFamily: 'Sans Source Pro',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.blue,
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Colors.orange,
//           title: Text(
//             'HOME',
//             style: TextStyle(
//               fontFamily: 'Source Sans Pro',
//               fontSize: 30.0,
//               letterSpacing: 2.5,
//             ),
//           ),
//         ),
//         body: SafeArea(
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Column(
//                 //mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   SizedBox(height: 200.0),
//                   CircleAvatar(
//                     radius: 70.0,
//                     backgroundImage: AssetImage('images/teacher.png'),
//                   ),
//                   SizedBox(
//                     height: 40.0,
//                   ),
//                   RaisedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => MyHomePage()),
//                       );
//                     },
//                     color: Colors.teal[600],
//                     //borderRadius: BorderRadius.circular(32.0),
//                     //highlightColor: Colors.teal[900],
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(32.0),
//                     ),
//                     splashColor: Colors.teal[900],
//                     padding: EdgeInsets.all(20.0),
//                     elevation: 20.0,
//                     highlightElevation: 0.0,
//                     child: Text(
//                       'FOR TEACHERS',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 2.5,
//                         fontFamily: 'Sans Source Pro',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   SizedBox(
//                     height: 200.0,
//                   ),
//                   CircleAvatar(
//                     radius: 70.0,
//                     backgroundImage: AssetImage('images/student.png'),
//                   ),
//                   SizedBox(
//                     height: 40.0,
//                   ),
//                   RaisedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => MyHomePage()),
//                       );
//                     },
//                     padding: EdgeInsets.all(20.0),
//                     color: Colors.teal[600],
//                     splashColor: Colors.teal[900],
//                     elevation: 20.0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(32.0),
//                     ),
//                     highlightElevation: 0.0,
//                     child: Text(
//                       'FOR STUDENTS',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 2.5,
//                         fontFamily: 'Sans Source Pro',
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
