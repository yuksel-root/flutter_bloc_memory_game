import 'dart:async';
import 'package:flutter_bloc_memory_game/core/enums/time_state.dart';
import 'package:bloc/bloc.dart';

class TimerCubit extends Cubit<TimeState> {
  Timer? _timer;
  double _time = 0;
  bool _isPaused = false;

  double get currentTime => _time;
  bool get isPaused => _isPaused;

  TimerCubit() : super(TimeState.timerEmpty);

  void startTimer(double startTime, double decrementPerTick) {
    _time = startTime;
    _isPaused = false;
    emit(TimeState.timerActive);

    _timer = Timer.periodic(Duration(milliseconds: 1200), (_) {
      if (_time <= 0) {
        stopTimer(reset: true);
        emit(TimeState.timerFinish);
      } else {
        _time -= decrementPerTick;
        emit(TimeState.timerActive);
      }
    });
  }

  void stopTimer({bool reset = true}) {
    _timer?.cancel();
    if (reset) {
      print("timer reset");
      emit(TimeState.timerReset);
    } else {
      print("timer paused else");
      _isPaused = true;
      emit(TimeState.timerPaused);
    }
  }

  void resetTimer(double newTime) {
    _time = newTime;
    emit(TimeState.timerReset);
  }

  void errorTimer() {
    _timer?.cancel();
    emit(TimeState.timerError);
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
