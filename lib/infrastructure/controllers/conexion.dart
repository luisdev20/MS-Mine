import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minems/domain/entities/tipo_usuario.dart';
import 'package:flutter/material.dart';
import 'package:sql_conn/sql_conn.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getLista() async {
  //Lectura de datos
  List pe = [];
  CollectionReference collectionReference = db.collection('users');
  QuerySnapshot querySnapshot = await collectionReference.get();
  querySnapshot.docs.forEach((element) {
    pe.add(element.data());
  });
  Future.delayed(const Duration(seconds: 5));
  return pe;
}

Future<void> addData(String username, String password, String email,
    Timestamp created, Timestamp updated) async {
  await db.collection('users').add({
    'username': username,
    'password': password,
    'email': email,
    'created': created,
    'updated': updated
  });
}

Future<void> getData() async {
  await db.collection('users').get().then((value) {
    for (var doc in value.docs) {
      print("${doc.id} => ${doc.data()}");
    }
  });
}

Future<void> loginDB(String username, String password) async {
  await db
      .collection('users')
      .where('username', isEqualTo: username)
      .where('password', isEqualTo: password)
      .get()
      .then((value) {
    if (value.docs.isNotEmpty) {
      print("FOUND!");
      return true;
    } else {
      print("NOT FOUND :(");
      return false;
    }
  }, onError: (e) => print('Error completing: $e'));
}

Future<void> updateProfileDB(String name, String lastname, String occupation, String country) async {
  await db.collection('users').add({
    'profile': username,
    'password': password,
    'email': email,
    'created': created,
    'updated': updated
  });
}

//PARA SQL SERVER -- BORRAR
class conexion {
  Future<void> connect() async {
    debugPrint("Connecting...");
    try {
      print('LOADING');
      await SqlConn.connect(
          ip: "192.168.1.11",
          port: "1433",
          databaseName: "DBBiblioteca; MSSQLSERVER",
          username: "sa",
          password: "12345");
      debugPrint("Connected!");
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      debugPrint('');
    }
  }

  conexion() {
    connect();
  }

  Future<void> read(String query) async {
    var res = await SqlConn.readData(query);
    debugPrint(res.toString());
  }

  Future<void> write(String query) async {
    var res = await SqlConn.writeData(query);
    debugPrint(res.toString());
  }
}
