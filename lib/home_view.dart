import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _listenAwal = "";
  String _tanggal = "";
  String _tokenMessage = "";

  Future<void> _testingFirebase() async {
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
    _testingFirebase();

    FirebaseMessaging.instance.getToken().then((value) {
      if(value != null) {
        setState(() {
          _tokenMessage = value;
        });;
      }
    });

    FirebaseMessaging.onMessage.listen((message) async {
      print("ada message fcm ${message.notification!.title}");
    });

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
      body: Column(
        children: [
          Text("Tanggal dari Realtime Database : $_tanggal"),
          Text("Token : $_tokenMessage"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print("nayla");
          print(_tokenMessage);
          await _testingFirebase();
          print("naswa");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}