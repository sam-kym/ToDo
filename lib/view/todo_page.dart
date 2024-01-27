import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../data_controllers/database_helper.dart';
import '../utils/widgets/dialog_box.dart';
import '../utils/widgets/todo_tiles.dart';

class TodoUI extends StatefulWidget {
  const TodoUI({super.key});

  @override
  State<TodoUI> createState() => _TodoUIState();
}

class _TodoUIState extends State<TodoUI> {
  // reference hive database
  final _myBox = Hive.box('myDB');
  ToDoDatabase db = ToDoDatabase();
  final _controller = TextEditingController();
  @override
  void initState(){
    super.initState();
    if(_myBox.get("TODOLIST")==null){
      db.createInitialData();
    }else{
      db.loadDataFromData();
    }
    db.updateDatabase();
  }


  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  // create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return ToDoDialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: Navigator.of(context).pop,
          );
        });
  }

  // delete Task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: const Text('TO DO'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskComplete: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
