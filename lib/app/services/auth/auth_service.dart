abstract class AuthService {
  Future<bool> login({required String user, required String password});
}
