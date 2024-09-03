import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Naver Map WebView'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.notifications),
          //   onPressed: () => log('alarm button clicked'),
          // ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              log('viewList button clicked');
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      drawer: Drawer(
        // elevation: 100.0,
        width: MediaQuery.of(context).size.width * 1,
        child: SafeArea(
            child: Container(
                // width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Column(
                  children: [
                    const Expanded(
                        flex: 8, child: Center(child: Text('Drawer'))),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            log('click drawer button');
                            Navigator.pop(context);
                          },
                          child: const Text('close'),
                        ),
                      ),
                    ),
                  ],
                ))),
        // 드로어 내용 추가
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          // url: WebUri.uri(Uri.parse('http://localhost:8081')),
          url: WebUri.uri(Uri.parse('https://parksechae.github.io/naver_map/')),
        ),
        onWebViewCreated: (controller) {},
        onLoadStop: (controller, url) async {},
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          log('bottomNavigationBar index: $index');

          if (index == 0) {
            log('search button clicked');
          } else if (index == 1) {
            log('home button clicked');
          } else if (index == 2) {
            log('my button clicked');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.saved_search),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            activeIcon: Icon(Icons.person),
            label: 'my',
          ),
        ],
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        // unselectedItemColor: Colors.black54,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        // enableFeedback: false,
        // iconSize: 30.0,
      ),
    );
  }
}
