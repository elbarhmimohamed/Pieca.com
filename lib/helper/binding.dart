import 'package:get/get.dart';
import 'package:pieca/View/Auth/Signup/signup_view_model.dart';
import 'package:pieca/helper/local_storage_data.dart';
import 'package:pieca/view_model/auth_View_Model.dart';
import 'package:pieca/view_model/commande_view_model.dart';
import 'package:pieca/view_model/control_view_model.dart';
import 'package:pieca/view_model/home_view_model.dart';
import 'package:pieca/view_model/panier_view_model.dart';
import 'package:pieca/view_model/profil_view_model.dart';

class Binding extends Bindings {
  @override
  /*void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewCoontroller());
    Get.lazyPut(() => SignupViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => PanierViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => ProfilViewModel());
  }*/
  void dependencies() {
    Get.put<AuthViewModel>(AuthViewModel(), permanent: true);
    Get.put<HomeViewCoontroller>(HomeViewCoontroller(), permanent: true);
    Get.put<SignupViewModel>(SignupViewModel(), permanent: true);
    Get.put<HomeViewModel>(HomeViewModel(), permanent: true);
    Get.put<PanierViewModel>(PanierViewModel(), permanent: true);
    Get.put<LocalStorageData>(LocalStorageData(), permanent: true);
    Get.put<ProfilViewModel>(ProfilViewModel(), permanent: true);
    Get.put<CommandeViewModel>(CommandeViewModel(), permanent: true);
  }
}
