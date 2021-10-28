import 'package:flutter/material.dart';
import 'feature/dashboard/presentation/page/dashboard_page.dart';
import 'feature/login/presentation/page/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercises',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(primary: Colors.teal[800], secondary: Colors.teal[800]),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal[800],
        ),
      ),
      // home: RandomWords(),
      home: Router(
        routerDelegate: MyRouterDelegate(),
      ),
    );
  }
}

class MyRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  bool showDashboardPage = false;
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('MyLoginPage'),
          child: LoginPage(
            onButtonPressed: () {
              showDashboardPage = true;
              notifyListeners();
            },
          ),
        ),
        if (showDashboardPage)
          const MaterialPage(
            key: ValueKey('MyDashboardPage'),
            child: DashboardPage(),
          ),
      ],
      onPopPage: (route, result) {
        showDashboardPage = false;
        notifyListeners();
        return false;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    throw UnimplementedError();
  }
}
