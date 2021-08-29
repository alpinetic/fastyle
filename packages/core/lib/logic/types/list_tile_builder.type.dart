import 'package:flutter/material.dart';

import 'package:fastyle_core/fastyle_core.dart';

typedef FastListItemBuilder<T extends FastItem> = Widget Function(
  BuildContext context,
  T item,
  int index,
);
