import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_test/bottom.dart';
import 'package:getx_test/counter_controller.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final controller = Get.put(CounterController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This is the first page',
              style: TextStyle(fontSize: 24),
            ),
            GetBuilder<CounterController>(
                builder: (_) => Text(
                      '${controller.count}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    )),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () async {
              controller.increment();
            },
            child: const Icon(Icons.add),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () async {
              controller.decrement();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
