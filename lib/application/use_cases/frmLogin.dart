import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minems/infrastructure/controllers/conexion.dart';

final txtUN = TextEditingController();
final txtPW = TextEditingController();

class frmLogin extends StatefulWidget {
  State<frmLogin> createState() => _frmLoginState();
}

class _frmLoginState extends State<frmLogin> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
              child: Column(
                children: [
                  const SizedBox(
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
                  TextButton(
                      onPressed: () {
                        context.push('/frmlogin/frmregister');
                      },
                      child: Text('¿Nuevo usuario? Registrarse')),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (await loginDB(txtUN.text, txtPW.text) == true) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('Success')));
                          context.push('/frmlogin/userPage');
                        } else {
                          txtUN.clear();
                          txtPW.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Wrong credentials')));
                        }
                      },
                      child: Text('Ingresar'))
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
