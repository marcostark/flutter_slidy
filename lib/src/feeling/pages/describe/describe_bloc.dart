import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:slidy_tuto/src/app_module.dart';
import 'package:slidy_tuto/src/feeling/feeling_bloc.dart';
import 'package:slidy_tuto/src/feeling/feeling_module.dart';
import 'package:slidy_tuto/src/shared/blocs/shared_bloc.dart';

class DescribeBloc extends BlocBase {  

  addModel(){
    var model = FeelingModule.to.bloc<FeelingBloc>().model;
    AppModule.to.bloc<SharedBloc>().addNewFelling(model);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
