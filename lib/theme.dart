import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006878),
      surfaceTint: Color(0xff006878),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa6eeff),
      onPrimaryContainer: Color(0xff004e5b),
      secondary: Color(0xff4b6268),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffcde7ee),
      onSecondaryContainer: Color(0xff334a50),
      tertiary: Color(0xff555d7e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffdce1ff),
      onTertiaryContainer: Color(0xff3d4565),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff5fafc),
      onSurface: Color(0xff171d1e),
      onSurfaceVariant: Color(0xff3f484b),
      outline: Color(0xff6f797b),
      outlineVariant: Color(0xffbfc8cb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xff83d2e5),
      primaryFixed: Color(0xffa6eeff),
      onPrimaryFixed: Color(0xff001f25),
      primaryFixedDim: Color(0xff83d2e5),
      onPrimaryFixedVariant: Color(0xff004e5b),
      secondaryFixed: Color(0xffcde7ee),
      onSecondaryFixed: Color(0xff051f24),
      secondaryFixedDim: Color(0xffb2cbd2),
      onSecondaryFixedVariant: Color(0xff334a50),
      tertiaryFixed: Color(0xffdce1ff),
      onTertiaryFixed: Color(0xff111a37),
      tertiaryFixedDim: Color(0xffbdc5eb),
      onTertiaryFixedVariant: Color(0xff3d4565),
      surfaceDim: Color(0xffd5dbdd),
      surfaceBright: Color(0xfff5fafc),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff4f6),
      surfaceContainer: Color(0xffe9eff1),
      surfaceContainerHigh: Color(0xffe4e9eb),
      surfaceContainerHighest: Color(0xffdee3e5),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003c46),
      surfaceTint: Color(0xff006878),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff1c7788),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff223a3f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff597177),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2d3553),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff646c8d),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafc),
      onSurface: Color(0xff0c1214),
      onSurfaceVariant: Color(0xff2f383a),
      outline: Color(0xff4b5456),
      outlineVariant: Color(0xff656f71),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xff83d2e5),
      primaryFixed: Color(0xff1c7788),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff005e6c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff597177),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff41595e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff646c8d),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4b5374),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc2c7c9),
      surfaceBright: Color(0xfff5fafc),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff4f6),
      surfaceContainer: Color(0xffe4e9eb),
      surfaceContainerHigh: Color(0xffd8dedf),
      surfaceContainerHighest: Color(0xffcdd2d4),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00313a),
      surfaceTint: Color(0xff006878),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00515e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff183035),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff354d53),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff222b48),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff404867),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafc),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff252e30),
      outlineVariant: Color(0xff424b4d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xff83d2e5),
      primaryFixed: Color(0xff00515e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003842),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff354d53),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff1f363c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff404867),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff29314f),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb4babb),
      surfaceBright: Color(0xfff5fafc),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffecf2f3),
      surfaceContainer: Color(0xffdee3e5),
      surfaceContainerHigh: Color(0xffd0d5d7),
      surfaceContainerHighest: Color(0xffc2c7c9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff83d2e5),
      surfaceTint: Color(0xff83d2e5),
      onPrimary: Color(0xff00363f),
      primaryContainer: Color(0xff004e5b),
      onPrimaryContainer: Color(0xffa6eeff),
      secondary: Color(0xffb2cbd2),
      onSecondary: Color(0xff1c3439),
      secondaryContainer: Color(0xff334a50),
      onSecondaryContainer: Color(0xffcde7ee),
      tertiary: Color(0xffbdc5eb),
      onTertiary: Color(0xff272f4d),
      tertiaryContainer: Color(0xff3d4565),
      onTertiaryContainer: Color(0xffdce1ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0e1416),
      onSurface: Color(0xffdee3e5),
      onSurfaceVariant: Color(0xffbfc8cb),
      outline: Color(0xff899295),
      outlineVariant: Color(0xff3f484b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff006878),
      primaryFixed: Color(0xffa6eeff),
      onPrimaryFixed: Color(0xff001f25),
      primaryFixedDim: Color(0xff83d2e5),
      onPrimaryFixedVariant: Color(0xff004e5b),
      secondaryFixed: Color(0xffcde7ee),
      onSecondaryFixed: Color(0xff051f24),
      secondaryFixedDim: Color(0xffb2cbd2),
      onSecondaryFixedVariant: Color(0xff334a50),
      tertiaryFixed: Color(0xffdce1ff),
      onTertiaryFixed: Color(0xff111a37),
      tertiaryFixedDim: Color(0xffbdc5eb),
      onTertiaryFixedVariant: Color(0xff3d4565),
      surfaceDim: Color(0xff0e1416),
      surfaceBright: Color(0xff343a3c),
      surfaceContainerLowest: Color(0xff090f11),
      surfaceContainerLow: Color(0xff171d1e),
      surfaceContainer: Color(0xff1b2122),
      surfaceContainerHigh: Color(0xff252b2d),
      surfaceContainerHighest: Color(0xff303637),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff99e8fb),
      surfaceTint: Color(0xff83d2e5),
      onPrimary: Color(0xff002a32),
      primaryContainer: Color(0xff4a9cad),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffc7e1e8),
      onSecondary: Color(0xff11292e),
      secondaryContainer: Color(0xff7c959b),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffd4dbff),
      onTertiary: Color(0xff1c2442),
      tertiaryContainer: Color(0xff878fb3),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1416),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd5dee1),
      outline: Color(0xffaab3b6),
      outlineVariant: Color(0xff899294),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff00505c),
      primaryFixed: Color(0xffa6eeff),
      onPrimaryFixed: Color(0xff001418),
      primaryFixedDim: Color(0xff83d2e5),
      onPrimaryFixedVariant: Color(0xff003c46),
      secondaryFixed: Color(0xffcde7ee),
      onSecondaryFixed: Color(0xff001418),
      secondaryFixedDim: Color(0xffb2cbd2),
      onSecondaryFixedVariant: Color(0xff223a3f),
      tertiaryFixed: Color(0xffdce1ff),
      onTertiaryFixed: Color(0xff060f2c),
      tertiaryFixedDim: Color(0xffbdc5eb),
      onTertiaryFixedVariant: Color(0xff2d3553),
      surfaceDim: Color(0xff0e1416),
      surfaceBright: Color(0xff3f4547),
      surfaceContainerLowest: Color(0xff040809),
      surfaceContainerLow: Color(0xff191f20),
      surfaceContainer: Color(0xff23292a),
      surfaceContainerHigh: Color(0xff2e3435),
      surfaceContainerHighest: Color(0xff393f40),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd3f6ff),
      surfaceTint: Color(0xff83d2e5),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff7fcee0),
      onPrimaryContainer: Color(0xff000d11),
      secondary: Color(0xffdbf4fb),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffaec7ce),
      onSecondaryContainer: Color(0xff000d11),
      tertiary: Color(0xffeeefff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffb9c1e7),
      onTertiaryContainer: Color(0xff020926),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff0e1416),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe8f2f4),
      outlineVariant: Color(0xffbbc4c7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff00505c),
      primaryFixed: Color(0xffa6eeff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff83d2e5),
      onPrimaryFixedVariant: Color(0xff001418),
      secondaryFixed: Color(0xffcde7ee),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb2cbd2),
      onSecondaryFixedVariant: Color(0xff001418),
      tertiaryFixed: Color(0xffdce1ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffbdc5eb),
      onTertiaryFixedVariant: Color(0xff060f2c),
      surfaceDim: Color(0xff0e1416),
      surfaceBright: Color(0xff4b5153),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1b2122),
      surfaceContainer: Color(0xff2b3133),
      surfaceContainerHigh: Color(0xff363c3e),
      surfaceContainerHighest: Color(0xff424849),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
