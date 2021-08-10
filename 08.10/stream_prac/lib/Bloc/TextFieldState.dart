
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class TextFieldState {
  int price = 0;
  final _countSubject = BehaviorSubject.seeded(0); //초기값: 0

  void () {
    price ++;
    _countSubject.add(price);
  }

  Stream<int> get count => _countSubject.stream;
}
