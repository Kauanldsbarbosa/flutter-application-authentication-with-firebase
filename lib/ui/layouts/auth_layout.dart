import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final TextButton redirectTextButton;
  final Widget form;
  const AuthLayout(
      {super.key, required this.form, required this.redirectTextButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            children: [
              Icon(
                Icons.email,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Text(
                "github: kauanldsbarbosa",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              )
            ],
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          child: Column(children: [
            const Spacer(),
            form,
            Column(
              children: [
                const Divider(),
                redirectTextButton,
              ],
            ),
            const Spacer(),
          ])),
    );
  }
}
