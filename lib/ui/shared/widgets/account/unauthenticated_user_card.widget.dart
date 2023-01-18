import 'package:flutter/material.dart';
import 'package:shopping/ui/android/pages/login.page.dart';
import 'package:shopping/ui/android/pages/signup.page.dart';

class UnauthenticatedUserCard extends StatelessWidget {
  const UnauthenticatedUserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 60,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(
                  title: 'Login',
                ),
              ),
            );
          },
          child: const Text('Autentique-se'),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignupPage(
                  title: 'Cadastro',
                ),
              ),
            );
          },
          child: const Text('Ainda não sou cadastrado'),
        ),
      ],
    );
  }
}
