import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:fastyle_core/fastyle_core.dart';

FastApp _buildApp(Widget child) {
  return FastApp(home: child);
}

void main() {
  const labelText = 'label';
  const captionText = 'caption';

  group('FastListHeader', () {
    group('#categoryText', () {
      testWidgets('should draw it when set', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastListHeader(
            categoryText: labelText,
          )),
        );
        await tester.pumpAndSettle();

        final text = find.text(labelText.toUpperCase());
        expect(text, findsOneWidget);
      });
    });

    group('#captionText', () {
      testWidgets('should draw it when set', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastListHeader(
            categoryText: labelText,
            captionText: captionText,
          )),
        );
        await tester.pumpAndSettle();

        final text = find.text(labelText.toUpperCase());
        final caption = find.text(captionText);
        expect(text, findsOneWidget);
        expect(caption, findsOneWidget);
      });
    });
  });
}
