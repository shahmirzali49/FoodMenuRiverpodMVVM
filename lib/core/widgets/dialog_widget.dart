import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testgorevi/core/extension/context_extension.dart';
import 'package:testgorevi/core/utils/colors.dart';
import 'package:testgorevi/core/utils/custom_textstyle.dart';
import 'package:testgorevi/view/sub_menu/sub_menu_screen.dart';
import 'package:testgorevi/view_model/sub_menu_view_model.dart';

Future<void> subMenuDialog({
  required BuildContext context,
  required List<String> list,
}) {
  return showCupertinoDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Sub Menu",
              style: CustomTextStyles(context).headline1(
                fontColor: ColorConst().blackColor,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: list.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.read(getSubMenuProvider).getSubMenuViewModel(subKey: list[index]);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SubMenuScreen()),
                    );
                  },
                  child: Card(
                    elevation: 2,
                    margin: EdgeInsets.all(15),
                    child: Text(
                      list[index],
                      style: CustomTextStyles(context).headline1(
                        fontColor: ColorConst().blackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
    },
  );
}
