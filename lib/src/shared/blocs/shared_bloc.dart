import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:slidy_tuto/src/shared/models/feeling_model.dart';

class SharedBloc extends BlocBase {
  
  //List<FeelingModel> feelings = [];

  BehaviorSubject<List<FeelingModel>> _listController = BehaviorSubject.seeded([]);

  Observable<List<FeelingModel>> get listOut => _listController.stream;

  addNewFelling(FeelingModel feelingModel){
    _listController.value.add(feelingModel);
    _listController.add(_listController.value);
  }
  
  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}
