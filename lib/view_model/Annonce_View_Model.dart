import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pieca/Model/category_model.dart';
import 'package:pieca/Model/product_model.dart';
import 'package:pieca/Model/user_model.dart';
import 'package:pieca/View/Supplier%20Views/annonce_succes.dart';
import 'package:pieca/View/home/homeView.dart';
import 'package:pieca/helper/local_storage_data.dart';
import 'package:pieca/service/home_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pieca/view_model/control_view_model.dart';
import 'package:pieca/view_model/home_view_model.dart';

class AnnonceViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.put(LocalStorageData());
  FirebaseAuth _auth = FirebaseAuth.instance;
  String idProduct, name, descreption, image, prix, stock, cat;

  ValueNotifier get loding => _loding;
  ValueNotifier<bool> _loding = ValueNotifier(false);
  String _nameCat;
  String get nameCat => _nameCat;

  ProductModel _productModel;
  ProductModel get productmodel => _productModel;

  String _userId;
  String get userId => _userId;

  String _catname;
  String get catname => _catname;

  String _picname = '';
  String get picname => _picname;

  CategoryModel _catt;
  CategoryModel get catt => _catt;

  UserModel _userModel;
  UserModel get userModel => _userModel;

  List<UserModel> _userModelProduct;
  List<UserModel> get userModelProduct => _userModelProduct;

  List<CategoryModel> _categories;
  List<CategoryModel> get categories => _categories;

  List<Map<String, dynamic>> _itemsCat;
  List<Map<String, dynamic>> get itemsCat => _itemsCat;

  @override
  void onInit() {
    getCategory();
    getCurrentUser();
    super.onInit();
  }

  void getCurrentUser() async {
    try {
      await localStorageData.getUser.then((value) {
        _userModel = value;
        _userId = _userModel.userId;
        update();
      });
    } catch (e) {
      print(e.toString());
    }
  }

  destroyPicname() {
    _picname = '';
    update();
  }

  getCategory() async {
    _loding.value = true;
    await Homeservice().getCategory().then((value) {
      _categories = value.map((e) => CategoryModel.fromJson(e)).toList();
    });
    update();
    print('object----------->' + categories.length.toString());
    _loding.value = false;
  }

  List<Map<String, dynamic>> itemofcat() {
    List<Map<String, dynamic>> lista = [];
    for (var i = 0; i < categories.length; i++) {
      lista.add({'value': categories[i].name, 'label': categories[i].name});
    }
    return lista;
  }

  UploadImage() async {
    final ImagePicker _picker = ImagePicker();

    XFile image;
    //permission photo
    await Permission.photos.request();
    var permissionPhotoStatus = await Permission.photos.status;

    if (permissionPhotoStatus.isGranted) {
      image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        print('imaget bien telecharger');
        _picname = image.path;
        update();
      } else {
        print('No path recevied');
      }
    } else {
      print('Grant permission and try again');
    }
  }

  saveProduct() async {
    await this.getCurrentUser();
    var urL = "";
    if (picname != "") {
      final _storage = FirebaseStorage.instance;
      var file = File(picname);
      var snapshot = await _storage
          .ref()
          .child('images_annonce/' + picname)
          .putFile(file)
          .onError((error, stackTrace) => null);
      print('success');
      urL = await snapshot.ref.getDownloadURL();
    }
    ProductModel productModel1 = ProductModel(
        idProduct: genererID(),
        name: name,
        descreption: descreption,
        image: urL,
        prix: int.parse(prix),
        stock: int.parse(stock),
        idUser: userId,
        nameCat: cat);

    Homeservice().addProductToFirebase(productModel1);
    print(productModel1);

    await HomeViewModel().getCategory();
    Get.offAll(() => AnnonceSucces());
  }

  String genererID() {
    String Caracters = "123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    String RandomString = "";
    int lengthS = 20;
    Random rand = new Random();
    var text;

    for (var i = 0; i < 20; i++) {
      RandomString += Caracters[rand.nextInt(lengthS)];
    }
    return RandomString;
  }
}
