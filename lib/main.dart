import 'package:flutter/material.dart';
import 'package:teste_target_sistemas/taskApp/core/di/injector_di.dart';
import 'package:teste_target_sistemas/taskApp/views/splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectorDi.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: SplashPage()));
  }
}
