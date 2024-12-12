import 'package:authenticate/routes/app_routes.dart';
import 'package:authenticate/services/auth/is_authenticated.dart';
import 'package:authenticate/ui/themes/app_theme.dart';
import 'package:authenticate/viewmodels/login_vm.dart';
import 'package:authenticate/viewmodels/register_user_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Auth()),
      ChangeNotifierProvider(
          create: (BuildContext context) => LoginViewModel(context: context)),
      ChangeNotifierProvider(
          create: (BuildContext context) => RegisterUserVm(context: context))
    ],
    child: const Main(),
  ));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
    );
  }
}
