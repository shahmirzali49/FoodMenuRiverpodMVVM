
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testgorevi/model/main_menu_model/menu.dart';
import 'package:testgorevi/service/menu_service.dart';

final getMainMenuProvider = ChangeNotifierProvider((ref) => MainMenuViewModel());

enum MainMenuStatus { LOADING, COMPLETED, NOT_INTERNET_CONNECTION, ERROR }

class MainMenuViewModel extends ChangeNotifier {
  MainMenuStatus _getLoadingStaus = MainMenuStatus.LOADING;
  MainMenuStatus get getLoadingStaus => _getLoadingStaus;

  late List<Menu> _getMainMenuList;
  List<Menu> get getMainMenuList => _getMainMenuList;

  Future<void> getMainMenuViewModel() async {
    try {
      _getMainMenuList = await MainMenuService().getMenu();

      _getLoadingStaus = MainMenuStatus.COMPLETED;
    } catch (error) {
      _getLoadingStaus = MainMenuStatus.ERROR;
    } finally {
      notifyListeners();
    }
  }
}
