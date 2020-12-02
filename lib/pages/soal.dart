import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugas_akhir/pages/print.dart';

class Getjson extends StatelessWidget {
  final String langname;
  Getjson(this.langname);
  String assettoload;
  var pilihsec;
  int u = 1;
  int sec = 0;
  setasset() {
    if (langname == "Mulai") {
      var dis = [];
      var ran = new Random();
      for (int i;;) {
        dis.add(ran.nextInt(4));
        pilihsec = dis.toSet().toList();
        if (pilihsec.length < 4) {
          continue;
        } else {
          break;
        }
      }
      //pilihsec = 3;
      if (pilihsec[u] == 1) {
        assettoload = "asset/sec1.json";
        sec = 1;
      } else if (pilihsec[u] == 2) {
        assettoload = "asset/sec2.json";
        sec = 2;
      } else if (pilihsec[u] == 3) {
        assettoload = "asset/sec3.json";
        sec = 3;
      } else if (pilihsec[u] == 4) {
        assettoload = "asset/sec4.json";
        sec = 4;
      } else if (pilihsec[u] == 5) {
        assettoload = "asset/sec5.json";
        sec = 5;
      } else if (pilihsec[u] == 6) {
        assettoload = "asset/sec6.json";
        sec = 6;
      } else if (pilihsec[u] == 7) {
        assettoload = "asset/sec7.json";
        sec = 7;
      } else if (pilihsec[u] == 8) {
        assettoload = "asset/sec8.json";
        sec = 8;
      } else if (pilihsec[u] == 9) {
        assettoload = "asset/sec9.json";
        sec = 9;
      } else if (pilihsec[u] == 10) {
        assettoload = "asset/sec10.json";
        sec = 10;
      } else if (pilihsec[u] == 11) {
        assettoload = "asset/sec11.json";
        sec = 11;
      } else if (pilihsec[u] == 12) {
        assettoload = "asset/sec12.json";
        sec = 12;
      } else if (pilihsec[u] == 13) {
        assettoload = "asset/sec13.json";
        sec = 13;
      } else if (pilihsec[u] == 14) {
        assettoload = "asset/sec14.json";
        sec = 14;
      } else {
        assettoload = "asset/sec15.json";
        sec = 15;
      }
      print("Section = " + sec.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString(assettoload, cache: true),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
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
              child: Text(
                "Loading",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          return Soal(mydata: mydata);
        }
      },
    );
  }
}

class Soal extends StatefulWidget {
  var mydata;
  Soal({Key key, @required this.mydata}) : super(key: key);
  @override
  _SoalState createState() => _SoalState(mydata);
}

class _SoalState extends State<Soal> {
  var mydata = new List();
  _SoalState(this.mydata);
  int pilihan = 1;
  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int skormu = 0;
  int j = 0;
  int nmrsoal = 1;
  int detik = 60;
  int menit = 59;
  String tampildetik = '00';
  String tampilmenit = '59';
  String tampiljam = '00';
  var random_array;
  var array;
  Map<String, Color> btncolor = {
    "a": Colors.indigoAccent,
    "b": Colors.indigoAccent,
    "c": Colors.indigoAccent,
    "d": Colors.indigoAccent,
    "e": Colors.indigoAccent,
  };

  @override
  void initState() {
    minut();
    second();
    lcg();
    //genrandomarray();
    super.initState();
  }

  // overriding the setstate function to be called only if mounted
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void minut() {
    menit = menit - 1;
    const onesec = Duration(minutes: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (menit < 1) {
          menit = 0;
        }
        tampilmenit = menit.toString();
      });
    });
  }

  void second() {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (detik < 1) {
          menit = menit - 1;
          detik = 59;
        } else {
          detik = detik - 1;
        }
        if (menit <= 0 && detik <= 0) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => PrintPage(skormu: skormu),
          ));
        }
        tampildetik = detik.toString();
      });
    });
  }

