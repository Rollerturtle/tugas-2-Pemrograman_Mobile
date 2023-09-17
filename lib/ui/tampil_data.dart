import 'package:flutter/material.dart';
import 'form_data.dart';

class TampilData extends StatefulWidget {
  final Map<String, dynamic> data;

  TampilData({
    required this.data,
  });

  @override
  _TampilDataState createState() => _TampilDataState();
}

class _TampilDataState extends State<TampilData> {
  String nama = '';
  String nim = '';
  int tahunLahir = 2000;

  @override
  void initState() {
    super.initState();
    updateData(widget.data);
  }

  void updateData(Map<String, dynamic> newData) {
    setState(() {
      nama = newData['nama'] ?? 'Nama';
      nim = newData['nim'] ?? 'NIM';
      tahunLahir = newData['tahunLahir'] ?? 2000;
    });
  }

  @override
  Widget build(BuildContext context) {
    int tahunSekarang = DateTime.now().year;
    int umur = tahunSekarang - tahunLahir;

    return Scaffold(
      appBar: AppBar(
        title: Text("Perkenalan"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Nama saya $nama, NIM $nim, dan umur saya adalah $umur tahun.",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () async {
                  final updatedData = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FormData(
                        initialNama: nama,
                        initialNim: nim,
                        initialTahunLahir: tahunLahir,
                      ),
                    ),
                  );

                  if (updatedData != null) {
                    updateData(updatedData);
                  }
                },
                icon: Icon(Icons.edit),
                label: Text("Edit Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
