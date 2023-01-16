import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minems/domain/entities/usuario.dart';
import 'package:minems/infrastructure/controllers/conexion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 120),
            child: FutureBuilder<DocumentSnapshot>(
              future: users.doc(documentId).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
                  return Text("Document does not exist");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  /*
                  User(data['id'], data['username'], data['password'],
                      data['email'], '', '', '', '');
                  String username = data['username'];
                  String email = data['email'];
                  String name = data['profile']['name'];
                  String lastname = data['profile']['last_name'];
                  String occupation = data['profile']['occupation'];
                  
                  return Text("Username: ${username}\n"
                      "Email: ${data['email']}\n"
                      "Name: ${name}\n"
                      "Last name: ${lastname}\n"
                      "Occupation: ${occupation}\n");
                      */
                  return Text("Username: ${data['username']}\n"
                      "Email: ${data['email']}\n");
                }

                return Text("loading");
              },
            ),
          ),
          SizedBox(
            height: 120,
          ),
          Positioned(
            top: 200,
            left: 30,
            child: TextButton(
                onPressed: () {
                  //context.push('/frmManProfile');
                  final String location = context
                      .namedLocation('manProfile', params: {'id': documentId});
                  //params: {'id1': txtUN.text, 'id2': txtPW.text});
                  context.push(location);
                },
                child: Text('Actualizar perfil')),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: FloatingActionButton(
              elevation: 0,
              onPressed: () => context.push('/'),
              backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
              child: Icon(Icons.clear),
            ),
          ),
        ],
      ),
    );
  }
}

/*
class UserPage extends StatefulWidget {
  String id1;
  String id2;
  UserPage({super.key, required this.id1, required this.id2});
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            FutureBuilder(
                future: loginDB(widget.id1, widget.id2),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            title: Text((snapshot.data![index]).toString()),
                          );
                          //Text(snapshot.data?[index].to);
                        }));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })),
            SizedBox(
              height: 120,
            ),
            Positioned(
              top: 280,
              left: 10,
              child: TextButton(
                  onPressed: () {
                    context.push('/frmManProfile');
                  },
                  child: Text('Modificar perfil')),
            ),
            Positioned(
              top: 50,
              left: 10,
              child: FloatingActionButton(
                elevation: 0,
                onPressed: () => context.push('/'),
                backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
                child: Icon(Icons.clear),
              ),
            ),
          ],
        ),
      );
}

*/

/*
BORRAR LUEGO
Widget buildLogin(BuildContext context) => Container(
      color: Colors.white,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 50.0),
      child: Column(
        children: const [
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
                'https://scontent.flim16-2.fna.fbcdn.net/v/t1.6435-9/65639738_1186634241506683_2621134518303588352_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeH_eikVPmgzX5nWx8O2dcFENjWoxVoed1Q2NajFWh53VCYzlAzkiK622HIAEk5O36sztoZMaA3-cwDVLFoo2gEC&_nc_ohc=482uV8oG-Q0AX8C58fY&_nc_ht=scontent.flim16-2.fna&oh=00_AfDxwklGPcgiFf2rQqabOycM-CXgW0WsPSary03PACGJ0Q&oe=63D4B5CD'),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Luis Escobedo',
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          Text('lescobedo.im@gmail.com',
              style: TextStyle(
                fontSize: 16,
              )),
        ],
      ),
    );

Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(20),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () => context.go('/'),
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border),
            title: const Text('Favourites'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.workspaces),
            title: const Text('Workflow'),
            onTap: () {},
          ),
          const Divider(
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.update),
            title: const Text('Updates'),
            onTap: () {},
          ),
        ],
      ),
    );
*/