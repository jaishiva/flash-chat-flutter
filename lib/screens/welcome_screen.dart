import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/customWidgets.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

// AnimationController controller;
// Animation animation;
//   @override
//   void initState(){
//     super.initState();
//     controller = AnimationController(vsync: this,duration: Duration(seconds: 1));
//     animation = ColorTween(begin: Colors.yellow,end: Colors.blue).animate(controller);
//     controller.forward();
//     controller.addListener(() {
//       setState(() {
//       });
//     });
//     animation.addStatusListener((status) {
//       if(status == AnimationStatus.dismissed){
//         controller.forward();
//       }
//       else if(status == AnimationStatus.completed){
//         controller.reverse(from: 1.0);
//       }
//     });
//   }

  // @override
  // void dispose(){
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                    child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: [
                    "Flash Chat",
                  ],
                  textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                  ),
                  isRepeatingAnimation: true,
                  speed: Duration(milliseconds: 600),
                  totalRepeatCount: 5,
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            CustomButton(
              buttonColor: Colors.lightBlueAccent,
              text: 'Log In',
              onPressed: (){
                Navigator.pushNamed(context, '/login');
              },
            )
            ,
            CustomButton(
              buttonColor: Colors.blueAccent,
              text: 'Register',
              onPressed: (){
                Navigator.pushNamed(context, '/registration');
              },
            )
          ],
        ),
      ),
    );
  }
}
