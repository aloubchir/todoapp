import 'package:hive_flutter/hive_flutter.dart';
class ToDoDatabase {
  List toDolist=[];
  final _mybox=Hive.box('mybox');

  // First time opening this app
  void createInitialData(){
    toDolist=[["Make Tutorial",false],["Do Exercise",false]];
  }


  //load data from database

void loadData(){

    toDolist=_mybox.get("TODOLIST");

}

//update data

void updateDataBase(){
    _mybox.put("TODOLIST", toDolist);
}

}