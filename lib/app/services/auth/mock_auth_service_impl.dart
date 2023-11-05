

import 'auth_service.dart';

class MockAuthService implements AuthService {

  @override
  Future<bool> login({required String user, required String password}) async {
    return true;
  }
}
