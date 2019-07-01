import 'package:flutter/material.dart';
import 'package:gulidai_flutter/login/login.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '谷粒贷',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}