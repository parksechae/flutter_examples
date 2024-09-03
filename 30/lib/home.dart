import 'package:flutter/material.dart';
import 'package:sample/user.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _key = GlobalKey<FormState>();
  late String _username, _email, _number;

  @override
  void initState() {
    super.initState();
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
          Container(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  usernameInput(),
                  const SizedBox(
                    height: 10,
                  ),
                  emailInput(),
                  const SizedBox(
                    height: 10,
                  ),
                  numberInput(),
                  const SizedBox(
                    height: 10,
                  ),
                  submitButton(),
                ],
              ),
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              disabledForegroundColor: Colors.grey.withOpacity(0.38),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/first');
            },
            child: const Text('First Page'),
          )
        ],
      ),
      //  ----------------------------------------------------------
    );
  }

  Widget usernameInput() {
    return TextFormField(
      initialValue: 'default',
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your username';
        } else {
          return null;
        }
      },
      onSaved: (value) => _username = value as String,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: 'Input your username',
        labelText: 'Username',
        labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),
    );
  }

  Widget emailInput() {
    return TextFormField(
        autofocus: true,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your email';
          } else {
            return null;
          }
        },
        onSaved: (value) => _email = value as String,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: 'Input your email',
          labelText: 'Email',
          labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ));
  }

  Widget numberInput() {
    return TextFormField(
        keyboardType: TextInputType.number,
        autofocus: true,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your number';
          } else {
            return null;
          }
        },
        onSaved: (value) => _number = value as String,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: 'Input your number',
          labelText: 'Number',
          labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ));
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_key.currentState!.validate()) {
          _key.currentState!.save();
          Navigator.pushNamed(context, '/success',
              arguments:
                  User(username: _username, email: _email, number: _number));
        }
      },
      child: Container(
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Submit',
            style: TextStyle(
              fontSize: 18,
            ),
          )),
    );
  }
}
