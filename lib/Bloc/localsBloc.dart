import 'dart:async';
import 'package:workservices/Entity/local.dart';

class LocalBloc{

  final _localAddStreamController = StreamController<Local>();

  //Getters
  StreamSink <Local> get localAddStreamController => _localAddStreamController.sink;

  LocalBloc(); //Constructor


  //Funciones
  _add(Local local){

  }

  //dispose
  void dispose(){
    _localAddStreamController.close();
}


}