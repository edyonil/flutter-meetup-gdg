import 'package:flutter_meetup/bloc/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class IncrementBloc extends BlocBase {

  BehaviorSubject<int> behaviorSubject = BehaviorSubject<int>();

  Observable<int> get incrementValueStream => behaviorSubject.stream;

  int _counter = 0;

  incrementeValue() {
    this._counter++;
    this.behaviorSubject.sink.add(this._counter);
  }

  dispose() {
    this.behaviorSubject.close();
  }
}