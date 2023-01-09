import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minems/infrastructure/controllers/conexion.dart';

class frmLogin extends StatefulWidget {
  State<frmLogin> createState() => _frmLoginState();
}

class _frmLoginState extends State<frmLogin> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            FutureBuilder(
                future: getLista(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: ((context, index) =>
                            Text(snapshot.data?[index]['username'])));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })),
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
