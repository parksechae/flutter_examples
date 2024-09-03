import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sample/pages/common.dart';

class WebMessageChannelPage extends StatefulWidget {
  const WebMessageChannelPage({super.key, required this.title});
  final String title;

  @override
  State<WebMessageChannelPage> createState() => _WebMessageChannelPageState();
}

class _WebMessageChannelPageState extends State<WebMessageChannelPage> {
  late WebMessageChannel _channel;
  late WebMessagePort _port1;
  late WebMessagePort _port2;

  String _message = '';

  @override
  void initState() {
    print('>>>>>>>>>>>>>>>>>>>>>>>>> WebMessageChannelPage initState');
    super.initState();
  }

  @override
  void dispose() {
    print('>>>>>>>>>>>>>>>>>>>>>>>>> WebMessageChannelPage dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  ----------------------------------------------------------
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      //  ----------------------------------------------------------
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () async {
                  _port1.postMessage(
                      WebMessage(data: "[${DateTime.now()}] Hello!"));
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
                      'http://192.168.0.16:8080/wmc.html?time=${DateTime.now().millisecondsSinceEpoch}')),
                  // url: WebUri.uri(Uri.parse(
                  //     'http://localhost:8080/wmc.html?time=${DateTime.now().millisecondsSinceEpoch}')),
                ),
                onWebViewCreated: (controller) {},
                onLoadStart: (controller, url) {
                  log("======================================================>> Started loading: $url");
                },
                onLoadStop: (controller, url) async {
                  log("====================================================>==> Finished loading: $url");
                  if (defaultTargetPlatform != TargetPlatform.android ||
                      await WebViewFeature.isFeatureSupported(
                          WebViewFeature.CREATE_WEB_MESSAGE_CHANNEL)) {
                    // wait until the page is loaded, and then create the Web Message Channel
                    _channel = (await controller.createWebMessageChannel())!;
                    _port1 = _channel.port1;
                    _port2 = _channel.port2;

                    // set the web message callback for the port1
                    await _port1.setWebMessageCallback((message) async {
                      print(
                          "Message coming from the JavaScript side: $message");

                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(content: Text('Result: $message')),
                      // );
                      setState(() {
                        _message = message?.data;
                      });
                      // when it receives a message from the JavaScript side, respond back with another message.
                    });

                    // transfer port2 to the webpage to initialize the communication
                    await controller.postWebMessage(
                        message:
                            WebMessage(data: "capturePort", ports: [_port2]),
                        targetOrigin: WebUri("*"));

                    await Future.delayed(const Duration(seconds: 1));
                    if (mounted) {
                      _port1.postMessage(WebMessage(data: "Hello!"));
                    }
                    // _port1.postMessage(WebMessage(data: "Hello!"));
                    await Future.delayed(const Duration(seconds: 1));
                    if (mounted) {
                      _port1.postMessage(WebMessage(data: "world!"));
                    }
                    // _port1.postMessage(WebMessage(data: "World!"));
                  }
                }),
          ),
        ],
      ),
      bottomNavigationBar: getBottomNavigationBar(context),
    );
  }
}
