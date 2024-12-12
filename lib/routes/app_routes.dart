import 'package:authenticate/services/auth/is_authenticated.dart';
import 'package:authenticate/views/home.dart';
import 'package:authenticate/views/login.dart';
import 'package:authenticate/views/register.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        path: "/",
        builder: (context, state) => const HomeScreen(),
        name: "home"),
    GoRoute(
      path: "/login",
      builder: (context, state) => const Login(),
      name: "login",
    ),
    GoRoute(
        path: "/register-user",
        builder: (context, state) => const RegisterUser(),
        name: "registerUser"),
  ],
  redirect: (context, state) async {
    final auth = await Auth().isAuthenticated;
    if (state.name != "login" && state.name != 'registerUser') {
      if (!auth) {
        return '/login';
      }
    }
    return null;
  },
);
