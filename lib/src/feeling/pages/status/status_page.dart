import 'package:flutter/material.dart';
import 'package:slidy_tuto/src/feeling/feeling_bloc.dart';
import 'package:slidy_tuto/src/feeling/feeling_module.dart';
import 'package:slidy_tuto/src/shared/models/feeling_model.dart';
import 'package:slidy_tuto/src/shared/widgets/smille.dart';

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  double valueRange = 0;
  _getFeeling(valueRange) {
    if (valueRange == 0) {
      return "Feliz";
    } else if (valueRange > 0 && valueRange < 0.3) {
      return "Normal";
    } else if (valueRange > 0.3 && valueRange < 0.51) {
      return "Indiferente";
    } else if (valueRange > 0.51 && valueRange < 0.75) {
      return "Triste";
    } else if (valueRange > 0.75) {
      return "Raiva";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Como está se sentido agora ? "),
          Container(
            height: 10,
          ),
          Container(
            height: 200,
            width: 200,
            child: Smiley(
              range: valueRange,
            ),
          ),
          Container(
            height: 10,
          ),
          Text(_getFeeling(valueRange),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.lerp(Colors.blue, Colors.red, valueRange))),
          Slider(
            onChanged: (value) {
              setState(() {
                valueRange = value;
              });
            },
            value: valueRange,
            min: 0,
            max: 1,
          ),
          OutlineButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              var model = FeelingModule.to.bloc<FeelingBloc>().model;
              model.feeling = valueRange;
              model.title = _getFeeling(valueRange);
              FeelingModule.to.bloc<FeelingBloc>().pageController.jumpToPage(1);
            },            
            child: Text("PRÓXIMO", style: TextStyle(color: Theme.of(context).primaryColor,),),
          )
        ],
      ),
    );
  }
}
