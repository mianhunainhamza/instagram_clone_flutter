class UserModal{
  final username;
  final password;
  final email;

  UserModal(
  {
    required this.username,
    required this.password,
    required this.email
}
      );


  toJson(){
    return {
      'username':username,
      'password':password,
      'email':email
    };

  }
}