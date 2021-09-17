import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:list_module/page/about_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List',
      theme: ThemeData(
        primarySwatch: Platform.isIOS ? Colors.grey : Colors.teal,
      ),
      home: AboutPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
