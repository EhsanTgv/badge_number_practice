import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Badge Number"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Set badge no"),
          onPressed: () {
            setBadgeNum(5, context);
          },
        ),
      ),
    );
  }

  void setBadgeNum(int count, BuildContext context) async {
    try {
      await FlutterDynamicIcon.setApplicationIconBadgeNumber(count);
    } on PlatformException {
      log("Exception: Platform not supported");
    } catch (e) {
      log(e.toString());
    }

    int badgeNumber = await FlutterDynamicIcon.getApplicationIconBadgeNumber();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Badge number set as $badgeNumber'),
      ),
    );
  }
}
