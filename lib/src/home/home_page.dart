import 'package:flutter/material.dart';
import 'package:slidy_tuto/src/app_module.dart';
import 'package:slidy_tuto/src/feeling/feeling_module.dart';
import 'package:slidy_tuto/src/shared/blocs/shared_bloc.dart';
import 'package:slidy_tuto/src/shared/models/feeling_model.dart';
import 'package:slidy_tuto/src/shared/widgets/smille.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Recuperando o bloc desejado
  final blocFeeling = AppModule.to.getBloc<SharedBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pensamentos"),
      ),
      body: StreamBuilder<List<FeelingModel>>(
        stream: blocFeeling.listOut, // A saida do bloc a lista
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final List<FeelingModel> models = snapshot.data;
          if (models.length == 0) {
            return Container(
              color: Colors.grey[300],
              child: Center(
                child: Text("Sem sentimento cadastrado no momento"),
              ),
            );
          }

          return ListView.separated(
            itemCount: models.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  height: 100,
                  width: 100,
                  child: Smiley(range: models[index].feeling),
                ),
                title: Text(models[index].title),
                subtitle: Text(models[index].subtitle),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => FeelingModule()));
        },
      ),
    );
  }
}
