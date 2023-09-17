import 'package:flutter/material.dart';

class FormData extends StatefulWidget {
  final String? initialNama;
  final String? initialNim;
  final int? initialTahunLahir;

  FormData({
    this.initialNama,
    this.initialNim,
    this.initialTahunLahir,
  });

  @override
  _FormDataState createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  late TextEditingController namaController;
  late TextEditingController nimController;
  late TextEditingController tahunLahirController;

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.initialNama);
    nimController = TextEditingController(text: widget.initialNim);
    tahunLahirController =
        TextEditingController(text: widget.initialTahunLahir?.toString());
  }

  @override
  void dispose() {
    namaController.dispose();
    nimController.dispose();
    tahunLahirController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: "Nama"),
            ),
            TextField(
              controller: nimController,
              decoration: InputDecoration(labelText: "NIM"),
            ),
            TextField(
              controller: tahunLahirController,
              decoration: InputDecoration(labelText: "Tahun Lahir"),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                final nama = namaController.text;
                final nim = nimController.text;
                final tahunLahir = int.tryParse(tahunLahirController.text) ?? 0;

                final updatedData = {
                  'nama': nama,
                  'nim': nim,
                  'tahunLahir': tahunLahir,
                };
                Navigator.of(context).pop(updatedData);
              },
              child: Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
