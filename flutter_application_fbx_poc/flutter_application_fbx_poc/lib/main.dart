import 'package:flutter/material.dart';
import 'package:flutter_application_fbx_poc/home.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

InAppLocalhostServer localhostServer = InAppLocalhostServer();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await localhostServer.start();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  InAppWebViewController? webView;
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
