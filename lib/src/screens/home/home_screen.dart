import 'package:bruce_flutter_demo/src/blocs/bloc_provider.dart';
import 'package:bruce_flutter_demo/src/models/cart_model.dart';
import 'package:bruce_flutter_demo/src/models/catalog_model.dart';
import 'package:bruce_flutter_demo/src/screens/calculator/calculator_screen.dart';
import 'package:bruce_flutter_demo/src/screens/catalog/catalog_screen.dart';
import 'package:bruce_flutter_demo/src/screens/counter/counter_bloc.dart';
import 'package:bruce_flutter_demo/src/screens/counter/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              }),
          RaisedButton(
              child: Text('Open CatalogScreen'),
              onPressed: () {
                _openCatalogPage(context);
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
   return CalculatorScreen();
  }));
}

void _openCatalogPage(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return CatalogScreen();
  }));
}

