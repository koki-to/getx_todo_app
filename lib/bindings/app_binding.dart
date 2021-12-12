import 'package:get/get.dart';
import 'package:getx_todo_app/controllers/filter_controller.dart';
import 'package:getx_todo_app/controllers/todo_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoController());
    Get.lazyPut(() => FilterController());
  }
}
