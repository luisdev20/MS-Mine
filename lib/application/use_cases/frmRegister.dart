import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minems/infrastructure/controllers/conexion.dart';

final txtUN = TextEditingController();
final txtPW = TextEditingController();
final txtEM = TextEditingController();
final txtCR = TextEditingController();
final txtUP = TextEditingController();
const usersuccess = SnackBar(content: Text('User created'));

class frmRegister extends StatefulWidget {
  State<frmRegister> createState() => _frmRegisterState();
}

class _frmRegisterState extends State<frmRegister> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  TextFormField(
                    controller: txtUN,
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                    validator: (value) => (value == null || value.isEmpty)
                        ? "Usename cannot be empty"
                        : null,
                  ),
                  TextFormField(
                    controller: txtPW,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: (value) =>
                        (value == null || value.isEmpty || value.length < 8)
                            ? 'Password must be at least 8 characters'
                            : null,
                  ),
                  TextFormField(
                    controller: txtEM,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'user@example.org',
                    ),
                    validator: (value) => (value == null ||
                            value.isEmpty ||
                            !value.contains('@') ||
                            !value.contains('.'))
                        ? 'Invalid Email'
                        : null,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await createUser(txtUN.text, txtPW.text, txtEM.text,
                            Timestamp.now(), Timestamp.now());
                        txtUN.clear();
                        txtPW.clear();
                        txtEM.clear();
                        ScaffoldMessenger.of(context).showSnackBar(usersuccess);
                      },
                      child: Text('Guardar'))
                ],
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
