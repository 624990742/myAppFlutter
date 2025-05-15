// lib/screens/detail_screen.dart

import 'package:flutter/material.dart';
import 'package:my_app/alearn_demo/router_demo/router.dart';
class DetailScreen extends StatelessWidget {
  final String arguments;

  const DetailScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail: $arguments')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => MyRouter.pop(context),
          child: const Text('Back'),
        ),
      ),
    );
  }
}