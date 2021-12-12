import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/controllers/todo_controller.dart';

class AppMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final controller = Get.find<TodoController>();
    final todoId = Get.parameters['todoId']!;
    final todo = controller.getTodoById(todoId);
    if (todo == null) {
      return const RouteSettings(name: '/home');
    }
  }
}
