import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // _tabController.addListener(() => setState(() {
    //       _selectedIndex = _tabController.index;
    //     }));

    _tabController.addListener(
        () => setState(() => _selectedIndex = _tabController.index));

    // _tabController.addListener(() {
    //   setState(() {
    //     _selectedIndex = _tabController.index;
    //   });
    // });
  }

  @override
  void dispose() {
    _tabController.dispose();
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
      body: _selectedIndex == 0
          ? tabContainer(context, Colors.blue, 'Home')
          : _selectedIndex == 1
              ? tabContainer(context, Colors.green, 'Chat')
              : tabContainer(context, Colors.red, 'Settings'),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: _selectedIndex == 0
                  ? const Icon(Icons.home, color: Colors.blue)
                  : const Icon(Icons.home_outlined),
              text: 'Home',
            ),
            Tab(
              icon: _selectedIndex == 1
                  ? const Icon(Icons.chat, color: Colors.green)
                  : const Icon(Icons.chat_outlined),
              text: 'Chat',
            ),
            Tab(
              icon: _selectedIndex == 2
                  ? const Icon(Icons.settings, color: Colors.red)
                  : const Icon(Icons.settings_outlined),
              text: 'Settings',
            ),
          ],
        ),
      ),

      //  ----------------------------------------------------------
    );
  }

  Widget tabContainer(BuildContext context, Color tabColor, String tabText) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: tabColor,
      child: Center(
        child: Text(
          tabText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
