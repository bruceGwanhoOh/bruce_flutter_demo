
import 'dart:async';

import 'package:bruce_flutter_demo/src/blocs/bloc_provider.dart';

class CounterBloc implements BlocBase{
  int _counter;

  StreamController<int> _counterController = StreamController<int>();
  StreamSink<int> get _inAdd => _counterController.sink;
  Stream<int> get outCounter => _counterController.stream;

  StreamController _actionController = StreamController();
  StreamSink get incrementCounter => _actionController.sink;

  CounterBloc(){
    _counter = 0;
    _actionController.stream.listen(_handleLogic);
  }

  void _handleLogic(data){
    _counter = _counter + 1;
    _inAdd.add(_counter);
  }


  @override
  void dispose() {
    _actionController.close();
    _counterController.close();
  }
}