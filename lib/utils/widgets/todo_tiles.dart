import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskComplete;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;
  const ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskComplete,
      required this.onChanged,
      required this.deleteFunction,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
        // wrap with Slidable
        // Slidable
        // endActionPane:ActionPane(
        // motion: StretchMotion(
        // children[
        // SlidableAction(
        // onPressed: DeleteFunction
        //icon:Icons.delete
        //backgroundColor: red

        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(color: Colors.yellow),
          child: Row(
            children: [
              Checkbox(value: taskComplete, onChanged: onChanged),
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskComplete
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ));
  }
}
