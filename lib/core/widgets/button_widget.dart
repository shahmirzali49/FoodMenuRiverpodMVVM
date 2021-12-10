import 'package:flutter/material.dart';
import 'package:testgorevi/core/utils/colors.dart';
import 'package:testgorevi/core/utils/custom_textstyle.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function() onClicked;

  const ButtonWidget({
    required this.text,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      style: ElevatedButton.styleFrom(
        primary: ColorConst().cyanBlueColor,
      ),
      child: Text(
        text,
        style: CustomTextStyles(context).headline1(
          fontColor: ColorConst().whiteColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
