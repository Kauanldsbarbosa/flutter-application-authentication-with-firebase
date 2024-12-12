import 'package:authenticate/routes/app_routes.dart';
import 'package:authenticate/services/result.dart';
import 'package:authenticate/services/secure_storage_service.dart';
import 'package:authenticate/services/use_api.dart';
import 'package:authenticate/ui/components/custom_toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoginViewModel extends ChangeNotifier {
  final BuildContext context;
  LoginViewModel({required this.context});

  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> validateAndMakeLogin() async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (form.currentState!.validate()) {
      final response =
          await _login(emailController.text, passwordController.text);

      if (response.isSuccess) {
        await SecureStorageService()
            .saveSecureData('auth-token', response.success['idToken']);
        final expirationDate = DateTime.now()
            .add(Duration(seconds: int.parse(response.success['expiresIn'])));
        await SecureStorageService().saveSecureData(
            'token-expires-date', expirationDate.toIso8601String());
        goRouter.go('/');
      } else {
        ShowCustomToasts.alertToast(context, response.error.toString());
      }
    }
    notifyListeners();
  }

  Future<Result> _login(String email, String password) async {
    String firebaseToken = "${dotenv.env['FIREBASE_TOKEN']}";
    String apiUrl =
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$firebaseToken";
    final response = await UseApi.post(apiUrl, {
      "Content-Type": "application/json"
    }, {
      "email": email,
      "password": password,
      "returnSecureToken": true,
    });

    return response;
  }
}
