import 'package:bruce_flutter_demo/src/blocs/bloc_provider.dart';
import 'package:bruce_flutter_demo/src/screens/bottom_tab_screen/bottom_tab_screen.dart';
import 'package:bruce_flutter_demo/src/screens/calculator/calculator_screen.dart';
import 'package:bruce_flutter_demo/src/screens/catalog/catalog_screen.dart';
import 'package:bruce_flutter_demo/src/screens/counter/counter_bloc.dart';
import 'package:bruce_flutter_demo/src/screens/counter/counter_screen.dart';
import 'package:bruce_flutter_demo/src/screens/map/map_screen.dart';
import 'package:bruce_flutter_demo/src/screens/run/runmain_screen.dart';
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
              }),
          RaisedButton(
              child: Text('Open CatalogScreen'),
              onPressed: () {
                _openCatalogPage(context);
              }),
          RaisedButton(
              child: Text('Open MapScreen'),
              onPressed: () {
                _openMapPage(context);
              }),
              RaisedButton(
              child: Text('Open RunMainScreen'),
              onPressed: () {
                _openRunMainPage(context);
                              }),
                              RaisedButton(
              child: Text('Open Bottom Tab Screen'),
              onPressed: () {
                _openBottomTabScreen(context);
                                              }),
                                          
                                        ],
                                      )),
                                    );
                                  }
}

void _openBottomTabScreen(BuildContext context) {

Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return BottomTabScreen();
  }));
}

void _openRunMainPage(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return RunMainScreen();
  }));
}



void _openMapPage(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return MapScreen();
  }));
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
