import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:lista_contatos/app/core/extensions/theme_extensions.dart';

class CustomLoader {
  final BuildContext context;

  CustomLoader._(this.context);

  factory CustomLoader.show(BuildContext context) {
    return CustomLoader._(context);
  }

  void primary() => _loader(context.primaryColorDark);

  _loader(Color color) {
    Loader.show(
      context,
      overlayColor: Colors.black26,
      progressIndicator: CircularProgressIndicator(color: color),
    );
  }
}
