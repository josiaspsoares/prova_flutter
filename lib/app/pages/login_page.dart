import 'package:flutter/material.dart';
import 'package:prova_flutter/app/controllers/login/login_controller.dart';
import 'package:prova_flutter/app/core/theme/custom_gradient.dart';
import 'package:prova_flutter/app/pages/information_page.dart';
import '../models/login_model.dart';
import 'components/privacy_policy_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final LoginController controller = LoginController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> validate() async {
      if (formKey.currentState!.validate()) {
        final login = LoginModel(
          user: userController.text,
          password: passwordController.text,
        );

        final isLogged = await controller.login(login: login);

        if (isLogged) {
          formKey.currentState!.reset();

          if (!context.mounted) return;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const InformationPage(),
            ),
          );
        } else {
          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Usuário ou senha inválidos'),
            ),
          );
        }
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: customGradient,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Usuário',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: userController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.person),
                      counterText: '',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    maxLength: 20,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      }

                      if (value.length > 20) {
                        return 'Usuário deve ter no máximo 20 caracteres';
                      }

                      if (value.endsWith(' ')) {
                        return 'Usuário não pode terminar com espaço';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Senha',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.lock),
                      counterText: '',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    maxLength: 20,
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.visiblePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      }

                      if (value.length > 20) {
                        return 'Senha deve ter no máximo 20 caracteres';
                      }

                      if (value.endsWith(' ')) {
                        return 'Senha não pode terminar com espaço';
                      }

                      if (value.length < 2) {
                        return 'Senha deve ter no mínimo 2 caracteres';
                      }

                      if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
                        return 'Senha deve conter apenas letras e números';
                      }

                      return null;
                    },
                    onFieldSubmitted: (_) => validate(),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF44BD6E),
                        fixedSize: const Size(200, 45),
                      ),
                      onPressed: () async => await validate(),
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  const PrivacyPolicyButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
