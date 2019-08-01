import 'package:bruce_flutter_demo/src/blocs/bloc_provider.dart';
import 'package:bruce_flutter_demo/src/screens/counter/counter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  CounterScreen({Key key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CounterBloc bloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
                initialData: 0,
                stream: bloc.outCounter,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  return Text('${snapshot.data}');
                }),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              bloc.incrementCounter.add(null);
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              bloc.incrementCounter.add(null);
            },
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
