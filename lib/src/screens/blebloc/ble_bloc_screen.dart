import 'package:bruce_flutter_demo/src/blocs/ble_bloc.dart';
import 'package:bruce_flutter_demo/src/blocs/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BleBlocScreen extends StatelessWidget {
  const BleBlocScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BleBloc bloc = BlocProvider.of(context);

    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('BleBloC'),
      ),
      body: Container(
        color: Colors.tealAccent[100],
        child: Column(
          children: <Widget>[
            StreamBuilder<BluetoothState>(
              stream: bloc.adapterState,
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
            )
          ],
        ),
      ),
    ));
  }
}
