import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testgorevi/model/sub_menu_model/sub_menu.dart';
import 'package:testgorevi/service/sub_menu_service.dart';

final getSubMenuProvider = ChangeNotifierProvider((ref) => SubMenuViewModel());

enum SubMenuStatus { LOADING, COMPLETED, NOT_INTERNET_CONNECTION, ERROR }

class SubMenuViewModel extends ChangeNotifier {
  SubMenuStatus _getLoadingStaus = SubMenuStatus.LOADING;
  SubMenuStatus get getLoadingStaus => _getLoadingStaus;

  late SubMenu _getSubMenuList;
  SubMenu get getSubMenuList => _getSubMenuList;

  Future<void> getSubMenuViewModel({required String subKey}) async {
    _getLoadingStaus = SubMenuStatus.LOADING;

    notifyListeners();
    try {
      var result = await SubMenuService().getSubMenu();

      _getSubMenuList = result.where((element) => element.key == subKey).first;

      _getLoadingStaus = SubMenuStatus.COMPLETED;
    } catch (error) {
      log(error.toString());
      _getLoadingStaus = SubMenuStatus.ERROR;
    } finally {
      notifyListeners();
    }
  }
}
