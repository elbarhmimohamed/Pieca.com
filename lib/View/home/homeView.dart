import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pieca/view_model/control_view_model.dart';

class HomeView extends GetWidget<HomeViewCoontroller> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<HomeViewCoontroller>(
      //init: Get.find(),
      builder: (controller) => Scaffold(
        body: controller.currentScreen,
        bottomNavigationBar: MybuttomNavig(),
      ),
    );
  }

  Widget MybuttomNavig() {
    return GetBuilder<HomeViewCoontroller>(
      init: HomeViewCoontroller(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.storefront_rounded,
              ),
              icon: Icon(
                Icons.storefront_outlined,
              ),
              label: 'Annonce'),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.shopping_cart,
              ),
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: 'Panier'),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.sms,
            ),
            icon: Icon(
              Icons.sms_outlined,
            ),
            label: 'Message',
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person,
              ),
              icon: Icon(Icons.person_outline),
              label: 'Compte'),
        ],
        currentIndex: controller.navigatorValue,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          controller.ChangeSelectedValue(index);
        },
      ),
    );
  }
}
