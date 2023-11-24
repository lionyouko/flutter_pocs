import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'routes.dart' as routes;

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //C170: Each screen carries a static id string for named routes.
      // in the routes.routes the mapping is made
      initialRoute: WelcomeScreen.id,
      routes: routes.routes,
    );
  }
}
