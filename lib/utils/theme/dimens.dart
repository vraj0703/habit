abstract class Dimens {
  double get paddingSmall;

  double get paddingMedium;

  double get paddingLarge;

  double get marginSmall;

  double get marginMedium;

  double get marginLarge;

  double get divider;

  double get iconSmall;

  double get iconMedium;

  double get iconLarge;
}

class DefaultDimens extends Dimens {
  double get paddingSmall => 8.0;
  double get paddingMedium => 16.0;
  double get paddingLarge => 24.0;

  double get marginSmall => 8.0;
  double get marginMedium => 16.0;
  double get marginLarge =>24.0;

  double get divider => 1.0;

  double get iconSmall => 24.0;
  double get iconMedium => 48.0;
  double get iconLarge => 64.0;
}
