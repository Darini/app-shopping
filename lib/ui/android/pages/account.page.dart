import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/user.bloc.dart';
import 'package:shopping/ui/android/pages/settings.page.dart';
import 'package:shopping/ui/shared/widgets/account/authenticated_user_card.widget.dart';
import 'package:shopping/ui/shared/widgets/account/unauthenticated_user_card.widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ),
            );
          },
          child: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ),
      ),
      body: bloc.user == null
          ? const UnauthenticatedUserCard()
          : const AuthenticatedUserCard(),
    );
  }
}
