import 'package:fastyle_core/fastyle_core.dart';
import 'package:flutter/material.dart';

class FastParagraph extends StatelessWidget {
  final EdgeInsets margin;
  final Widget? child;
  final String? text;

  const FastParagraph({
    Key? key,
    this.margin = const EdgeInsets.symmetric(vertical: 8.0),
    this.text,
    this.child,
  })  : assert(text != null || child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: child ?? FastBody(text: text!),
    );
  }
}
