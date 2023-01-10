import 'dart:io'; //for image picker
import 'package:firebase_storage/firebase_storage.dart'; //firebase storage
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minems/infrastructure/controllers/conexion.dart';
import 'package:image_picker/image_picker.dart';

final txtNA = TextEditingController();
final txtLN = TextEditingController();
final txtOC = TextEditingController();
const loginsuccess = SnackBar(content: Text('Success'));

class frmManProfile extends StatefulWidget {
  State<frmManProfile> createState() => _frmManProfileState();
}

class _frmManProfileState extends State<frmManProfile> {
  String profilepicURL = '';
  //Image picking function -------------------------------------
  void pickUploadImage() async {
    final imageP = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 75,
    );

    Reference ref =
        FirebaseStorage.instance.ref().child('profilepics/profilepic.jpg');
    if (imageP != null) {
      await ref.putFile(File(imageP.path));
      final refURL = ref.getDownloadURL().then((value) {
        print(value);
        setState(() {
          profilepicURL = value;
        });
      });
    }
  }

  // End of Image picking functions -------------------------------
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          pickUploadImage();
                        },
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: profilepicURL == ''
                              ? const NetworkImage(
                                  'https://firebasestorage.googleapis.com/v0/b/mine-ms.appspot.com/o/profilepics%2Fblankprofile.png?alt=media&token=657dd9bd-2c20-47ca-9656-3c7be26e805b')
                              : NetworkImage(profilepicURL),
                        )),
                    TextFormField(
                      controller: txtNA,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                      validator: (value) => (value == null || value.isEmpty)
                          ? "Usename cannot be empty"
                          : null,
                    ),
                    TextFormField(
                      controller: txtLN,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                      ),
                      validator: (value) =>
                          (value == null || value.isEmpty || value.length < 8)
                              ? 'Password must be at least 8 characters'
                              : null,
                    ),
                    TextFormField(
                      controller: txtOC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Occupation',
                      ),
                      validator: (value) =>
                          (value == null || value.isEmpty || value.length < 8)
                              ? 'Password must be at least 8 characters'
                              : null,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        width: 1.3,
                        color: Colors.black38,
                      ))),
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Country',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          DropdownButtonCountry(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          await updateProfileDB(txtNA.text, txtLN.text,
                              txtOC.text, dropdownValue);
                          txtNA.clear();
                          txtLN.clear();
                          txtOC.clear();
                          ScaffoldMessenger.of(context)
                              .showSnackBar(loginsuccess);
                        },
                        child: Text('Guardar'))
                  ],
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 10,
              child: FloatingActionButton(
                elevation: 0,
                onPressed: () => context.pop(),
                backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
                child: Icon(Icons.clear),
              ),
            ),
          ],
        ),
      );
}

String dropdownValue = country.first;
const List<String> country = [
  'Select',
  'Perú',
  'Chile',
  'Argentina',
  'Bolivia',
  'Panamá',
  'España',
  'Estados Unidos',
  'Francia',
];

class DropdownButtonCountry extends StatefulWidget {
  const DropdownButtonCountry({super.key});

  @override
  State<DropdownButtonCountry> createState() => _DropdownButtonCountryState();
}

class _DropdownButtonCountryState extends State<DropdownButtonCountry> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: DropdownButton<String>(
        isExpanded: true,
        underline: Container(width: 0),
        value: dropdownValue,
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        items: country.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: Colors.black54),
            ),
          );
        }).toList(),
      ),
    );
  }
}
