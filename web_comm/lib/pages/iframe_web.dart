import 'package:flutter/material.dart';
import 'package:sample/pages/common.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

class IframePage extends StatefulWidget {
  const IframePage({super.key, required this.title});
  final String title;

  @override
  State<IframePage> createState() => _IframePageState();
}

class _IframePageState extends State<IframePage> {
  late html.IFrameElement _iframeElement;
  late html.MessageChannel _channel;
  late html.MessagePort _port1;
  late html.MessagePort _port2;
  String _message = '';

  @override
  void initState() {
    super.initState();
    _registerIFrameViewFactory();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
    // print('dispose Iframe');
    // print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');

    // _port1.close();
    // _port2.close();
  }

  void _registerIFrameViewFactory() {
    _iframeElement = html.IFrameElement()
      ..src =
          'http://192.168.0.16:8080/iframe.html?time=${DateTime.now().millisecondsSinceEpoch}'
      ..style.width = '100%'
      ..style.height = '400px'
      ..style.border = '1px solid red'
      ..onLoad.listen((_) {
        print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
        print('onLoad Iframe');
        print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
        // Set up the message channel when the iframe has fully loaded
        _setupMessageChannel();
      });

    // PlatformViewRegistry를 사용하여 viewType 등록
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('iframeElement', (int viewId) {
      return _iframeElement;
    });
  }

  void _setupMessageChannel() {
    final contentWindow = _iframeElement.contentWindow;
    if (contentWindow != null) {
      print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
      print('setupMessageChannel');
      print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
      _channel = html.MessageChannel();
      _port1 = _channel.port1; // parent (dart)
      _port2 = _channel.port2; // child (iframe)

      // Send the channel's port2 to the iframe
      contentWindow.postMessage('capturePort', '*', [_port2]); // 최초 채널 연결을 위해서
      _port1
          .postMessage('[${DateTime.now()}] Hello from Flutter!'); // 최초 메시지 전송

      // Set up port1 to listen for messages from the iframe
      _port1.onMessage.listen((event) {
        setState(() {
          _message = event.data;
        });

        print('Message from iframe.... : ${event.data}');
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('you sent : ${event.data}')),
        // );
        _port1.postMessage(
            '[${DateTime.now()}] success : received iframe request');
      });
    } else {
      print('Content window is null');
    }
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
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              // width: double.infinity,
              height: 20,
              child: Row(
                children: [
                  Text('received from ifram : $_message'),
                  ElevatedButton(
                    onPressed: () {
                      _port1.postMessage('now is ${DateTime.now()}');
                    },
                    child: const Text('send to iframe'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: const Text('This is iframe'),
          ),
          const Expanded(
              flex: 9, child: HtmlElementView(viewType: 'iframeElement')),
        ],
      )),
      bottomNavigationBar: getBottomNavigationBar(context),
    );
  }
}
