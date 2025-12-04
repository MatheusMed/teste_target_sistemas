import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_target_sistemas/taskApp/core/widgets/text_form_custom.dart';
import 'package:teste_target_sistemas/taskApp/stores/login_store.dart';
import 'package:teste_target_sistemas/taskApp/views/todoView/home_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final store = GetIt.I.get<LoginStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                ),
              ),
              const SizedBox(height: 40),
              Observer(
                builder: (_) => TextFormCustom(
                  labelText: "Usuário",
                  prefixIcon: const Icon(Icons.person_outline),
                  errorText: store.userError,
                  onChanged: store.setUser,
                ),
              ),

              const SizedBox(height: 20),

              Observer(
                builder: (_) => TextFormCustom(
                  labelText: "Senha",
                  obscureText: !store.showPassword,
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      store.showPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: store.toggleShowPassword,
                  ),
                  errorText: store.passwordError,
                  onChanged: store.setPassword,
                ),
              ),

              const SizedBox(height: 30),

              Observer(
                builder: (_) => SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: !store.isValid || store.isLoading
                        ? null
                        : () async {
                            final sucesso = await store.login();
                            if (sucesso) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => HomeView()),
                              );
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: store.isLoading
                        ? const CircularProgressIndicator()
                        : const Text(
                            "Entrar",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
