import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/cart.bloc.dart';
import 'package:shopping/blocs/user.bloc.dart';
import 'package:shopping/models/authenticated_user.model.dart';
import 'package:shopping/models/user.model.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key? key, required this.title}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  var username = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Usuário',
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Usuário inválido';
                  }
                  return null;
                },
                onSaved: (value) {
                  username = value!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Senha inválida';
                  }
                  return null;
                },
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      authenticate(context);
                    }
                  },
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  authenticate(BuildContext context) async {
    var blocUser = Provider.of<UserBloc>(context, listen: false);
    var blocCart = Provider.of<CartBloc>(context, listen: false);

    UserModel? user = await blocUser.authenticate(
      AuthenticatedUserModel(
        username: username,
        password: password,
      ),
    );

    if (user != null) {
      final SnackBar snackBar;
      if (blocCart.cart.isEmpty) {
        snackBar = SnackBar(
          content: Text(
            'Bem vindo ${user.name}, seu carrinho está vazio, que tal adicionar alguns itens?',
          ),
        );
      } else {
        snackBar = SnackBar(
          content: Text(
            'Bem vindo ${user.name}, finalize sua compra para aproveitar os seus produtos :)',
          ),
        );
      }
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.pop(context);

      return;
    }

    const snackBar = SnackBar(
      content: Text(
        'Usuário ou senha inválidos',
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
