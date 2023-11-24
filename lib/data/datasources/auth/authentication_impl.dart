abstract class AuthenticationInterFace {
  Future<void> register(String username,String password,String passwordConfirm,String path) async {}
  Future<String> login(String username,String password,String path);
}