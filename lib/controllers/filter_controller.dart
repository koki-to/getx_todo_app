import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FilterController extends GetxController {
  final RxBool _hideDone = false.obs;

  bool get hideDone => _hideDone.value;

  void toggleHide() {
    _hideDone.toggle();
  }
}
