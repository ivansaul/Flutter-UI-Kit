import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:device_preview_screenshot/device_preview_screenshot.dart';

import 'presentation/screens/screens.dart';

void main() {
  const String directory = '/home/saul/Pictures/';

  if (Platform.isAndroid || Platform.isIOS) {
    runApp(const MyApp());
  }

  // with extra config for device preview
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      tools: [
        ...DevicePreview.defaultTools,
        DevicePreviewScreenshot(
          onScreenshot: screenshotAsFiles(Directory(directory)),
        ),
      ],
      builder: (context) => const MyAppPreview(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class MyAppPreview extends StatelessWidget {
  const MyAppPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse},
      ),
    );
  }
}
