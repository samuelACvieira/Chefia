class AuthService {

  bool login(String user, String password) {

    return user == "admin" && password == "123";
  }
}