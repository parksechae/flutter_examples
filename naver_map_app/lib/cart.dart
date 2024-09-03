import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.amber,
            child: const Center(child: Text('contents...')),
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: const Center(child: Text('contents...')),
          ),
        ],
      ),
    );
  }
}
