import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BleScreen extends StatefulWidget {
  BleScreen({Key key}) : super(key: key);

  _BleScreenState createState() => _BleScreenState();
}

class _BleScreenState extends State<BleScreen> {
  FlutterBlue flutterBlue;
  BluetoothDevice device;
  Stream<BluetoothState> _currentState;
  final _textControllerInput = TextEditingController();
  bool _canShowButton = false;
  BluetoothDeviceState state;
  StreamSubscription<BluetoothDeviceState> _currentDeviceState;

  @override
  void initState() {
    super.initState();

    flutterBlue = FlutterBlue.instance;
    _currentState = flutterBlue.state;
    _textControllerInput.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();

    _currentDeviceState.cancel();
    device?.disconnect();
    flutterBlue = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ble Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BleStatusLabel(),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 150,
                  height: 20,
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: "no device",
                        hintStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontFamily: 'RobotoMono',
                        )),
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'RobotoMono',
                        color: Colors.green),
                    textAlign: TextAlign.center,
                    controller: _textControllerInput,
                    onTap: () {
                      print("Tapped ");
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("Start Scan"),
                  onPressed: () async {
                    print("start");

                    var subs = flutterBlue.scan().listen((scanResult) {
                      if (scanResult.device.name.contains("BIOMECH") ||
                          scanResult.device.name.contains("JVC")) {
                        setState(() {
                          device = scanResult.device;
                          _textControllerInput.text = device.name;
                          device.state.listen(_handleState);
                        });
                      }
                    });
                    flutterBlue.stopScan();
                    await Future.delayed(const Duration(seconds: 4));
                    subs.cancel();
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                RaisedButton(
                  child: Text("connect"),
                  onPressed: () => _connect(),
                ),
                SizedBox(
                  width: 10,
                ),
                _canShowButton
                    ? RaisedButton(
                        child: Text("disconnect"),
                        onPressed: () => _disconnect(),
                      )
                    : SizedBox()
              ],
            ),
            _deviceState()
          ],
        ),
      ),
    );
  }

  _connect() async {
    await device.connect(timeout: Duration(seconds: 5), autoConnect: true);

    setState(() {
      _canShowButton = true;
    });
    /*
                              if(currentState == BluetoothDeviceState.connected){
                                setState(() {
                                _canShowButton = true;
                                });
                              }*/

    //device.discoverServices();
  }

  Widget _deviceState() {
    return StreamBuilder<BluetoothDeviceState>(
      stream: device?.state,
      initialData: BluetoothDeviceState.connecting,
      builder: (c, snapshot) {
        String text;
        switch (snapshot.data) {
          case BluetoothDeviceState.connected:
            text = 'Connect';
            break;
          case BluetoothDeviceState.disconnected:
            text = 'Disconnect';
            break;
          default:
            text = "Unknown";
            break;
        }
        return Text("Device Connection : " + text);
      },
    );
  }

  _disconnect() {
    device?.disconnect();
  }

  void _handleState(BluetoothDeviceState event) {
    //do something
    print("state" + event.toString());
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
