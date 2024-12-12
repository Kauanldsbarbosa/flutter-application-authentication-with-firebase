import 'package:authenticate/ui/components/form_input/email_field.dart';
import 'package:authenticate/ui/components/form_input/input_password.dart';
import 'package:authenticate/ui/layouts/auth_layout.dart';
import 'package:authenticate/utils/validators.dart';
import 'package:authenticate/viewmodels/login_vm.dart';
import 'package:authenticate/views/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);
    return AuthLayout(
      form: Form(
          key: viewModel.form,
          child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EmailField(
                  controller: viewModel.emailController,
                )
              ],
            ),
            const SizedBox(height: 15),
            InputPassword(
                textEditingController: viewModel.passwordController,
                fieldLabel: "Password:",
                validator: (password) =>
                    Validators.validatePassword(password ?? '')),
            SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () async {
                      await viewModel.validateAndMakeLogin();
                    },
                    style: ButtonStyle(
                        shape: const WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                        backgroundColor: WidgetStatePropertyAll<Color>(
                            Theme.of(context).primaryColor)),
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    ))),
          ])),
      redirectTextButton: TextButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RegisterUser())),
          child: const Text("No have account? | Sign in.")),
    );
  }
}
