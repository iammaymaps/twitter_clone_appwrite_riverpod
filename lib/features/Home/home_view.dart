import 'package:flutter/material.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});
  static const routeName = '/home-screen';

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'Hello Flutter!',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w500, // Medium bold
              color: Colors.blue,
            ),
          ))
        ],
      ),
    );
  }
}