//Linear Congruential Generator
  lcg() {
    var a = 1, b = 19, m = 30, c = [], p2 = 0, p1 = 0;
    var lis = [];
    var distinctIds = [];
    var rand = new Random();
    for (var k = 1; k < 10; k++) {
      for (int i = 0;;) {
        distinctIds.add(rand.nextInt(10));
        c = distinctIds.toSet().toList();
        if (c.length < 10) {
          continue;
        } else {
          break;
        }
        //p1=c[k];
      }
      array = (a * c[k] + b) % m;
      print(array);
      //array=22;
      for (int l = 0; l < 30; l++) {
        p2 = ((a * array) + b) % (m);
        array = p2;
        array = p2;
        if (array == array) {
          array == array;
        }
        if (array == 0) {
          array = m;
        }
        lis.add(array) as List;
        random_array = lis.toSet().toList();
      }
    }
    //print("LCG +$random_array");
  }

  void nextquestion() {
    setState(() {
      if (j < 29) {
        pilihan = random_array[j];
        //print("ran"+random_array[j]);
        j++;
        nmrsoal++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => PrintPage(skormu: skormu),
        ));
      }
      btncolor["a"] = Colors.indigoAccent;
      btncolor["b"] = Colors.indigoAccent;
      btncolor["c"] = Colors.indigoAccent;
      btncolor["d"] = Colors.indigoAccent;
      btncolor["e"] = Colors.indigoAccent;
    });
  }

  void checkanswer(String k) {
    int pilihan = random_array[j];
    // in the previous version this was
    // mydata[2]["1"] == mydata[1]["1"][k]
    // which i forgot to change
    // so nake sure that this is now corrected
    if (mydata[2][pilihan.toString()] == mydata[1][pilihan.toString()][k]) {
      // just a print sattement to check the correct working
      // debugPrint(mydata[2][i.toString()] + " is equal to " + mydata[1][i.toString()][k]);
      skormu = skormu + 5;
      // changing the color variable to be green
      colortoshow = right;
    } else {
      // just a print sattement to check the correct working
      // debugPrint(mydata[2]["1"] + " is equal to " + mydata[1]["1"][k]);
      colortoshow = wrong;
    }
    setState(() {
      // applying the changed color to the particular button that was selected
      btncolor[k] = colortoshow;
      //canceltimer = true;
    });

    // changed timer duration to 1 secondq
    Timer(Duration(seconds: 1), nextquestion);
  }

  Widget choicebutton(String k) {
    int pilihan = random_array[j];
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: mydata[1][pilihan.toString()][k].split('/')[0] == 'asset'
            ? Image(image: AssetImage(mydata[1][pilihan.toString()][k]))
            : Text(
                mydata[1][pilihan.toString()][k],
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Alike",
                  fontSize: 16.0,
                ),
                maxLines: 1,
              ),
        color: btncolor[k],
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  Widget _logoKu(MediaQueryData mediaQuery) {
    return Image(
      image: AssetImage('asset/logoku.png'),
      height: 70,
    );
  }

  @override
  Widget build(BuildContext context) {
    int soal = random_array[j];
    //print(random_array);
    MediaQueryData mediaQuery;
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Tes IQ",
                  ),
                  content: Text("Anda Tidak Bisa Kembali"),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'OK',
                      ),
                    )
                  ],
                ));
      },
      child: Scaffold(
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
                color: Colors.indigoAccent,
                width: MediaQuery.of(context).size.width,
                height: 75.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 15),
                      child: _logoKu(mediaQuery),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 20),
                      child: Text(
                        tampiljam + ":" + tampilmenit + ":" + tampildetik,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 130,
                      child: RaisedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text("Tes IQ"),
                                    content: Text(
                                        "Apakah Anda Yakin Ingin Melihat Hasil?"),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                              builder: (context) => PrintPage(
                                                skormu: skormu,
                                              ),
                                            ));
                                          },
                                          child: Text("Ya")),
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Tidak"))
                                    ],
                                  ));
                        },
                        child: Text(
                          "Lihat Hasil",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 30,
              child: 
              Card(
                
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Center(child: Text(nmrsoal.toString()+"/30", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),))))
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.8,
                  child: mydata[0][soal.toString()].split('/')[0] == "asset"
                      ? Image(
                          image: AssetImage(mydata[0][soal.toString()]),
                          height: 60,
                        )
                      : Text(
                          mydata[0][soal.toString()],
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Alike",
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.justify,
                        )),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.8,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 2.0,
                  mainAxisSpacing: 5,
                  children: <Widget>[
                    choicebutton("a"),
                    choicebutton("b"),
                    choicebutton("c"),
                    choicebutton("d"),
                    choicebutton("e"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
