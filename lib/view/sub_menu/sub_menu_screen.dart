import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testgorevi/core/extension/context_extension.dart';
import 'package:testgorevi/core/widgets/menu_card_widget.dart';
import 'package:testgorevi/view_model/sub_menu_view_model.dart';

class SubMenuScreen extends StatefulWidget {
  const SubMenuScreen({Key? key}) : super(key: key);

  @override
  _SubMenuScreenState createState() => _SubMenuScreenState();
}

class _SubMenuScreenState extends State<SubMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final getSubMenu = watch(getSubMenuProvider);

        return getSubMenu.getLoadingStaus != SubMenuStatus.COMPLETED
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                appBar: AppBar(
                  title: Text(getSubMenu.getSubMenuList.key),
                ),
                body: SubMenuGridView(getSubMenu: getSubMenu),
              );
      },
    );
  }
}

class SubMenuGridView extends StatelessWidget {
  const SubMenuGridView({
    Key? key,
    required this.getSubMenu,
  }) : super(key: key);

  final SubMenuViewModel getSubMenu;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenHeight * 0.02,
        vertical: context.screenHeight * 0.02,
      ),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.9,
        crossAxisSpacing: 16,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      itemCount: getSubMenu.getSubMenuList.items.length,
      // physics: ScrollPhysics(),
      itemBuilder: (context, index) {
        return MenuCardWidget(
          imagePath: getSubMenu.getSubMenuList.items[index].image,
          title: getSubMenu.getSubMenuList.items[index].name,
          subtitle: getSubMenu.getSubMenuList.items[index].price,
          onTap: () {},
        );
      },
    );
  }
}
