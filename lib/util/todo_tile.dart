import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget{
   ToDoTile({super.key,required this.taskName,required this.taskCompleted,required this.onChanged,required this.deleteFunction});

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
            ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(color: Colors.blue[200],
          borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Checkbox(
                value: taskCompleted,
                onChanged: onChanged
                ,activeColor: Colors.black,
            ),
            Text(taskName,
              style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough:TextDecoration.none),
            ),
          ],
        ),

        ),
      ),
    );

  }

}