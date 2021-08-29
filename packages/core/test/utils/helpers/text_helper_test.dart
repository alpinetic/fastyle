import 'package:test/test.dart';

import 'package:fastyle_core/fastyle_core.dart';

void main() {
  group('#normalizeTextByRemovingDiacritics()', () {
    test('should lowercase any given text', () {
      expect(
        normalizeTextByRemovingDiacritics('LOWERCASE'),
        equals('lowercase'),
      );
    });

    test('should remove any diacritics from any given text', () {
      expect(normalizeTextByRemovingDiacritics('brûlée'), equals('brulee'));
    });

    test('should lowercase and remove any diacritics from any given text', () {
      expect(normalizeTextByRemovingDiacritics('Brûlée'), equals('brulee'));
    });
  });
}
