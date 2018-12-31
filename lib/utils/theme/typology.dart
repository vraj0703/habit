import 'package:flutter/material.dart';
import 'package:habit/e_injector/injector.dart';

abstract class Typology {
  TextStyle h1(Color color, Emphasis emphasis);

  TextStyle h2(Color color, Emphasis emphasis);

  TextStyle h3(Color color, Emphasis emphasis);

  TextStyle h4(Color color, Emphasis emphasis);

  TextStyle h5(Color color, Emphasis emphasis);

  TextStyle h6(Color color, Emphasis emphasis);

  TextStyle subtitle1(Color color, Emphasis emphasis);

  TextStyle subtitle2(Color color, Emphasis emphasis);

  TextStyle body1(Color color, Emphasis emphasis);

  TextStyle body2(Color color, Emphasis emphasis);

  TextStyle button(Color color, Emphasis emphasis);

  TextStyle caption(Color color, Emphasis emphasis);

  TextStyle overline(Color color, Emphasis emphasis);
}

class DefaultTypology extends Typology {
  TextStyle h1(Color color, Emphasis emphasis) {
    color.withOpacity(ThemeInjector().getEmphasis(emphasis));
    return TextStyle(fontSize: 96.0, color: color, letterSpacing: -1.5);
  }

  TextStyle h2(Color color, Emphasis emphasis) {
    color.withOpacity(ThemeInjector().getEmphasis(emphasis));
    return TextStyle(fontSize: 60.0, color: color, letterSpacing: -0.5);
  }

  TextStyle h3(Color color, Emphasis emphasis) {
    color.withOpacity(ThemeInjector().getEmphasis(emphasis));
    return TextStyle(fontSize: 48.0, color: color, letterSpacing: 0.0);
  }

  TextStyle h4(Color color, Emphasis emphasis) {
    color.withOpacity(ThemeInjector().getEmphasis(emphasis));
    return TextStyle(fontSize: 34.0, color: color, letterSpacing: 0.25);
  }

  TextStyle h5(Color color, Emphasis emphasis) {
    color.withOpacity(ThemeInjector().getEmphasis(emphasis));
    return TextStyle(fontSize: 24.0, color: color, letterSpacing: 0.0);
  }

  TextStyle h6(Color color, Emphasis emphasis) {
    color.withOpacity(ThemeInjector().getEmphasis(emphasis));
    return TextStyle(fontSize: 20.0, color: color, letterSpacing: 0.15);
  }

  TextStyle subtitle1(Color color, Emphasis emphasis) {
    color.withOpacity(ThemeInjector().getEmphasis(emphasis));
    return TextStyle(fontSize: 16.0, color: color, letterSpacing: 0.15);
  }

  TextStyle subtitle2(Color color, Emphasis emphasis) {
    color.withOpacity(ThemeInjector().getEmphasis(emphasis));
    return TextStyle(fontSize: 14.0, color: color, letterSpacing: 0.1);
  }

  TextStyle body1(Color color, Emphasis emphasis) {
    color.withOpacity(ThemeInjector().getEmphasis(emphasis));
    return TextStyle(fontSize: 16.0, color: color, letterSpacing: 0.5);
  }

  TextStyle body2(Color color, Emphasis emphasis) {
    color.withOpacity(ThemeInjector().getEmphasis(emphasis));
    return TextStyle(fontSize: 14.0, color: color, letterSpacing: 0.25);
  }

  TextStyle button(Color color, Emphasis emphasis) {
    color.withOpacity(ThemeInjector().getEmphasis(emphasis));
    return TextStyle(fontSize: 14.0, color: color, letterSpacing: 1.25);
  }

  TextStyle caption(Color color, Emphasis emphasis) {
    color.withOpacity(ThemeInjector().getEmphasis(emphasis));
    return TextStyle(fontSize: 12.0, color: color, letterSpacing: 0.4);
  }

  TextStyle overline(Color color, Emphasis emphasis) {
    color.withOpacity(ThemeInjector().getEmphasis(emphasis));
    return TextStyle(fontSize: 10, color: color, letterSpacing: 1.5);
  }
}
