import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pieca/Model/user_model.dart';
import 'package:pieca/View/home/homeView.dart';
import 'package:pieca/helper/local_storage_data.dart';
import 'package:pieca/service/firestore_user.dart';
import 'package:pieca/view_model/profil_view_model.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  String email, password, name, password_confirmation;

  Rxn<User> _user = Rxn<User>();
  String get user => _user.value?.email;

  final LocalStorageData localStorageData = Get.put(LocalStorageData());
  final ProfilViewModel profilViewModel = Get.put(ProfilViewModel());

  String _role = 'Client';
  String get role => _role;

  bool _roleval = false;
  bool get roleval => _roleval;

  Icon _iconLogin = Icon(Icons.visibility_off);
  Icon get iconLogin => _iconLogin;
  Icon _iconpassword = Icon(Icons.visibility_off);
  Icon get iconpassword => _iconpassword;
  Icon _iconconfirmation = Icon(Icons.visibility_off);
  Icon get iconconfirmation => _iconconfirmation;

  bool _obscureTextLogin = true;
  bool get obscureTextLogin => _obscureTextLogin;

  bool _obscureTextpassword = true;
  bool get obscureTextpassword => _obscureTextpassword;

  bool _obscureTextconfirmation = true;
  bool get obscureTextconfirmation => _obscureTextconfirmation;

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
      getCurrentUserData(_auth.currentUser.uid);
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

  void changerole(bool value) {
    if (value) {
      _role = 'Fournisseur';
      _roleval = true;
    } else {
      _role = 'Client';
      _roleval = false;
    }
    update();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential).then((user) async {
      profilViewModel.loding.value = true;
      UserModel userModel1 = UserModel(
        userId: user.user.uid,
        userName: user.user.displayName,
        email: user.user.email,
        role: 'Client',
        //phone: ''
      );
      await FireStoreUser().addUserToFirebase(userModel1);
      getCurrentUserData(user.user.uid);
      profilViewModel.loding.value = false;

      Get.offAll(() => HomeView());
    });
  }

  void LoginWithEmainAndPassword() async {
    globalKeylogin.currentState.save();
    if (globalKeylogin.currentState.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((user) async {
          getCurrentUserData(user.user.uid);
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
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((user) async {
          saveUser(user);
          getCurrentUserData(user.user.uid);
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
      userId: user.user.uid,
      userName: name,
      email: email,
      role: role,
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
      await FireStoreUser().getUserById(uid).then((value) {
        setUSer(UserModel.fromJson(value.data() as Map<String, dynamic>));
        profilViewModel.getCurrentUser();
      });
    } catch (e) {
      print(e.toString());
    }
  }

  changeIconLogin() {
    if (_obscureTextLogin == true) {
      _iconLogin = Icon(
        Icons.visibility,
        color: Color(0xff1e88e5),
      );
      _obscureTextLogin = false;
    } else {
      _iconLogin = Icon(Icons.visibility_off);
      _obscureTextLogin = true;
    }
    update();
  }

  changeIconPassword() {
    if (_obscureTextpassword == true) {
      _iconpassword = Icon(Icons.visibility, color: Color(0xff709BE4));
      _obscureTextpassword = false;
    } else {
      _iconpassword = Icon(Icons.visibility_off);
      _obscureTextpassword = true;
    }
    update();
  }

  changeIconConfirmation() {
    if (_obscureTextconfirmation == true) {
      _iconconfirmation = Icon(Icons.visibility, color: Color(0xff709BE4));
      _obscureTextconfirmation = false;
    } else {
      _iconconfirmation = Icon(Icons.visibility_off);
      _obscureTextconfirmation = true;
    }
    update();
  }
}
