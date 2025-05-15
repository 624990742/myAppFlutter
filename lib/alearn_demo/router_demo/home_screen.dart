// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:my_app/alearn_demo/router_demo/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            MyRouter.pushNamed(context, '/detail', arguments: 'Detail Page');
          },
          child: const Text('Go to Detail'),
        ),
      ),
    );
  }
}