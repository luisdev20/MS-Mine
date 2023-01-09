import 'package:minems/domain/entities/tipo_usuario.dart';
import 'package:minems/infrastructure/controllers/conexion.dart';

class ctipo_usuario {
  conexion con = conexion();
  ctipo_usuario() {
    con = conexion();
  }

  void select() {
    con.read("SELECT * FROM tipo_usuarios");
  }

  void insert(tipo_usuario dato) {
    con.write(
        "INSERT INTO tipo_usuarios VALUES ('${dato.Codigo}','${dato.Nombre}')");
  }

  void update(tipo_usuario dato) {
    con.write(
        "UPDATE tipo_usuarios SET nombre='${dato.Nombre}' WHERE codigo='${dato.Codigo}'");
  }

  void delete(tipo_usuario dato) {
    con.write("DELETE FROM tipo_usuarios WHERE codigo='${dato.Codigo}'");
  }
}
