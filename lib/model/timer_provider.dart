import 'dart:async';
import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  int _seconds = 0;
  bool _isRunning = false;
  Timer? _timer;

  int get seconds => _seconds;
  bool get isRunning => _isRunning;

  void start() {
    if (!_isRunning) {
      _isRunning = true;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        _seconds++;
        notifyListeners();
      });
    }
  }

  void pause() {
    if (_isRunning) {
      _isRunning = false;
      _timer?.cancel();
      notifyListeners();
    }
  }

  void reset() {
    _isRunning = false;
    _timer?.cancel();
    _seconds = 0;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
