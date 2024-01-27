import 'package:hive/hive.dart';

class ToDoDatabase{
  List toDoList = [];
//   reference hivebox
final _myBox = Hive.box('myDB');

void createInitialData() {
  toDoList = [
    ["Make notes", false],
    ["Do Exercise", false]
  ];
}
  void loadDataFromData(){
toDoList = _myBox.get("TODOLIST");
  }
  void updateDatabase(){
  _myBox.put("TODOLIST", toDoList);
  }

}