import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/model/todo.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;

  const TodoTile({required this.todo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.toNamed('/todo/${todo.id}');
      }, // TODO:RouterにIDを渡してタスク編集画面に遷移
      leading: const Icon(
        Icons.circle,
        color: Colors.grey,
      ), // TODO:TodoCheckboxウィジェットの作成
      title: Text(
        todo.description,
        style: todo.done
            ? const TextStyle(
                color: Colors.grey,
                fontSize: 30,
                decoration: TextDecoration.lineThrough,
              )
            : const TextStyle(fontSize: 30),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
