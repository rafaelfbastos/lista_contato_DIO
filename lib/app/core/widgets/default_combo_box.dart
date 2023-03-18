import 'package:flutter/material.dart';

class DefaultComboBox extends StatelessWidget {
  final List<String> valueList;
  final ValueNotifier notifier;

  const DefaultComboBox(
      {Key? key, required this.notifier, required this.valueList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: notifier,
        builder: (context, value, child) {
          {
            return Container();
          }
        });
  }
}
