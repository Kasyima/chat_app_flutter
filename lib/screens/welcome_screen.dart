import 'package:chat_app_flutter/components/rounded_button.dart';
import 'package:chat_app_flutter/constants.dart';
import 'package:chat_app_flutter/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      //upperBound: 1,
    );
    controller.forward();
    // controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {}
    // });
    //controller.reverse(from: 1.0);
    controller.addListener(() {
      setState(() {});
    });
    // animation =
    //     CurvedAnimation(parent: controller, curve: Curves.easeInOutQuint);

    animation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white,
    ).animate(controller);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 60, //animation.value * 100,
                    ),
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                      fontSize: 45.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Agne'),
                ),
                // AnimatedTextKit(
                //   animatedTexts: [
                //     TypewriterAnimatedText(
                //       'Flash Chat',
                //       textStyle: TextStyle(
                //           fontSize: 45.0,
                //           color: Colors.black54,
                //           fontWeight: FontWeight.w900,
                //           fontFamily: 'Agne'),
                //       speed: const Duration(milliseconds: 1000),
                //     ),
                //   ],
                // ),
              ],
            ),
            SizedBox(
              height: 28.0,
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              onPress: () {
                setState(() {
                  Navigator.pushNamed(
                    context,
                    kRoutes.loginRoute,
                  );
                });
              },
              text: "Log In",
            ),
            RoundedButton(
              color: Colors.blueAccent,
              onPress: () {
                setState(() {
                  Navigator.pushNamed(
                    context,
                    kRoutes.registrationRoute,
                  );
                });
              },
              text: "Register",
            ),
          ],
        ),
      ),
    );
  }
}
