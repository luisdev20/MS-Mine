import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            buildLogin(context),
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

Widget buildLogin(BuildContext context) => Container(
      color: Color.fromRGBO(0, 0, 0, 0.3),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 50.0),
      child: Column(
        children: const [
          CircleAvatar(
            radius: 52,
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
