import 'package:flutter/material.dart';
import 'package:slidy_tuto/src/feeling/feeling_bloc.dart';
import 'package:slidy_tuto/src/feeling/feeling_module.dart';
import 'package:slidy_tuto/src/feeling/pages/describe/describe_bloc.dart';

class DescribePage extends StatefulWidget {
  @override
  _DescribePageState createState() => _DescribePageState();
}

class _DescribePageState extends State<DescribePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Escreva seu sentimento"),
            Container(height: 30,),
            TextField(
              maxLines: 5,
              onChanged: (value){
                var model = FeelingModule.to.bloc<FeelingBloc>().model;
                model.subtitle = value;
              },
            ),
            Container(height: 30,),
            OutlineButton(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () {              
                FeelingModule.to.bloc<DescribeBloc>().addModel();
                Navigator.pop(context);
              },            
              child: Text("SALVAR", style: TextStyle(color: Theme.of(context).primaryColor,),),
            )
          ],
        ),
      ),
    );
  }
}
