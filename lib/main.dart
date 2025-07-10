import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_memory_game/core/navigation/navigation_route.dart';
import 'package:flutter_bloc_memory_game/core/navigation/navigation_service.dart';
import 'package:flutter_bloc_memory_game/features/home/view/home_view.dart';

Future<void> main() async {
  await _init();
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom],
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      home: const HomeView(),
    );
  }
}
