import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/controllers/filter_controller.dart';
import 'package:getx_todo_app/controllers/locale_controller.dart';
import 'package:getx_todo_app/controllers/theme_controller.dart';
import 'package:getx_todo_app/controllers/todo_controller.dart';
import 'package:getx_todo_app/widgets/todo_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final todoController = Get.find<TodoController>();
  final filterController = Get.find<FilterController>();
  final themeController = Get.find<ThemeController>();
  final localeController = Get.find<LocaleController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(() => Text('タイトル' '(${todoController.countUndone})'.tr)), // TODO:未完了タスクの数を表示
        leading: IconButton(
            icon: Obx(() => Icon(
                  filterController.hideDone ? Icons.filter_alt : Icons.filter_alt_outlined,
                )),
            onPressed: filterController.toggleHide),
        actions: [
          IconButton(icon: const Icon(Icons.language), onPressed: localeController.changeLocale),
          IconButton(icon: const Icon(Icons.color_lens), onPressed: themeController.chengeTheme),
        ],
      ),
      body: TodoList(),
    );
  }
}
