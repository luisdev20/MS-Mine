import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minems/infrastructure/controllers/conexion.dart';

final txtUN = TextEditingController();
final txtPW = TextEditingController();
var isLogged = false;

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
                    child: const Text('Ingresar'),
                    onPressed: () async {
                      final myFuture = loginDB(txtUN.text, txtPW.text);
                      myFuture.then((value) {
                        if (value.isNotEmpty) {
                          final String location = context.namedLocation(
                              'userpage',
                              params: {'id': value});
                          context.push(location);
                          isLogged = true;
                          print(value);
                        } else {
                          txtUN.clear();
                          txtPW.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Wrong credentials')));
                        }
                      });
                    },
                  )
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
