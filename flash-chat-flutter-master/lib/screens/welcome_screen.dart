import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

//C174: making custom animation
// P2: with keyword is extending our class to act as single ticker provider needed as vsync
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  //P1: create animation controller
  AnimationController? controller;
  Animation? animation;

  //P8a: tween animations. In this case color tween.
  Animation? colorAnimationTween;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      //P3: vsync receives ticker, in this case the own class
      vsync: this,
      duration: Duration(seconds: 1),
      //P6b1: adding a upper bound with different value is possible. Instead of 1, this is 100

      //P6d1: to use animation curves different than standard, must be 1.0 the upperbound.
      upperBound: 1.0,
    );

    //P6d2: to use animation curves different than standard, must be 1.0 the upperbound.
    //parent must be not null, so, by this point, we can enforce with !
    animation = CurvedAnimation(parent: controller!.view, curve: Curves.easeIn);
    colorAnimationTween = ColorTween(begin: Colors.black, end: Colors.white)
        .animate(controller!.view);

    //P5: add a listener just to see things changing as said in P4
    controller?.addListener(() {
      setState(() {});
      print(controller?.value);
    });
    //P4: making animation going forward by 0.01 to 0.01 from 0 to 1
    controller?.forward();

    //P7a: if we want to check the status of the animation, it has many, and change something,
    // as, for example, animation going forward and backward, we can as below.
    animation?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller?.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller?.forward();
      }
    });
  }

  @override
  void dispose() {
    //P7b: we dont want the animation to run even if the screen is not there, because it will.
    // so we dispose the controller and all stop it from staying in memory
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //P8b1: tween animations. We use the animation value, if we define an animation and put controller as a parent.
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                //C173: hero animations
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    //P6c: With value 100, this looks like it is growing from 0 to 100
                    //P6d3: since we going 0 to 1, we need to multiply by 100. Also, we can force with !
                    //P8b2: tween animations. We use the animation value, if we define an animation and put controller as a parent.
                    height: animation!.value * 100,
                  ),
                ),
                //C176: this is an example of pakaged for animations in flutter: animated_text_kit
                AnimatedTextKit(
                  //P6b2: With value 100, this looks like it is loading from 0 to 100
                  //P6d4: since we going 0 to 1, we need to multiply by 100. Also, we can force with !
                  //P8b3: tween animations. We use the animation value, if we define an animation and put controller as a parent.
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RegistrationScreen.id,
                    );
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
