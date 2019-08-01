
import 'package:bruce_flutter_demo/src/blocs/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class CalculatorBloc extends BlocBase{


  int initialCount = 0; //if the data is not passed by paramether it initializes with 0
  BehaviorSubject<int> _subjectCounter;

  CalculatorBloc({this.initialCount}){
   _subjectCounter = new BehaviorSubject<int>.seeded(initialCount); //initializes the subject with element already
  }

  Observable<int> get counterObservable => _subjectCounter.stream; 

  void increment(){
    initialCount++;
    _subjectCounter.sink.add(initialCount);
  }

  void decrement(){
    initialCount--;
    _subjectCounter.sink.add(initialCount);
  }

  void dispose(){
    _subjectCounter.close();
  }

}