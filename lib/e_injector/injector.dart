import 'package:flutter/material.dart';
import 'package:habit/utils/theme/color.dart';
import 'package:habit/utils/theme/language.dart';
import 'package:habit/utils/theme/typology.dart';

enum Flavor { MOCK, DEBUG, RELEASE }
enum Emphasis { HIGH, MID, DISABLE }
enum Scale { NORMAL, BIG, BIGGER }

class ThemeInjector {
  static final ThemeInjector _singleton = new ThemeInjector._internal();

  factory ThemeInjector() {
    return _singleton;
  }

  ThemeInjector._internal();

  void configure() {}

  AppColors get appColors => new DefaultColor();

  ThemeData get themeData => new ThemeData();

  double get scale => Injector().getScale();

  Typology get typology => new DefaultTypology();

  Language get strings => new English();

  double getEmphasis(Emphasis emphasis) {
    switch (emphasis) {
      case Emphasis.MID:
        return .87;
      case Emphasis.DISABLE:
        return .50;
      case Emphasis.HIGH:
      default:
        return 1.0;
    }
  }
}

class Injector {
  /*injector declaration*/
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  /*variables declaration*/
  static Flavor _flavor;
  static Scale _scale;

  /*configuration*/
  void configure(Flavor flavor, Scale scale) {
    _flavor = flavor;
    _scale = scale;
  }

  double getScale() {
    switch (_scale) {
      case Scale.NORMAL:
        return 1;
      case Scale.BIG:
      default:
        return 1.5;
    }
  }

/* String get baseUrl {
    switch (_flavor) {
      case Flavor.RELEASE:
        return Apis.baseUrl;
      case Flavor.DEBUG:
      default:
        return Apis.baseUrlTest;
    }
  }

  String get midUrl => Apis.midUrl;*/
}
