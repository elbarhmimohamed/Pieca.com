import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pieca/Model/user_model.dart';
import 'package:pieca/View/home/homeView.dart';
import 'package:pieca/helper/local_storage_data.dart';
import 'package:pieca/service/firestore_user.dart';
import 'package:pieca/view_model/profil_view_model.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn? _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? email, password, name, role, password_confirmation;

  Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;
  final LocalStorageData localStorageData = Get.put(LocalStorageData());
  final ProfilViewModel profilViewModel = Get.put(ProfilViewModel());

  Icon _icon = Icon(Icons.visibility_off);
  Icon get icon => _icon;

  bool _obscureText = true;
  bool get obscureText => _obscureText;

  GlobalKey<FormState> globalKeylogin = GlobalKey();

  AuthViewModel() {
    onInit();
  }

  @override
  void onInit() {
    print('_auth.currentUser :::: ');
    super.onInit();
    print(_auth.currentUser);
    _user.bindStream(_auth.authStateChanges());
    if (_auth.currentUser != null) {
      getCurrentUserData(_auth.currentUser!.uid);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn!.signIn();
    print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential).then((user) async {
      profilViewModel.loding.value = true;
      UserModel userModel = UserModel(
        userId: user.user!.uid,
        userName: user.user!.displayName,
        email: user.user!.email,
        role: 'Client',
        //phone: ''
      );
      await FireStoreUser().addUserToFirebase(userModel);
      getCurrentUserData(user.user!.uid);
      profilViewModel.loding.value = false;

      Get.offAll(() => HomeView());
    });
  }

  void LoginWithEmainAndPassword() async {
    globalKeylogin.currentState!.save();
    if (globalKeylogin.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email!, password: password!)
            .then((value) async {
          getCurrentUserData(value.user!.uid);
        });
        Get.offAll(() => HomeView());
      } catch (e) {
        Get.snackbar(
          'Erreur de connexion !!',
          e.toString(),
          colorText: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  void SignUpWithEmainAndPassword() async {
    if (password == password_confirmation) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email!, password: password!)
            .then((user) async {
          saveUser(user);
          getCurrentUserData(user.user!.uid);
        });
        Get.offAll(() => HomeView());
      } catch (e) {
        print(e.toString());
        Get.snackbar(
          'Erreur de Creation de compte !!',
          e.toString(),
          colorText: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      userName: name,
      email: email,
      role: 'Client',
      //phone: ''
    );
    await FireStoreUser().addUserToFirebase(userModel);
    setUSer(userModel);
  }

  void setUSer(UserModel userModel) async {
    await localStorageData.setUserData(userModel);
  }

  void getCurrentUserData(String uid) async {
    try {
      await FireStoreUser().GetUserById(uid).then((value) {
        setUSer(UserModel.fromJson(value.data() as Map<dynamic, dynamic>));
        profilViewModel.getCurrentUser();
      });
    } catch (e) {
      print(e.toString());
    }
  }

  changeIcon() {
    if (_obscureText == true) {
      _icon = Icon(
        Icons.visibility,
        color: Color(0xff1e88e5),
      );
      _obscureText = false;
    } else {
      _icon = Icon(Icons.visibility_off);
      _obscureText = true;
    }
    update();
  }
}
