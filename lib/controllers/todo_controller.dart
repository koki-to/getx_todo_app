import 'package:get/get.dart';
import 'package:getx_todo_app/controllers/filter_controller.dart';
import 'package:getx_todo_app/model/todo.dart';
import 'package:getx_todo_app/services/storage_service.dart';

class TodoController extends GetxController {
  final _todos = <Todo>[].obs;

  final _storage = TodoStorage();
  late final Worker _worker;

  // 未完了タスクとの切り替え
  List<Todo> get todos {
    final hideDone = Get.find<FilterController>().hideDone;
    if (hideDone) {
      return _todos.where((todo) => todo.done == false).toList();
    } else {
      return _todos;
    }
  }

  int get countUndone {
    return _todos.fold(0, (acc, todo) {
      if (!todo.done) {
        acc++;
      }
      return acc;
    });
  }

  @override
  void onInit() {
    super.onInit();
    final storageTodo = _storage.load()?.map((json) => Todo.fromJson(json)).toList();
    final initialTodos = storageTodo ?? Todo.initialTodos;
    _todos.addAll(initialTodos);

    // _todosに変化がある度にストレージに保存
    _worker = ever<List<Todo>>(_todos, (todos) {
      final data = todos.map((e) => e.toJson()).toList();
      _storage.save(data);
    });
  }

  Todo? getTodoById(String id) {
    try {
      return _todos.singleWhere((e) => e.id == id);
    } on StateError {
      return null;
    }
  }

  // Todoの追加
  void addTodo(String description) {
    final todo = Todo(description: description);
    _todos.add(todo);
  }

  // Todoのtext更新
  void updateText(String description, Todo todo) {
    final index = _todos.indexOf(todo);
    final newTodo = todo.copyWith(description: description);
    _todos.setAll(index, [newTodo]);
  }

  // Todoの完了状況更新
  void updateDone(bool done, Todo todo) {
    final index = _todos.indexOf(todo);
    final newTodo = todo.copyWith(done: done);
    _todos.setAll(index, [newTodo]);
  }

  // Todoの削除
  void remove(Todo todo) {
    _todos.remove(todo);
  }

  // 完了タスクの一括削除
  void deleteDone() {
    _todos.removeWhere((e) => e.done == true);
  }
}
