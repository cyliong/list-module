import 'dart:io' show Platform;
import 'dart:ui' as ui;

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

  static const fontSize = 50.0;

  @override
  Widget build(BuildContext context) {
    final centerX = MediaQuery.of(context).size.width / 2;
    return Stack(
      children: [
        Text(
          appName,
          style: TextStyle(
            fontSize: fontSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3,
          ),
        ),
        Text(
          appName,
          style: TextStyle(
            fontSize: fontSize,
            foreground: Paint()
              ..shader = ui.Gradient.linear(
                Offset(centerX - 30, 0),
                Offset(centerX + 30, 0),
                const [
                  Colors.green,
                  Colors.lime,
                ],
              ),
          ),
        ),
      ],
    );
  }
}
