import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_todo_app/services/storage_service.dart';

class FilterController extends GetxController {
  final RxBool _hideDone = false.obs;

  bool get hideDone => _hideDone.value;

  final _storage = FilterStorage();
  late final Worker _worker;

  void toggleHide() {
    _hideDone.toggle();
  }

  @override
  void onInit() {
    super.onInit();
    _hideDone.value = _storage.load() ?? false;
    _worker = ever<bool>(_hideDone, (value) {
      _storage.save(value);
    });
  }

  @override
  void onClose() {
    _worker.dispose();
    super.onClose();
  }
}
