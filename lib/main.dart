import 'package:flutter/material.dart';
import 'package:tugas_akhir/pages/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tes IQ',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.indigo,
        fontFamily: "Montserrat",
        buttonColor: Colors.indigo,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.indigo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: SplashScreen(),
    );
  }
}
