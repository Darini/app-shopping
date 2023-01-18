import 'package:flutter/cupertino.dart';
import 'package:shopping/ui/android/pages/account.page.dart';
import 'package:shopping/ui/android/pages/cart.page.dart';
import 'package:shopping/ui/ios/pages/home.page.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: CupertinoColors.activeBlue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
            ),
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.shopping_cart,
            ),
            tooltip: 'Carrinho',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.profile_circled,
            ),
            tooltip: 'Conta',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                {
                  return const HomePage();
                }
              case 1:
                {
                  return CartPage();
                }
              case 2:
                {
                  return const AccountPage();
                }
              default:
                {
                  return const HomePage();
                }
            }
          },
          defaultTitle: 'Shopping App',
        );
      },
    );
  }
}
