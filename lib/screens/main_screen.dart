import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo1/model/todo_item.dart';
import 'package:todo1/provider/todo_provider.dart';
import 'package:todo1/widgets/todo_card.dart';
import 'package:todo1/widgets/todo_input.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  Widget _createListOfTodoItems() {
    return Consumer<TodoProvider>(
      builder: (context, provider, _) {
        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: provider.todoList.length,
            itemBuilder: (context, index) {
              return TodoCard(provider.todoList[index]);
            },
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          width: double.infinity,
          color: const Color(0xFFB8BAC6),
          child: ChangeNotifierProvider(
            create: (BuildContext context) => TodoProvider(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Text(
                  'To do',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
                ),
                _createListOfTodoItems(),
                const SizedBox(height: 10,),

                TodoInput(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
