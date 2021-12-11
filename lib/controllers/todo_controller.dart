import 'package:get/get.dart';
import 'package:getx_todo_app/model/todo.dart';

class TodoController extends GetxController {
  final _todos = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    _todos.addAll(Todo.initialTodos);
  }

  List<Todo> get todos => _todos;
}
