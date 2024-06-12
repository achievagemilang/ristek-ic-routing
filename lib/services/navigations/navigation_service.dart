part of '_navigations.dart';

class NavigationService implements Navigation {
  final _history = <String>[];
  final routes = <String, WidgetBuilder>{
    SplashScreen.routeName: (_) => const SplashScreen(),
    MainScreen.routeName: (_) => const MainScreen(),
    HomeScreen.routeName: (_) => const HomeScreen(),
    ProfileScreen.routeName: (_) => const ProfileScreen(),
    DetailsScreen.routeName: (_) => const DetailsScreen(),
  };
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void updateHistory(String? routeName) {
    if (routeName != null) {
      _history.add(routeName);
    }
  }

  Future<T?> push<T>(Widget widget, [String? routeName]) async {
    updateHistory(routeName);
    return navigatorKey.currentState?.push<T>(
      MaterialPageRoute(
        builder: (_) => widget,
        settings: RouteSettings(name: routeName),
      ),
    );
  }

  Future<T?> pushReplacement<T, K>(Widget widget, [String? routeName]) async {
    updateHistory(routeName);
    return navigatorKey.currentState?.pushReplacement<T, K>(
      MaterialPageRoute(
        builder: (_) => widget,
        settings: RouteSettings(name: routeName),
      ),
    );
  }

  Future<T?>? pushNamed<T>(String routeName) {
    updateHistory(routeName);
    return navigatorKey.currentState?.pushNamed<T>(routeName);
  }

  Future<T?>? pushReplacementNamed<T, K>(String routeName) {
    updateHistory(routeName);
    return navigatorKey.currentState?.pushReplacementNamed<T, K>(routeName);
  }

  @override
  Future<T?>? pushRoute<T>(Route<T> route, [String? routeName]) {
    updateHistory(routeName);
    return navigatorKey.currentState?.push<T>(route);
  }

  @override
  void pop<T>([T? result]) {
    navigatorKey.currentState?.pop<T>(result);
  }

  @override
  Future<T?> navigateTo<T>(Widget newPage, [String? routeName]) {
    return push<T>(newPage, routeName);
  }

  @override
  void popUntil(String routeName) {
    navigatorKey.currentState?.popUntil(ModalRoute.withName(routeName));
  }

  @override
  void popToRoot() {
    navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }
}
