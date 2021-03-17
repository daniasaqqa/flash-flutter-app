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
        
    
        body:
             Column(
              crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Visibility(
                visible: _isVisible,
                child: FlatButton(
                  child: Image.asset("assets/images/flash_off.png",width: double.infinity,height:  500,fit: BoxFit.contain,),

                  onPressed: () {
                    showToast();
                    Flashlight.lightOn();
                  },
                ),
                replacement: FlatButton(
                  child: Image.asset("assets/images/flash_on.png",width: double.infinity,height: 800,fit: BoxFit.cover,),
                  onPressed: () {
                    showToast();
                    Flashlight.lightOff();
                  },
                ))
          ],
        ),
      ),
    );
  }
}
