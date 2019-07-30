import 'package:flutter/material.dart';
import 'package:slidy_tuto/src/feeling/feeling_bloc.dart';
import 'package:slidy_tuto/src/feeling/feeling_module.dart';
import 'package:slidy_tuto/src/feeling/pages/describe/describe_page.dart';
import 'package:slidy_tuto/src/feeling/pages/status/status_page.dart';
import 'package:slidy_tuto/src/shared/models/feeling_model.dart';

class FeelingPage extends StatefulWidget {
  @override
  _FeelingPageState createState() => _FeelingPageState();
}

class _FeelingPageState extends State<FeelingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo"),
      ),
      body: PageView(
        controller: FeelingModule.to.bloc<FeelingBloc>().pageController,
        children: <Widget>[
          StatusPage(),
          DescribePage(),
        ],
      )
    );
  }
}
