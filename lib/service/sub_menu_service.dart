import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:testgorevi/core/utils/constant.dart';
import 'package:testgorevi/model/sub_menu_model/sub_menu.dart';

class SubMenuService {
  Future<List<SubMenu>> getSubMenu() async {
    final String response = await rootBundle.loadString(Constants.subMenuPath);
    final result = json.decode(response);
    Iterable list = result;
    return list.map((json) => SubMenu.fromJson(json)).toList();
  }
}
