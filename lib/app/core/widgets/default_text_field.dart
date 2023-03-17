import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lista_contatos/app/core/extensions/theme_extensions.dart';

class DefaultTextField extends StatelessWidget {
  final String label;
  final TextEditingController? textEC;
  final bool obscureText;
  final FormFieldValidator<String>? validator;

  const DefaultTextField(
      {super.key,
      required this.label,
      this.obscureText = false,
      this.textEC,
      this.validator});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> obscureTextVN = ValueNotifier(obscureText);

    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextVN,
      builder: (context, value, child) => TextFormField(
        controller: textEC,
        validator: validator,
        cursorColor: context.primaryColor,
        obscureText: obscureTextVN.value,
        decoration: InputDecoration(
          label: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          suffixIcon: obscureText
              ? (IconButton(
                  onPressed: () {
                    obscureTextVN.value = !obscureTextVN.value;
                  },
                  icon: FaIcon(obscureTextVN.value
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash),
                ))
              : null,
          suffixIconColor: context.primaryColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.primaryColorDark),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.primaryColor),
            borderRadius: BorderRadius.circular(20),
          ),
          floatingLabelStyle: TextStyle(color: context.primaryColor),
        ),
      ),
    );
  }
}
