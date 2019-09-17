import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_blue/gen/flutterblue.pb.dart' as prefix0;

import 'bloc_provider.dart';

class BleBloc implements BlocBase{
  FlutterBlue _instance;
  BluetoothService _service;
  BluetoothDevice _device;



  Stream<BluetoothState> get adapterState => _instance?.state;

  
  BleBloc(){
    _instance = FlutterBlue.instance;


  }

  

  @override
  void dispose() {
    _instance = null;

  }

}