import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/database.dart';


import '../util/dialog_box.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();

}

class HomePageState extends State<HomePage>{

  final _mybox=Hive.box('mybox');

  ToDoDatabase db= ToDoDatabase();

  @override
  void initState() {
    // first time ever opening the app, then create default data
    if(_mybox.get("TODOLIST")==null)
      {
        db.createInitialData();
      }else
        {
          db.loadData();
        }


    super.initState();
  }



  final controller= TextEditingController();

  //List toDolist=[["Make Tutorial",true],["Do Exercise",false]];



  void checkBoxChanged(bool? value,int index){
    setState(() {
      db.toDolist[index][1]=!db.toDolist[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask(){
    setState(() {
      db.toDolist.add([controller.text,false]);

    });
    Navigator.of(context).pop();
  }


  void createNewTask(){
    showDialog(context: context,

        builder: (context){
      return DialogBox(
        controller: controller,
        onSave: saveNewTask,
        onCancel: ()=>Navigator.of(context).pop(),
      );
    });
  }

  void deleteTask(int index){
setState(() {
  db.toDolist.removeAt(index);
});
db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        title: Center(child: Text("TO DO")),
        elevation: 8,
      ),

        floatingActionButton: FloatingActionButton(
            onPressed:createNewTask ,child: Icon(Icons.add),)
      ,

      body: ListView.builder(
          itemCount: db.toDolist.length,
          itemBuilder: (context,index){
            return ToDoTile(
                taskName: db.toDolist[index][0],
                taskCompleted: db.toDolist[index][1],
                onChanged: (value)=> checkBoxChanged(value,index),
                deleteFunction: (context)=>deleteTask(index),
            );
        },

         // ToDoTile(taskName: "Make Tutorial",taskCompleted: true, onChanged: (p0){},),
         // ToDoTile(taskName: "Do Exercise",taskCompleted: false, onChanged: (p0){},),

      ),
    );
  }

}
