import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getwidget/getwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {

   String myPassword = "" ;
   String myEmail = '' ;

   signUpWithEmail () async {
     try {
       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
           email: myEmail,
           password: myPassword
       );
     } on FirebaseAuthException catch (e) {
       if (e.code == 'weak-password') {
         print('The password provided is too weak.');
       } else if (e.code == 'email-already-in-use') {
         print('The account already exists for that email.');
       }
     } catch (e) {
       print(e);
     }
   }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            //Login In Forum
            Padding(padding: EdgeInsets.symmetric(horizontal: 25,
            ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  SizedBox(height: 50,),
                  GestureDetector(
                    child: Icon( FontAwesomeIcons.arrowLeftLong,
                    color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      },
                  ),
                  SizedBox(height: 10,),
                  Text("Sign Up",style: TextStyle(color: Colors.white,
                      fontSize: 30),),

                  SizedBox(height: 5,),


                  Text("Go ahead, don't be shy about it ;)",style: TextStyle(color: Colors.white,
                      fontSize: 15),),


                  SizedBox(height: 40,),

                  //Email field Section
                  Text("YOUR EMAIL", style: TextStyle(color: Colors.white), textAlign: TextAlign.left,),
                  SizedBox(height: 10,),
                  TextField(style: TextStyle(
                    color: Colors.white,

                  ),
                    onChanged: (text) {
                      myEmail = text;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 30, 26, 26),
                        hintText: " "
                    ),
                  ),


                  SizedBox(height: 50,),

                  //Password field Section
                  Text("YOUR PASSWORD",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.left,),
                  SizedBox(height: 10,),
                  TextField(
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.white,


                    ),
                    onChanged: (text){
                      myPassword = text;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 30, 26, 26),
                        hintText: " "
                    ),
                  ),
                  SizedBox(),


                ],
              ),
            ),

            //Login Button
            Column(children: [

              GFButton(onPressed: (){
                //TODO: Create Auth Process Here
                print('user singed in');
                // AuthService().anonLogin();
                signUpWithEmail();
                Navigator.pushNamed(context, "/home");
              },
                text: "Get Started",
                textStyle: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2
                ),
                size: 65,
                fullWidthButton: true,
                color: Color.fromRGBO(255, 124, 23, 1),
                // padding: EdgeInsets.symmetric(vertical: 10),
              ),
            ],)

          ],
        ),
      ),
    );
  }
}
