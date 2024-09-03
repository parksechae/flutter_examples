import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  int _counter = 0;
  double _height = 100.0;
  int _selectedButton =
      0; // Add this line to declare and initialize _selectedButton

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(
        () => setState(() => _selectedIndex = _tabController.index));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;

      // if (_height == 100.0) {
      //   _height = 150.0;
      // } else {
      //   _height = 100.0;
      // }
    });
  }

  void _setSelectedButton(int index) {
    setState(() {
      _selectedButton = index;
    });
  }

  void _changeHeight() {
    setState(() {
      if (_height == 100.0) {
        _height = 150.0;
      } else {
        _height = 100.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Item 1'),
              onTap: () {
                showMyDialog(context, 'Item 1', 'You tapped on Item 1');
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Item 2'),
              onTap: () {
                showMyDialog(context, 'Item 2', 'You tapped on Item 2');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Item 3'),
              onTap: () {
                showMyDialog(context, 'Item 3', 'You tapped on Item 3');
              },
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Counter: $_counter',
                style: Theme.of(context).textTheme.bodyLarge,
                selectionColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: _height,
                  color: Colors.blue,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: _height,
                  color: Colors.red,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: _height,
                  color: Colors.yellow,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: _height,
                  color: Colors.green,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: _height,
                  color: Colors.purple,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: _height,
                  color: Colors.orange,
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: _changeHeight,
            tooltip: 'Change Height',
            child: const Icon(Icons.change_circle),
          ),
        ],
      ), // T
      bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height / 9,
          child: TabBar(
              onTap: (index) {
                if (index == 0) {
                  _home();
                } else if (index == 1) {
                  _search();
                } else if (index == 2) {
                  _setting();
                }
              },
              controller: _tabController,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(
                      _selectedIndex == 0 ? Icons.home : Icons.home_outlined),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(_selectedIndex == 1
                      ? Icons.search
                      : Icons.search_outlined),
                  text: 'Search',
                ),
                Tab(
                  icon: Icon(_selectedIndex == 2
                      ? Icons.settings
                      : Icons.settings_outlined),
                  text: 'Setting',
                ),
              ])),

      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       IconButton(
      //         icon: const Icon(Icons.home),
      //         color: _selectedButton == 0 ? Colors.orange : null,
      //         onPressed: () {
      //           _setSelectedButton(0);
      //           _home();
      //         },
      //       ),
      //       IconButton(
      //           icon: const Icon(Icons.calendar_month),
      //           color: _selectedButton == 1 ? Colors.orange : null,
      //           onPressed: () {
      //             _setSelectedButton(1);
      //             _search();
      //           }),
      //       IconButton(
      //         icon: const Icon(Icons.settings),
      //         color: _selectedButton == 2 ? Colors.orange : null,
      //         onPressed: () {
      //           _setSelectedButton(2);
      //           _setting();
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      // // this trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _home() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Hello World'),
            content: const Text('This is a simple alert dialog'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          );
        });
  }

  void _search() {
    DateTime firstDate = DateTime.now();
    DateTime lastDate = DateTime.now().add(const Duration(days: 7));
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate,
      lastDate: lastDate,
    );
  }

  void _setting() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            color: Colors.amber,
            child: const Center(
              child: Text('Config setting...'),
            ),
          );
        });
  }

  void showMyDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
