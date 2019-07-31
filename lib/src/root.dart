

import 'package:bruce_flutter_demo/src/blocs/bloc_provider.dart';
import 'package:bruce_flutter_demo/src/screens/home/home_bloc.dart';
import 'package:bruce_flutter_demo/src/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<IncrementBloc>(
        bloc: IncrementBloc(),
        child: MyHomePage(title: "Flutter Demo Home Page")
      )
    );
  }
}
