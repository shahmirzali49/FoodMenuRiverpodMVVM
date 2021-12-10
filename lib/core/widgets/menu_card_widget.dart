import 'package:flutter/material.dart';
import 'package:testgorevi/core/utils/colors.dart';
import 'package:testgorevi/core/utils/custom_textstyle.dart';

class MenuCardWidget extends StatelessWidget {
  const MenuCardWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    this.subtitle,
    required this.onTap,
  }) : super(key: key);

  final String imagePath;
  final String title;
  final String? subtitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(imagePath),
          ),
          Text(
            title,
            style: CustomTextStyles(context).headline2(
              fontColor: ColorConst().blackColor,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          if (subtitle != null)
            Text(
              subtitle ?? " ",
              style: CustomTextStyles(context).headline2(
                fontColor: ColorConst().blackColor,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
