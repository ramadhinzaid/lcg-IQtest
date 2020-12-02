import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir/pages/soal.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery;
    return Scaffold(
      body: Container(
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
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30.0),
              child: _logoKu(mediaQuery),
            ),
            Container(
              child: Text(
                "Madrasah Aliyah Negeri 1 Kendari \n MAN 1 KENDARI",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 29,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "\nAplikasi ini dapat menantang anda untuk mengetahui seberapa besar kemampuan anda dengan cara yang menyenangkan sehingga dapat menajamkan dan melatih pikiran anda untuk berpikir Logis",
                style: TextStyle(fontSize: 24.0, color: Colors.white),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 30.0),
            _playButton(),
          ],
        ),
      ),
    );
  }

  Widget _playButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Getjson("Mulai"),));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          "MULAI",
          style: TextStyle(
            color: Colors.blue,
            letterSpacing: 1.5,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _logoKu(MediaQueryData mediaQuery) {
    return Image(
      image: AssetImage('asset/logoku.png'),
      height: 150,
    );
  }
}
