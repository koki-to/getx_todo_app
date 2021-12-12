import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/controllers/todo_controller.dart';
import 'package:getx_todo_app/widgets/action_button.dart';
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
                  return TodoTile(key: Key(todo.id), todo: todo); // TODO:TodoTileウィジェットを作成
                },
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ActionButton(
                label: '完了削除'.tr,
                icon: Icons.delete,
                color: Colors.grey,
                onPressed: () {
                  // TODO: フィルタが解除されていて、一つでも完了タスクがある場合のみ動作させる
                  todoController.deleteDone();
                },
              ),
              ActionButton(
                label: '新規作成',
                icon: Icons.add,
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () => Get.toNamed('/todo'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
