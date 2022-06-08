import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo1/model/todo_item.dart';
import 'package:todo1/provider/todo_provider.dart';

class TodoInput extends StatefulWidget {
  const TodoInput({Key? key}) : super(key: key);

  @override
  State<TodoInput> createState() => _TodoInputState();
}


class _TodoInputState extends State<TodoInput> {
  final TextEditingController _controller = TextEditingController();
  Widget _createTextField() {
    return Expanded(
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Create a new task...',
          filled: true,
          fillColor: const Color(0xFFE1E2E7),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Color(0xFFE1E2E7), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Color(0xFFE1E2E7), width: 1.0),
          ),
        ),
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 22.0),
      ),
    );
  }

  Widget _createButton() {
    return ElevatedButton(
      onPressed: () {
        FocusScope.of(context).unfocus();
        Provider.of<TodoProvider>(context, listen:false).add(TodoItem(_controller.text));
        _controller.clear();

      },
      child: const Icon(Icons.add, color: Colors.white, size: 38),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
        primary: Colors.black,
        onPrimary: Colors.white,
      ),
    );
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _createTextField(),
        const SizedBox(width: 10),
        _createButton(),
      ],
    );
  }
}
