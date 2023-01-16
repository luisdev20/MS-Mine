import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minems/domain/entities/tipo_usuario.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

// TESTING
Future getDoc(id) async {
  //CollectionReference collectionReference = db.collection('users');
  //DocumentReference document = collectionReference.doc(id);
  DocumentReference document = await db.doc('users/${id}');
  document.get().then((doc) => print(doc.data()));
}

//arriba
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

Future<String> loginDB(String username, String password) async {
  List us = [];
  QuerySnapshot querySnapshot = await db
      .collection('users')
      .where('username', isEqualTo: username)
      .where('password', isEqualTo: password)
      .get();

  querySnapshot.docs.forEach((element) {
    us.add(element.data());
  });
  Future.delayed(const Duration(seconds: 5));
  if (querySnapshot.docs.isNotEmpty) {
    print("FOUND!");
  } else {
    print("NOT FOUND :(");
  }
  return us[0]["id"];
}

/*
Future<void> getData(String id) async {
  await db.collection('users').doc(id).get().then((value) {
    for (var doc in value) {
      print("${doc.id} => ${doc.data()}");
    }
  });
}
*/
Future<void> createUser(String username, String password, String email,
    Timestamp created, Timestamp updated) async {
  final docUser = await db.collection('users').doc();
  docUser.set({
    'username': username,
    'password': password,
    'email': email,
    'created': created,
    'updated': updated,
    'id': docUser.id
  });
}

Future<void> updateProfileDB(String id, String name, String lastname,
    String occupation, String country) async {
  final docUser = await db
      .collection('users')
      .doc(id)
      .update({
        'profile': {
          'name': name,
          'last_name': lastname,
          'occupation': occupation,
          'country': country,
        }
      })
      .then((value) => print("User $id has been updated"))
      .catchError((error) => print("Failed to updated user: $error"));
}
