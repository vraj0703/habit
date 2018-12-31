import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primary;

  Color get primaryLight;

  Color get primaryDark;

  Color get secondary;

  Color get secondaryLight;

  Color get secondaryDark;

  Color get background;

  Color get surface;

  Color get error;

  Color get onPrimary;

  Color get onSecondary;

  Color get onBackground;

  Color get onSurface;

  Color get onError;
}

class DefaultColor extends AppColors {
  Color get primaryDark => Color(0xFF31B2DF);

  Color get primary => Color(0xFF53BFE2);

  Color get primaryLight => Color(0xFF31B2DF);

  Color get onPrimary => Color(0xcdffffee);

  Color get secondaryDark => Color(0xFF282B2D);

  Color get secondary => Color(0xFF58666E);

  Color get secondaryLight => Color(0xFF949D82);

  Color get onSecondary => Color(0xFFc9c9c9);

  Color get background => Color(0xFFF5F5F5);

  Color get onBackground => Color(0xFF282B2D);

  Color get error => Color(0xFFff0000);

  Color get onError => Color(0xFFF5F5F5);

  Color get surface => Color(0xFFFFFFFF);

  Color get onSurface => Color(0xFF282B2D);
}
