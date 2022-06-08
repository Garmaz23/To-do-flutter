import 'package:flutter/cupertino.dart';
import 'package:todo1/model/todo_item.dart';

class TodoProvider extends ChangeNotifier{
  final List<TodoItem> _items = [];

  List<TodoItem> get todoList => _items;

  void add(TodoItem item){
    _items.add(item);
    notifyListeners();
  }

  void remove(TodoItem item){
    _items.remove(item);
    notifyListeners();
  }
}