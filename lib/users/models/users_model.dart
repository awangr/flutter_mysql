class UsersModel {
  int id;
  String username;
  String email;
  String password;
  UsersModel(this.id, this.username, this.email, this.password);

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'username': username,
        'email': email,
        'password': password
      };
}
