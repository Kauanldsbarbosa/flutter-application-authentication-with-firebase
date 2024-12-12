import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  final TextEditingController textEditingController;
  final String fieldLabel;
  final Function(String)? onSaved;
  final String? Function(String?)? validator;
  const InputPassword(
      {super.key,
      required this.textEditingController,
      required this.fieldLabel,
      this.onSaved,
      this.validator});

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool isInvisiblePassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldLabel,
          style: const TextStyle(fontSize: 15.0),
        ),
        TextFormField(
          controller: widget.textEditingController,
          focusNode: FocusNode(),
          decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () => setState(() {
                  isInvisiblePassword = !isInvisiblePassword;
                }),
                icon: Icon(
                    isInvisiblePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Theme.of(context).colorScheme.primary),
              ),
              contentPadding: const EdgeInsets.all(12),
              border: const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              hintText: "Digite sua senha",
              filled: true,
              fillColor: const Color.fromARGB(255, 240, 239, 239)),
          obscureText: isInvisiblePassword,
          keyboardType: TextInputType.visiblePassword,
          onSaved: (password) {
            widget.onSaved?.call(password ?? '');
          },
          validator: widget.validator,
        ),
      ],
    );
  }
}
