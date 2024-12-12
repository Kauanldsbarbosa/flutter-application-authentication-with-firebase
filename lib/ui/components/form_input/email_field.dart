import 'package:authenticate/utils/validators.dart';
import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  final TextEditingController controller;
  const EmailField({super.key, required this.controller});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Email:"),
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.alternate_email,
                color: Theme.of(context).primaryColor,
              ),
              border: const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              contentPadding: const EdgeInsets.all(12),
              hintText: "Example: user@email.com",
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface),
          keyboardType: TextInputType.emailAddress,
          validator: (email) => Validators.validateEmail(email ?? ''),
        ),
      ],
    );
  }
}
