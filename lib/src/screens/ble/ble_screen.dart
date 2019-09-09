import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BleScreen extends StatefulWidget {
  BleScreen({Key key}) : super(key: key);

  _BleScreenState createState() => _BleScreenState();
}

class _BleScreenState extends State<BleScreen> {
  FlutterBlue flutterBlue;
  Stream<BluetoothState> _currentState;

  @override
  void initState() {
    super.initState();
    flutterBlue = FlutterBlue.instance;
    _currentState = flutterBlue.state;
  }

  @override
  void dispose() {
    super.dispose();
    flutterBlue = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ble Screen"),
      ),
      body: Container(
        color: Colors.red[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            BleStatusLabel(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("Start Scan"),
                  onPressed: () async {
                    print("start");

                    var subs = flutterBlue.scan().listen((scanResult) {
                      print(
                          '${scanResult.device.name} found! rssi: ${scanResult.rssi}');
                    }, onDone: () {
                      print("done");
                    });

                    await Future.delayed(const Duration(seconds: 4));

                    subs.cancel();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BleStatusLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BluetoothState>(
      stream: FlutterBlue.instance.state,
      initialData: BluetoothState.unknown,
      builder: (context, snapshot) {
        final state = snapshot.data;
        String statusLabel = '';
        if (state == BluetoothState.on) {
          statusLabel = 'BleStatus is on';
        } else {
          statusLabel = 'BleStatus is off';
        }
        return Container(
          child: Text(statusLabel),
        );
      },
    );
  }
}
