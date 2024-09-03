import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sample/pages/common.dart';

class JsHandlerPage extends StatefulWidget {
  const JsHandlerPage({super.key, required this.title});
  final String title;

  @override
  State<JsHandlerPage> createState() => _JsHandlerPageState();
}

class _JsHandlerPageState extends State<JsHandlerPage> {
  late InAppWebViewController _webViewController;
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  ----------------------------------------------------------
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      //  ----------------------------------------------------------
      body: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Interaction Test App'),
        // ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () async {
                    var response = await _webViewController.evaluateJavascript(
                        source: 'fromAppToWeb("${DateTime.now()}")');

                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(content: Text('Result: $response')),
                    // );

                    setState(() {
                      _message = response.toString();
                    });
                  },
                  child: const Text('sendToWeb'),
                )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                // color: Colors.white,
                child: Text('receivedFromWeb: $_message'),
              ),
            ),
            Expanded(
              flex: 9,
              child: InAppWebView(
                initialSettings: InAppWebViewSettings(),
                initialUrlRequest: URLRequest(
                  url: WebUri.uri(Uri.parse(
                      'http://192.168.0.16:8080/js_handler.html?time=${DateTime.now().millisecondsSinceEpoch}')),
                  // url: WebUri.uri(Uri.parse(
                  //     'http://localhost:8080/js_handler.html?time=${DateTime.now().millisecondsSinceEpoch}')),
                ),
                onWebViewCreated: (controller) {
                  _webViewController = controller;
                  _addJavaScriptHandler();
                },
                onLoadStart: (controller, url) {
                  log("======================================================>> Started loading: $url");
                },
                onLoadStop: (controller, url) {
                  log("====================================================>==> Finished loading: $url");
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: getBottomNavigationBar(context),
      ),
    );
  }

  void _addJavaScriptHandler() {
    _webViewController.addJavaScriptHandler(
      handlerName: 'fromWebToApp',
      callback: (args) {
        // Handle the received data from JavaScript
        log('Received data from JavaScript: $args');

        setState(() {
          _message = args[0];
        });

        return ['[${DateTime.now()}]', 'success'];
      },
    );
  }
}
