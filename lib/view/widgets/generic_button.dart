import 'package:flutter/material.dart';
import 'package:new_joiner/view/styles/colours.dart' as clr;

class GenericButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget buttonContent;
  const GenericButton(
      {super.key, required this.onPressed, required this.buttonContent});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: clr.SecondaryColor,
      child: buttonContent,
    );
  }
}
