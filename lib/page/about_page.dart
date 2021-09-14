import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  PackageInfo? _packageInfo;

  @override
  void initState() {
    super.initState();
    _loadPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Platform.isIOS
          ? null
          : AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => SystemNavigator.pop(animated: true),
              ),
              title: const Text('About'),
            ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _packageInfo?.appName ?? '',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Version ${_packageInfo?.version ?? ''}',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _loadPackageInfo() async {
    _packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = _packageInfo;
    });
  }
}
