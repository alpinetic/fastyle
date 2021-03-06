import 'package:fastyle_core/fastyle_core.dart';
import 'package:flutter/material.dart';

class FastPadding extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const FastPadding({
    Key? key,
    required this.child,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding, child: child);
  }
}

class FastPadding24 extends FastPadding {
  FastPadding24({
    Key? key,
    required Widget child,
    EdgeInsets padding = kFastEdgeInsets24,
  }) : super(
          key: key,
          child: child,
          padding: padding,
        );
}

class FastPadding16 extends FastPadding {
  FastPadding16({
    Key? key,
    required Widget child,
    EdgeInsets padding = kFastEdgeInsets16,
  }) : super(
          key: key,
          child: child,
          padding: padding,
        );
}

class FastPadding12 extends FastPadding {
  FastPadding12({
    Key? key,
    required Widget child,
    EdgeInsets padding = kFastEdgeInsets12,
  }) : super(
          key: key,
          child: child,
          padding: padding,
        );
}

class FastPadding8 extends FastPadding {
  FastPadding8({
    Key? key,
    required Widget child,
    EdgeInsets padding = kFastEdgeInsets8,
  }) : super(
          key: key,
          child: child,
          padding: padding,
        );
}
