class User {
  String _id = '',
      _username = '',
      _password = "",
      _email = "",
      _name = "",
      _lastname = "",
      _occupation = "",
      _country = "";

  User(String id, String username, String password, String email, String name,
      String lastname, String occupation, String country) {
    _id = id;
    _username = username;
    _password = password;
    _email = email;
    _name = name;
    _lastname = lastname;
    _occupation = occupation;
    _country = country;
  }

  String get username => _username;

  set username(String str) {
    _username = str;
  }

  String get password => _password;

  set password(String str) {
    _password = str;
  }

  String get email => _email;

  set email(String str) {
    _email = str;
  }

  String get name => _name;

  set name(String str) {
    _name = str;
  }

  String get lastname => _lastname;

  set lastname(String str) {
    _lastname = str;
  }

  String get occupation => _occupation;

  set occupation(String str) {
    _occupation = str;
  }

  String get country => _country;

  set country(String str) {
    _country = str;
  }
}
