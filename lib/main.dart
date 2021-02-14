import 'package:flashlight/flashlight.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _hasFlashlight = false;

  @override
  initState() {
    super.initState();
    initFlashlight();
  }

  initFlashlight() async {
    bool hasFlash = await Flashlight.hasFlashlight;
    print("Device has flash ? $hasFlash");
    setState(() {
      _hasFlashlight = hasFlash;
    });
  }

  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flashlight'),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Visibility(
                visible: _isVisible,
                child: RaisedButton(
                  child: Text('Turn on'),
                  onPressed: () {
                    showToast();
                    Flashlight.lightOn();
                  },
                ),
                replacement: RaisedButton(
                  child: Text('Turn off'),
                  onPressed: () {
                    showToast();
                    Flashlight.lightOff();
                  },
                ))
          ],
        )),
      ),
    );
  }
}
