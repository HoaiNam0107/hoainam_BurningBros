abstract class LoginLocalDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
}

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  @override
  Future<void> saveToken(String token) async {}

  @override
  Future<String?> getToken() async {
    return null;
  }
}
