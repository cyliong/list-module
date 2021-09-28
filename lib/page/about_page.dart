import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Platform.isIOS
          ? null
          : AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => SystemNavigator.pop(animated: true),
              ),
              title: const Text('About'),
            ),
      body: Center(
        child: FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final packageInfo = snapshot.data!;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AppLogo(appName: packageInfo.appName),
                    Text(
                      'Version ${packageInfo.version}',
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return PlatformCircularProgressIndicator();
            }),
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
    required this.appName,
  }) : super(key: key);

  final String appName;

  @override
  Widget build(BuildContext context) {
    return Text(
      appName,
      style: const TextStyle(
        fontSize: 50.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
