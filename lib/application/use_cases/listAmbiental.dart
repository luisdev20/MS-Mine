import 'package:flutter/material.dart';

class ListTileAmbiental extends StatelessWidget {
  const ListTileAmbiental({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(''),
          backgroundColor: Colors.lime,
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
        Card(child: ListTile(title: Text('Servicios Ambientales'))),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://www.portalminero.com/download/attachments/103286240/mineria-enami-pequena-ayuda.jpg?version=4&amp;modificationDate=1444931696383'),
              backgroundColor: Colors.amber,
              //child: Text("GO"),
            ),
            title: Text('IGAC'),
            subtitle: Text(
                'Formalice sus operaciones mineras con esta imprecindible instrumento y cumpla todos los estándares peruanos.'),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSD1MoRcTIxVJpB51KDsgZc0QABKohBqEOglQ&usqp=CAU'),
              backgroundColor: Colors.amber,
              //child: Text("EX"),
            ),
            title: Text('Planos temáticos'),
            subtitle: Text(
                'Obtena un paquete de planos temáticos útiles para la aprobación ambiental de tu proyecto.'),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://www.actualidadambiental.pe/wp-content/uploads/2020/05/mineria-artesnal-andina.jpg'),
              backgroundColor: Colors.amber,
              //child: Text("RA"),
            ),
            title: Text('Igafom'),
            subtitle: Text(
                'Le brindamos versatilidad en el desarrollo de este imprescindible instrumento de acuerdo al tamaño de sus operaciones mineras'),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        ),
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
      ],
    );
  }
}
