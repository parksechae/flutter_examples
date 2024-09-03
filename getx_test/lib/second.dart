import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_test/bottom.dart';
import 'package:getx_test/counter_controller.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    print('sencond page build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This is the second page',
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
      ), // This
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
