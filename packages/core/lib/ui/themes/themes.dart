import 'package:fastyle_core/fastyle_core.dart';

export './base/base.dart';
export './dark/dark.dart';
export './helpers/helpers.dart';
export './light/light.dart';
export './theme.factory.dart';
export './theme_scheme.dart';

class FastTheme {
  static FastThemeScheme dark = FastThemeScheme(
    blue: kDarkBlueFastTheme,
    orange: kDarkOrangeFastTheme,
    indigo: kDarkIndigoFastTheme,
    pink: kDarkPinkFastTheme,
    purple: kDarkPurpleFastTheme,
    teal: kDarkTealFastTheme,
    yellow: kDarkYellowFastTheme,
  );

  static FastThemeScheme light = FastThemeScheme(
    blue: kLightBlueFastTheme,
    orange: kLightOrangeFastTheme,
    indigo: kLightIndigoFastTheme,
    pink: kLightPinkFastTheme,
    purple: kLightPurpleFastTheme,
    teal: kLightTealFastTheme,
    yellow: kLightYellowFastTheme,
  );
}
