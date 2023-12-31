import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  WelcomeScreen.id: (context) => WelcomeScreen(),
  ChatScreen.id: (context) => ChatScreen(),
  RegistrationScreen.id: (context) => RegistrationScreen(),
  LoginScreen.id: (context) => LoginScreen(),
};
