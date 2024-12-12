import 'package:authenticate/ui/components/form_input/email_field.dart';
import 'package:authenticate/ui/components/form_input/input_password.dart';
import 'package:authenticate/ui/layouts/auth_layout.dart';
import 'package:authenticate/utils/validators.dart';
import 'package:authenticate/viewmodels/register_user_vm.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RegisterUserVm>(context);
    return AuthLayout(
      form: Form(
          key: viewModel.form,
          child: Column(children: [
            EmailField(
              controller: viewModel.emailController,
            ),
            const SizedBox(height: 15),
            InputPassword(
                textEditingController: viewModel.passwordController,
                fieldLabel: "Password:",
                validator: (password) =>
                    Validators.validatePassword(password ?? '')),
            const SizedBox(height: 15),
            InputPassword(
                textEditingController: viewModel.confirmPasswordController,
                fieldLabel: "Password:",
                validator: (String? value) {
                  final password = value ?? '';
                  if (password != viewModel.passwordController.text) {
                    return 'Passwords are not the same.';
                  }
                  return null;
                }),
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
                      "Sign in",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    ))),
          ])),
      redirectTextButton: TextButton(
          onPressed: () => context.go('/register'),
          child: const Text("No have account? | Sign in.")),
    );
  }
}
