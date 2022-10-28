import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _listenAwal = "";
  String _tanggal = "";

  Future<void> testingFirebase() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('laporan').get();
    if (snapshot.exists) {
      print("data dari firestore@@@");
      print(snapshot.value);
      print("@@@data dari firestore :");
    } else {
      print('Tidak ada data dari firestore@@@');
    }

    FirebaseDatabase.instance.ref('laporan').set({
          "id_user" : 'aabbcc',
          "tanggal" : DateTime.now().toString(),
          "isi" : 'coba dulu',
        }).then((_) {
          print("tulis di firestore berhasil@@@");
        }).catchError((gagal) {
          print("tulis di firestore gagal@@@");
          print(gagal);
          print("@@@tulis di firestore gagal");
        });
  }

  @override
  void initState() {
    super.initState();
    testingFirebase();
    FirebaseDatabase.instance.ref('laporan').onValue.listen((DatabaseEvent event) {
      if(_listenAwal == "1") {
        if(event.snapshot.value != null) {
          var nilaifd = event.snapshot.value as Map<Object?, dynamic>;
          if(nilaifd['tanggal'] != null) {
            setState(() {
              _tanggal = nilaifd['tanggal'];
            });
          }
        }
      }
      _listenAwal = "1";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ulik CRUD - Testing Firebase"),
      ),
      body: Center(
        child: Text(_tanggal,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print("nayla");
          await testingFirebase();
          print("naswa");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}