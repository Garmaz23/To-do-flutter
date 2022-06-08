import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo1/model/todo_item.dart';
import 'package:todo1/provider/todo_provider.dart';

class TodoCard extends StatefulWidget {
  final TodoItem todoItem;
   const TodoCard(this.todoItem,{Key? key}) : super(key: key);

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
    bool isChecked = false;

  void change(bool? value) async{
    setState(() {
      widget.todoItem.isDone = value!;
    });
    await Future.delayed(const Duration(milliseconds: 1000));
      Provider.of<TodoProvider>(context, listen:false).remove(widget.todoItem);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
      margin: const EdgeInsets.only(top: 15.0),
      decoration: BoxDecoration(
        color: const Color(0xFFE1E2E7),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Transform.scale(
            scale: 1.5,
            child: Checkbox(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              activeColor: const Color(0xFFB8BAC6) ,
              value: widget.todoItem.isDone,
              onChanged: change,
            ),
          ),
           Text(widget.todoItem.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
