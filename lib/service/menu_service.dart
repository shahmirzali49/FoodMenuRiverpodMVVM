import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:testgorevi/core/utils/constant.dart';
import 'package:testgorevi/model/main_menu_model/menu.dart';

class MainMenuService {
  Future<List<Menu>> getMenu() async {
    final String response = await rootBundle.loadString(Constants.mainMenuPath);
    final result = json.decode(response);
    Iterable list = result;
    return list.map((json) => Menu.fromJson(json)).toList();
  }
}
