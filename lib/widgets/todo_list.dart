import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/controllers/todo_controller.dart';
import 'package:getx_todo_app/widgets/todo_tile.dart';

class TodoList extends StatelessWidget {
  TodoList({Key? key}) : super(key: key);
  final todoController = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Obx(
            () {
              final todos = todoController.todos;
              return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return TodoTile(todo: todo); // TODO:TodoTileウィジェットを作成
                },
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // TODO:ActionButtonを作成する（左下の完了削除ボタン）
              // TODO:ActionButtonを作成する（右下の新規追加ボタン）
            ],
          ),
        ],
      ),
    );
  }
}
