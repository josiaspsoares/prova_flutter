import '../../models/login_model.dart';
import '../../services/auth/auth_service.dart';
import '../../services/auth/mock_auth_service_impl.dart';

class LoginController {
  final AuthService _authService = MockAuthService();

  Future<bool> login({required LoginModel login}) async {
    return await _authService.login(user: login.user, password: login.password);
  }
}
