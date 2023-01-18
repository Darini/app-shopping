import 'package:shopping/blocs/user.bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticatedUserCard extends StatelessWidget {
  const AuthenticatedUserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UserBloc>(context);

    return SizedBox(
      child: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(bloc.user!.image!),
                  fit: BoxFit.fill,
                ),
                color: Theme.of(context).primaryColor,
                border: Border.all(
                  width: 4.0,
                  color: Colors.white,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(200),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Bem vindo, ${bloc.user?.name}'),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                bloc.logout();
              },
              child: const Text(
                'Sair',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
