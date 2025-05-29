class AuthRepository {
  bool login(String user, String pass) {
    if (user == "1" && pass == "1") return true;
    return false;
  }
}
