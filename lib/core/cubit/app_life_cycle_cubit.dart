import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_memory_game/core/cubit/timer_cubit.dart';
import 'package:flutter_bloc_memory_game/core/enums/time_state.dart';

class AppLifeCycleManager extends StatefulWidget {
  final Widget child;
  const AppLifeCycleManager({Key? key, required this.child}) : super(key: key);

  @override
  State<AppLifeCycleManager> createState() => _AppLifeCycleManagerState();
}

class _AppLifeCycleManagerState extends State<AppLifeCycleManager>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    final timerCubit = context.read<TimerCubit>();

    switch (state) {
      case AppLifecycleState.paused:
        debugPrint('LifeCycleState = $state');
        if (timerCubit.state != TimeState.timerFinish) {
          timerCubit.stopTimer(reset: false);
        }
        break;

      case AppLifecycleState.resumed:
        debugPrint('LifeCycleState = $state');
        // İstersen burada tekrar başlatabilirsin
        break;

      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      default:
        debugPrint('LifeCycleState = $state');
    }
  }
}
