import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:payflow_john_nlw6/app_widget.dart';
import 'package:payflow_john_nlw6/modules/login/login_page.dart';
import 'package:payflow_john_nlw6/modules/splash/splash_page.dart';
import 'package:payflow_john_nlw6/shared/themes/app_colors.dart';

import 'modules/home/home_page.dart';
void main() {
  runApp(AppFirebase());
}

class AppFirebase extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
   @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Material(
        child: Center(
          child: Text(
            "Nao foi possivel inicializar o Firebase",
            textDirection: TextDirection.ltr,
          ),
        ),
          );
        }

        
       else if (snapshot.connectionState == ConnectionState.done) {
          return AppWidget();
        }else{
          return Material(
child: Center(
  child: CircularProgressIndicator(),
),
          );
        }

   
      },
    );
  }
}


