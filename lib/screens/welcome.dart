import 'package:blixtstudios/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:rive/rive.dart';
import 'package:getwidget/getwidget.dart';

// class Welcome extends StatelessWidget{
//   const Welcome({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       child: Text('Hello World its me Mario'),
//     );
//   }
//
// }

class Welcome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WelcomeState();
  }
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {

    bool _visible = true;


    return Scaffold(
      body: SlidingUpPanel(
//         body: Container(
//           child: Center(
//             child: AnimatedTextKit(
//               animatedTexts: [
//                 TypewriterAnimatedText(
//                   'Build your project',
//                   textStyle: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 32.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   speed: const Duration(milliseconds: 100),
//                 ),
//                 TypewriterAnimatedText(
//                   'Build your dreams',
//                   textStyle: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 32.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   speed: const Duration(milliseconds: 100),
//                 ),
//                 TypewriterAnimatedText(
//                   'Build with Blixt',
//                   textStyle: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 32.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   speed: const Duration(milliseconds: 200),
//                 ),
//
//               ],
//
//               totalRepeatCount: 1,
//
//
//             ),
//           ),
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("assets/imgs/introBack.png"),
//                 fit: BoxFit.cover,
//               )
//           ),
// // color: Colors.orange,
//         ),
        body: Stack(
          children: [

            // RiveAnimation.asset('assets/imgs/3d_raster_test.riv',
            //   fit: BoxFit.cover,
            // ),


            RiveAnimation.network(
              'https://cdn.rive.app/animations/vehicles.riv',
              fit: BoxFit.cover,
            ),


            Center(child: Padding(
              padding: EdgeInsets.only(bottom: 200),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Dive right in ',
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      // shadows: <Shadow> [
                      //   Shadow(
                      //     offset: Offset(3.0, 1.0),
                      //     blurRadius: 5.0,
                      //     color: Color.fromARGB(127, 0, 0, 0),
                      //   ),
                      // ],
                    ),
                    speed: const Duration(milliseconds: 75),
                  ),
                  TypewriterAnimatedText(
                    'Build your dreams',
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                  TypewriterAnimatedText(
                    'Build with Blixt',
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),

                ],

                totalRepeatCount: 1,


              ),
            ),)
          ],
        ),
        maxHeight: 700.0,
        minHeight: 50.0,

        panel:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Pull up tab
            AnimatedOpacity(opacity: _visible ? 1.0 : 0.0, duration: Duration(milliseconds: 500),
              child: Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Center(child: Container(
                    color: Colors.white.withAlpha(200),
                    width: 150.0,
                    height: 5.0,

                  )
                  )
              ),),


            //Panel code
            Container(
                height: 675,
                //panel Background
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(235),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
                ),

                //Main Layout Column
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

                          Text("Login",style: TextStyle(color: Colors.white,
                              fontSize: 30),),

                          SizedBox(height: 5,),


                          Text("Sign into your account",style: TextStyle(color: Colors.white,
                              fontSize: 15),),


                          SizedBox(height: 40,),

                          //Email field Section
                          Text("YOUR EMAIL", style: TextStyle(color: Colors.white), textAlign: TextAlign.left,),
                          SizedBox(height: 10,),
                          TextField(style: TextStyle(
                            color: Colors.white,

                          ),
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
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 30, 26, 26),
                                hintText: " "
                            ),
                          ),
                          SizedBox(),
                          TextButton(onPressed: () {  },
                            child: Text("Forgot Password?", style: TextStyle(color: Colors.white), textAlign: TextAlign.left,),),

                        ],
                      ),
                    ),

                    //Login Button
                    Column(children: [
                      TextButton(onPressed: () {  },
                        child: Text("I don't have an account", style: TextStyle(color: Color.fromRGBO(255, 255, 255, .5)), textAlign: TextAlign.left,),),

                      GFButton(onPressed: (){
                        //TODO: Create Auth Process Here
                        print('user singed in');
                        AuthService().anonLogin();
                        Navigator.pushNamed(context, "/home");
                      },
                        text: "Login",
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
                )
            ),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(70),
            blurRadius: 40,

          ),
        ],
        color: Colors.green.withAlpha(0),

        onPanelClosed: () {
          setState(() {
            _visible = false;
          });
        },

      ),


    );
  }
}