import 'package:flutter/material.dart';
import 'package:flutter_application_fbx_poc/webgl_loader_glb.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    InAppWebViewController? webView;
    return Scaffold(
      appBar: AppBar(title: const Text('Local server With Three.js Viewer')),
      body: Column(children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 30.0),
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                  url: Uri.parse(
                      "https://threejs.org/examples/#webgl_animation_keyframes")),
              onWebViewCreated: (InAppWebViewController controller) {
                webView = controller;
              },
            ),
          ),
        )
      ]),
    );
  }
}
