import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shake Reader',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userAccelerometerEventsVar;
  var gyroscopeEventsVar;
  var _counter = 0;
  var subscription;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    print(_counter);
  }

  void userAccelerometerEventsVoid() {
    // создан ли subscription, если создан то его нужно перезапустить, если он null, то его нужно создать
    subscription =
        userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        userAccelerometerEventsVar = event;
      });
    });
    print("userAccelerometerEventsVoid");
  }

  void userAccelerometerEventsVoidStop() {
    subscription?.cancel();
  }

  void gyroscopeEventsVoid() {
    gyroscopeEvents.listen((GyroscopeEvent event) {
      print(event);
    });
  }

  void showConsoleUsingPrint() {
    print('Console Message Using Print');
  }

  void showConsoleUsingDebugPrint() {
    print('Console Message Using Debug Print');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '1Text to stabilize',
            ),
            RaisedButton(
              onPressed: () => userAccelerometerEventsVoid(),
              child: Text(' userAccelerometerEvents start'),
            ),
            RaisedButton(
              onPressed: () => userAccelerometerEventsVoidStop(),
              child: Text(' userAccelerometerEvents stop'),
            ),
            Text(
              '$userAccelerometerEventsVar',
            ),
            RaisedButton(
              onPressed: () => gyroscopeEventsVoid(),
              child: Text(' gyroscopeEvents'),
            ),
            Text(
              '3Text to stabilize',
            ),
            RaisedButton(
              onPressed: () => showConsoleUsingPrint(),
              child: Text(' Print Console Message using Print '),
            ),
            RaisedButton(
              onPressed: () => showConsoleUsingDebugPrint(),
              child: Text(' Print Console Message using Debug Print '),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '$_counter',
        child: Text(
          '$_counter',
        ),
      ),
    );
  }
}
