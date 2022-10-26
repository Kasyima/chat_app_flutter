import 'package:chat_app_flutter/constants.dart';
import 'package:chat_app_flutter/screens/chat_screen.dart';
import 'package:chat_app_flutter/screens/login_screen.dart';
import 'package:chat_app_flutter/screens/registration_screen.dart';
import 'package:chat_app_flutter/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static var routes = {
    kRoutes.chatRoute: (BuildContext context) => ChatScreen(),
    kRoutes.loginRoute: (BuildContext context) => LoginScreen(),
    kRoutes.registrationRoute: (BuildContext context) => RegistrationScreen(),
    kRoutes.welcomeRoute: (BuildContext context) => WelcomeScreen(),
  };
}
