import 'dart:async';

class CustomDebouncer {
  final int milliseconds;
  Timer? _timer;

  CustomDebouncer({required this.milliseconds});

  void call(Function action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), () {
      action();
    });
  }
}