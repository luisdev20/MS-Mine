import 'package:flutter/material.dart';

class ListTileMineria extends StatelessWidget {
  const ListTileMineria({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(''),
          backgroundColor: Colors.black,
        ),
        body: const LisTileExample(),
      ),
    );
  }
}

class LisTileExample extends StatelessWidget {
  const LisTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        Card(child: ListTile(title: Text('Servicios en Minería'))),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Discharge_pipe.jpg/1200px-Discharge_pipe.jpg'),
              backgroundColor: Colors.amber,
              //child: Text("ML"),
            ),
            title: Text('Matriz de Leopold'),
            subtitle: Text(
                'Obtenga un reporte del análisis cualitativo del impacto ambiental en su proyecto en pocos pasos.'),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://docplayer.es/docs-images/58/41430633/images/90-0.png'),
              backgroundColor: Colors.amber,
              //child: Text("GO"),
            ),
            title: Text('Granulometría óptica'),
            subtitle: Text(
                'Procesamiento digital de imágenes para monitorear su voladura y cumplimiento de mine-to-mill.'),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage:
                  NetworkImage('https://exsa.net/image/productos/exaditch.png'),
              backgroundColor: Colors.amber,
              //child: Text("EX"),
            ),
            title: Text('Cálculo de explosivos'),
            subtitle: Text(
                'Optimice la cantidad de explosivos a utilizar en cada etapa de voladura, reduzca costos y control ambiental.'),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjW-XNrmxJd1uvQOTelA8bPITdg7rtb-X_jQ&usqp=CAU'),
              backgroundColor: Colors.amber,
              //child: Text("RA"),
            ),
            title: Text('Requerimiento de Aire'),
            subtitle: Text(
                'Calcule el requerimiento de aire en su labor minera subterránea y cumpla con la normatividad vigente.'),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://geotecniachile.cl/wp-content/uploads/2021/01/taludes-1.jpg'),
              backgroundColor: Colors.amber,
              //child: Text("ET"),
            ),
            title: Text('Estabilidad de taludes'),
            subtitle: Text(
                'Estudie el macizo rocoso que interviene en su proyecto a través de un detallado análisis de variables.'),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://camiper.com/tiempominero-noticias-en-mineria-para-el-peru-y-el-mundo/wp-content/uploads/2019/11/drones-para-mineria-tiempo-minero.jpg'),
              backgroundColor: Colors.amber,
              //child: Text("FA"),
            ),
            title: Text('Fotogrametría aérea'),
            subtitle: Text(
                'Una correcta información espacial es la base de todo proyecto, llene un formulario y le pondremos en contacto con uno de nuestros pilotos acreditados.'),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        ),
      ],
    );
  }
}
