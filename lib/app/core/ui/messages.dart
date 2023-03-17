import 'package:flutter/material.dart';
import 'package:lista_contatos/app/core/extensions/theme_extensions.dart';

class Messages {
  final BuildContext context;

  Messages._(this.context);

  factory Messages.of(BuildContext context) {
    return Messages._(context);
  }

  void showError(String message) => _messages(message, Colors.red);
  void showInfo(String message) => _messages(message, context.primaryColor);

  void _messages(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }
}
