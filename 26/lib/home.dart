import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/countController.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  ----------------------------------------------------------
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      //  ----------------------------------------------------------
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CountController>(
              init: CountController(),
              builder: (_) =>
                  Text("현재 카운트: ${Get.find<CountController>().counter}"),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => Get.find<CountController>().increase(),
                      child: const Text("증가"),
                    ),
                    TextButton(
                      onPressed: () => Get.find<CountController>().decrease(),
                      child: const Text("감소"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.find<CountController>().increase();
                        },
                        child: const Text("증가")),
                    ElevatedButton(
                        onPressed: () {
                          Get.find<CountController>().decrease();
                        },
                        child: const Text("감소")),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),

      //  ----------------------------------------------------------
    );
  }
}
