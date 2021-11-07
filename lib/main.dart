import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:payflow/modules/splash/splash_page.dart';

import 'app_widget.dart';

void main() {
  runApp(const AppFirebase());
}

class AppFirebase extends StatefulWidget {
  const AppFirebase({Key? key}) : super(key: key);
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
        // Check for errors
        if (snapshot.hasError) {
          return const Material(
            

            child: Center(
                child: Text("Não foi possível inicializar o Firebase",
                    textDirection: TextDirection.ltr)),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return const AppWidget();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Material(
          
            child: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
