class tipo_usuario {
  String _codigo = '', _nombre = "";

  tipo_usuario(String cod, String nom) {
    _codigo = cod;
    _nombre = nom;
  }

  String get Codigo => _codigo;

  set Codigo(String str) {
    _codigo = str;
  }

  String get Nombre => _nombre;

  set Nombre(String str) {
    _nombre = str;
  }
}