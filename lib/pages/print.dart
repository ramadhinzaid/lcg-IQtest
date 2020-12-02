import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugas_akhir/pages/skor.dart';
import 'package:tugas_akhir/pages/style.dart';

class PrintPage extends StatefulWidget {
  var skormu;
  PrintPage({Key key, @required this.skormu}) : super(key:key);
  @override
  _PrintPageState createState() => _PrintPageState(skormu);
}

class _PrintPageState extends State<PrintPage> {
  int skormu;
  _PrintPageState(this.skormu);
  final _textnama = TextEditingController();
  final _textnis = TextEditingController();
  bool _validate = false;

  Widget _buildnama() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nama',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _textnama,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              errorText: _validate ? "Nama Tidak Boleh Kosong" : null,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.account_box,
                color: Colors.white,
              ),
              hintText: 'Masukkan Nama Anda',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildnis() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'NIS',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _textnis,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              errorText: _validate ? "NIS Tidak Boleh Kosong" : null,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.chrome_reader_mode,
                color: Colors.white,
              ),
              hintText: 'Masukkan NIS Anda',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _playbutton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          setState(() {
            _textnama.text.isEmpty || _textnis.text.isEmpty
                ? _validate = true
                : Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SkorPage(
                          nama: _textnama.text,
                          nis: _textnis.text,
                          skormu: skormu,
                        )));
          });
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Lihat Hasil',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(children: <Widget>[
                  Container(
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
                      ),
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 120.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 30.0),
                          _buildnama(),
                          SizedBox(height: 30.0),
                          _buildnis(),
                          SizedBox(height: 30.0),
                          _playbutton(),
                        ],
                      ),
                    ),
                  )
                ])))), 
    onWillPop: (){
      return showDialog(context: context,
      builder: (context) => AlertDialog(
        title: Text("Tes IQ"),
        content: Text("Anda Tidak Bisa Kembali"),
        actions: <Widget>[
          FlatButton(onPressed: (){
            Navigator.of(context).pop();
            }, 
            child: Text("OK"))
        ],
      ));
    });
  }
}
