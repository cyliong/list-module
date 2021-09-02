import 'package:flutter/material.dart';
import 'package:list_module/page/about_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AboutPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
