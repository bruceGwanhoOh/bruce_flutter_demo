import 'package:bruce_flutter_demo/src/blocs/bloc_provider.dart';
import 'package:bruce_flutter_demo/src/screens/calculator/calculator_bloc.dart';
import 'package:bruce_flutter_demo/src/screens/calculator/calculator_screen.dart';
import 'package:bruce_flutter_demo/src/screens/counter/counter_bloc.dart';
import 'package:bruce_flutter_demo/src/screens/counter/counter_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              child: Text('Open CounterScreen'),
              onPressed: () {
                _openCounterPage(context);
              }),
          RaisedButton(
              child: Text('Open CalculatorScreen'),
              onPressed: () {
                _openCalculatorPage(context);
              })
        ],
      )),
    );
  }
}

void _openCounterPage(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return BlocProvider<CounterBloc>(
      bloc: CounterBloc(),
      child: CounterScreen(),
    );
  }));
}

void _openCalculatorPage(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return BlocProvider<CalculatorBloc>(
      bloc: CalculatorBloc(),
      child: CalculatorScreen(),
    );
  }));
}
