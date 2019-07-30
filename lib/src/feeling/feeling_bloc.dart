import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:slidy_tuto/src/shared/models/feeling_model.dart';

class FeelingBloc extends BlocBase {

  final FeelingModel model = FeelingModel();
  
  final PageController pageController = PageController();  

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
