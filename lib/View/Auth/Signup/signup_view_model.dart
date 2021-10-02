import 'package:get/get.dart';

class SignupViewModel extends GetxController {
  int _roleValue = 1;

  get roleValue => _roleValue;

  void ChangeSelectedValue(int SelectedValue) {
    _roleValue = SelectedValue;
    update();
  }
}
