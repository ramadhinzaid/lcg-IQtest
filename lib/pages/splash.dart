import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir/pages/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery;
        return Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF73AEF5),
                Color(0xFF61A4F1),
                Color(0xFF478DE0),
                Color(0xFF398AE5),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            )),
            child: Center(
              child: ListView(
                padding: EdgeInsets.only(top: 200),
                children: <Widget>[
                  _logoKu(mediaQuery),
                  Text("\n TES IQ",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontFamily: "Satisfy",
                  ),
                  textAlign: TextAlign.center,
                  )
          ],
        ),
            ),
      ),
    );
  }

  Widget _logoKu(MediaQueryData mediaQuery) {
    return Image(
      image: AssetImage('asset/logoku.png'),
      height: 200,
    );
  }
}
