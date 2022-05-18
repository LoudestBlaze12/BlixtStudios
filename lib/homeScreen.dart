import 'package:blixtstudios/main.dart';
import 'package:flutter/material.dart';
import 'package:blixtstudios/services/auth.dart';
import 'package:blixtstudios/screens/welcome.dart';
import 'package:blixtstudios/screens/services.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          //the user connection has not hit
          return MyApp();
        } else if (snapshot.hasError) {
          //Error grabbing the user sign in data
          return const Center(
            child: MyApp()
          );
        } else if (snapshot.hasData) {
          //User is already signed in, take them to the motherland
          return ServicePage();
        } else {
          //the results are in... you are not the father, time to sign up
          return  MyApp();
        }
      },
    );
  }
}