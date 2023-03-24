import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myproject/feature/login/view/login_view.dart';
import 'package:myproject/feature/onboard/onboard_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
      theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle.dark),
          scaffoldBackgroundColor: Colors.grey[200],
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Color.fromRGBO(11, 23, 84, 1))),
    );
  }
}
