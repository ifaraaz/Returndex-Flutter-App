class User {
  String _username;
  String _password;
  User(this._username, this._password);

  User.map(dynamic obj) {
    this._username = obj["AccessToken"];
    this._password = obj["Mobileno"];
  }

  String get username => _username;
  String get password => _password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["password"] = _password;

    return map;
  }
}


