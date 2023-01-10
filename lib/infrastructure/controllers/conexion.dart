import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minems/domain/entities/tipo_usuario.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// Borrar sql_conn
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

Future<bool?> loginDB(String username, String password) async {
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
  //Future.delayed(const Duration(seconds: 5));
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

Future<void> updateProfileDB(
    String name, String lastname, String occupation, String country) async {
  await db.collection('users').add({
    'profile': {
      'name': name,
      'last_name': lastname,
      'occupation': occupation,
      'country': country,
    }
  });
}
