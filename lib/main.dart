import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:blixtstudios/screens/Welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:blixtstudios/homeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}


class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text('error unable to init firebase', textDirection: TextDirection.ltr);
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return HomeScreen();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Text('loading', textDirection: TextDirection.ltr);
      },
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return  MaterialApp(
            title: "Blixt Studios",
            debugShowCheckedModeBanner: false,
            initialRoute: "/intro",
            routes: <String, WidgetBuilder>{
              "/intro": (BuildContext context) => Welcome(),
            },
          );
          ;
        }
    );
  }
}