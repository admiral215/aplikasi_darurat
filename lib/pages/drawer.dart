import 'package:aplikasi_darurat/pages/home.dart';
import 'package:aplikasi_darurat/pages/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerScreen extends StatelessWidget {
late final _drawerController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      moveMenuScreen: false,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      controller: _drawerController,
      mainScreen: HomePage(),
      menuScreen: MenuScreen(),
      showShadow: true,
      style: DrawerStyle.defaultStyle,
      menuBackgroundColor: Colors.grey.shade900,
      borderRadius: 30,
      // slideWidth: 340,
      shadowLayer1Color: Colors.grey[400],
      shadowLayer2Color: Colors.grey[350],
      mainScreenTapClose: true,
    );
  }
}

// if (ZoomDrawer.of(context)!.isOpen()){
//               ZoomDrawer.of(context)!.close();
//             } else {
//               ZoomDrawer.of(context)!.open();
//             }