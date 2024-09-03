import 'package:flutter/material.dart';
import 'package:sample/user.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    final User args = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Success Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('성공적으로 제출되었습니다.'),
            Text('Username: ${args.username}'),
            Text('Email: ${args.email}'),
            Text('Number: ${args.number}'),
          ],
        ),
      ),
    );
  }
}
