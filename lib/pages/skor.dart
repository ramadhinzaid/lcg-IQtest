import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir/pages/home.dart';

class SkorPage extends StatefulWidget {
  final String nama;
  final String nis;
  final skormu;
  SkorPage({Key key, this.nama, this.nis, this.skormu}) : super(key: key);
  @override
  _SkorPageState createState() => _SkorPageState(nama, nis, skormu);
}

class _SkorPageState extends State<SkorPage> {
  var nama;
  var nis;
  int skormu;
  _SkorPageState(this.nama, this.nis, this.skormu);

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
        child: Center(
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 30),
                child: _logoKu(mediaQuery),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    "Skor IQ Anda",
                    style: TextStyle(fontSize: 30, fontFamily: "Satisfy"),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "$skormu",
                    style: TextStyle(
                        shadows: [
                          Shadow(
                              blurRadius: 8,
                              color: Colors.white,
                              offset: Offset(4, 5))
                        ],
                        fontSize: 100,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30.0,
                    ),
                    _printbutton(),
                    SizedBox(
                      height: 30.0,
                    ),
                    _homebutton(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _printbutton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: _createPDF,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Print PDF',
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

  Widget _homebutton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Home',
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

  Future<void> _createPDF() async {
    const String paragraphText = 'Madrasah Aliyah Negeri 1 Kendari \n'
        'MAN 1 KENDARI\n';
    int a = skormu;
    String klasi;
    // a=115;
    if(a<=79){
      klasi = "Anda mendapatkan Tingkatan IQ rendah (keterbelakangan mental)";
    }else if(a>79 && a <=89){
      klasi = "Anda mendapatkan Tingkatan IQ rendah yang masih dalam kategori normal (bodoh)";
    }else if(a>89 && a <=110){
      klasi = "Anda mendapatkan Tingkatan IQ normal (rata-rata)";
    }else if(a>110 && a <=120){
      klasi = "Anda mendapatkan Tingkatan IQ tinggi dalam kategori normal (cerdas)";
    }else if(a>120 && a <=130){
      klasi = "Anda mendapatkan Tingkatan IQ superior (sangat cerdas)";
    }else{
      klasi = "Anda mendapatkan Tingkatan IQ sangat superior (genius)";
    }

    var time = new DateTime.now();
    var document = PdfDocument();
    //Add page and draw text to the page.
    final PdfPage page = document.pages.add();
    // PdfGrid grid = PdfGrid();
    // grid.columns.add(count: 2);
    // grid.headers.add(1);
    final PdfLayoutResult layoutResult = PdfTextElement(
      text: paragraphText,
      font: PdfStandardFont(PdfFontFamily.helvetica, 24),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      format: PdfStringFormat(alignment: PdfTextAlignment.center),
    ).draw(
        page: page,
        bounds: Rect.fromLTWH(
            4, 4, page.getClientSize().width, page.getClientSize().height),
        format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate));
    final PdfLayoutResult hasil = PdfTextElement(
      text: "Hasil Tes IQ",
      font: PdfStandardFont(PdfFontFamily.helvetica, 30),
      format: PdfStringFormat(
        alignment: PdfTextAlignment.center,
      ),
    ).draw(
        page: page,
        bounds: Rect.fromLTWH(4, layoutResult.bounds.bottom + 50,
            page.getClientSize().width, page.getClientSize().height),
        format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate));
    final PdfLayoutResult waktu = PdfTextElement(
      text: "Tanggal :" +
          time.day.toString() +
          " - " +
          time.month.toString() +
          " - " +
          time.year.toString(),
      font: PdfStandardFont(PdfFontFamily.helvetica, 14),
      format: PdfStringFormat(
        alignment: PdfTextAlignment.center,
      ),
    ).draw(
        page: page,
        bounds: Rect.fromLTWH(4, hasil.bounds.bottom + 5,
            page.getClientSize().width, page.getClientSize().height),
        format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate));
    final PdfLayoutResult id = PdfTextElement(
      text: 'Nama : ' + nama + '\nNIS     : ' + nis,
      font: PdfStandardFont(PdfFontFamily.helvetica, 20),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      format: PdfStringFormat(alignment: PdfTextAlignment.left),
    ).draw(
        page: page,
        bounds: Rect.fromLTWH(4, hasil.bounds.bottom + 150,
            page.getClientSize().width, page.getClientSize().height),
        format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate));
    final PdfLayoutResult skor = PdfTextElement(
            text: "SKOR : " + a.toString(),
            font: PdfStandardFont(PdfFontFamily.helvetica, 30),
            brush: PdfSolidBrush(PdfColor(0, 0, 0)),
            format: PdfStringFormat(alignment: PdfTextAlignment.center))
        .draw(
            page: page,
            bounds: Rect.fromLTWH(4, id.bounds.bottom + 30,
                page.getClientSize().width, page.getClientSize().height),
            format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate));
    final PdfLayoutResult klasifikasi = PdfTextElement(
            text: klasi,
            font: PdfStandardFont(PdfFontFamily.helvetica, 24),
            brush: PdfSolidBrush(PdfColor(0, 0, 0)),
            format: PdfStringFormat(alignment: PdfTextAlignment.center))
        .draw(
            page: page,
            bounds: Rect.fromLTWH(4, skor.bounds.bottom + 30,
                page.getClientSize().width, page.getClientSize().height),
            format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate));
    page.graphics.drawLine(
        PdfPen(PdfColor(0, 0, 0), width: 2),
        Offset(0, layoutResult.bounds.bottom + 10),
        Offset(page.getClientSize().width, layoutResult.bounds.bottom + 10));
    page.graphics.drawLine(PdfPen(PdfColor(0, 0, 0), width: 2),
        Offset(340, hasil.bounds.bottom), Offset(180, hasil.bounds.bottom));
    // PdfGridRow header = grid.headers[0];
    // header.cells[0].value = "Skor";
    // header.cells[1].value = "Klasifikasi";
    // header.cells[0].style.stringFormat =
    //     PdfStringFormat(alignment: PdfTextAlignment.center);
    // header.cells[1].style.stringFormat =
    //     PdfStringFormat(alignment: PdfTextAlignment.center);
    // PdfGridRow row = grid.rows.add();
    // row.cells[0].style.stringFormat =
    //     PdfStringFormat(alignment: PdfTextAlignment.center);
    // row.cells[0].value = "70 - 79";
    // row.cells[1].value = "Tingkatan IQ rendah (keterbelakangan mental";
    // row = grid.rows.add();
    // row.cells[0].style.stringFormat =
    //     PdfStringFormat(alignment: PdfTextAlignment.center);
    // row.cells[0].value = "80 - 89";
    // row.cells[1].value =
    //     "Tingkatan IQ rendah yang masih dalam kategori normal (bodoh)";
    // row = grid.rows.add();
    // row.cells[0].style.stringFormat =
    //     PdfStringFormat(alignment: PdfTextAlignment.center);
    // row.cells[0].value = "90 - 110";
    // row.cells[1].value = "Tingkatan IQ normal (rata-rata)";
    // row = grid.rows.add();
    // row.cells[0].style.stringFormat =
    //     PdfStringFormat(alignment: PdfTextAlignment.center);
    // row.cells[0].value = "111 - 120";
    // row.cells[1].value = "Tingkatan IQ tinggi dalam kategori normal (cerdas)";
    // row = grid.rows.add();
    // row.cells[0].style.stringFormat =
    //     PdfStringFormat(alignment: PdfTextAlignment.center);
    // row.cells[0].value = "121 - 130";
    // row.cells[1].value = "Tingkatan IQ superior (sangat cerdas)";
    // row.cells[0].style.stringFormat =
    //     PdfStringFormat(alignment: PdfTextAlignment.center);
    // row = grid.rows.add();
    // row.cells[0].value = ">131";
    // row.cells[1].value = "Tingkatan IQ sangat superior (genius)";
    // row.cells[0].style.stringFormat =
    //     PdfStringFormat(alignment: PdfTextAlignment.center);
    // grid.columns[0].width = 70;
    // grid.style = PdfGridStyle(
    //     cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
    //     backgroundBrush: PdfBrushes.white,
    //     textBrush: PdfBrushes.black,
    //     font: PdfStandardFont(PdfFontFamily.timesRoman, 14));
    // grid.draw(
    //     page: page, bounds: Rect.fromLTWH(20, skor.bounds.bottom + 30, 0, 0));
    var bytes = document.save();
    // Dispose the document
    document.dispose();

    //Get external storage directory
    Directory directory = await getExternalStorageDirectory();
    //Get directory path
    String path = directory.path;
    //Create an empty file to write PDF data
    File file = File('$path/Skor.pdf');
    //Write PDF data
    await file.writeAsBytes(bytes, flush: true);
    //Open the PDF document in mobile
    OpenFile.open('$path/Skor.pdf');
  }

  Widget _logoKu(MediaQueryData mediaQuery) {
    return Image(
      image: AssetImage('asset/logoku.png'),
      height: 200,
    );
  }
}
