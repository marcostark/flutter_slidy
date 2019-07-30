import 'package:slidy_tuto/src/feeling/pages/describe/describe_bloc.dart';
import 'package:slidy_tuto/src/feeling/pages/status/status_bloc.dart';
import 'package:slidy_tuto/src/feeling/feeling_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:slidy_tuto/src/feeling/feeling_page.dart';

class FeelingModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => DescribeBloc()),
        Bloc((i) => StatusBloc()),
        Bloc((i) => FeelingBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => FeelingPage(); //View Principal

  static Inject get to => Inject<FeelingModule>.of();
}
