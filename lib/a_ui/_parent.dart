import 'package:flutter/material.dart';
import 'package:habit/b_bloc/bloc.dart';
import 'package:habit/e_injector/injector.dart';

abstract class ParentPageState<T extends StatefulWidget> extends State<T> {
  final bloc = Bloc();
  final theme = ThemeInjector();
}
