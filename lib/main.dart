import 'package:flutter/material.dart';
import 'package:belajar_flutter/ui/tampil_data.dart';
import 'package:belajar_flutter/ui/form_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Flutter Pertama",
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Flutter Pertama"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TampilData(data: data),
                  ),
                );
              },
              icon: Icon(Icons.person),
              label: Text("Lihat Profil"),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                final updatedData = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormData(),
                  ),
                );

                if (updatedData != null) {
                  setState(() {
                    data.addAll(updatedData);
                  });
                }
              },
              icon: Icon(Icons.edit),
              label: Text("Edit Data"),
            ),
          ],
        ),
      ),
    );
  }
}
