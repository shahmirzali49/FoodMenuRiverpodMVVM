import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testgorevi/core/widgets/menu_card_widget.dart';
import 'package:testgorevi/view/main_menu/main_inner_menu_screen.dart';
import 'package:testgorevi/view_model/menu_view_model.dart';
import 'package:testgorevi/core/extension/context_extension.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  @override
  void initState() {
    // ModalRoute.of<String>(context)!.settings.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ana Menu"),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final getMainMenu = watch(getMainMenuProvider);

          return getMainMenu.getLoadingStaus != MainMenuStatus.COMPLETED
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : MainMenuGridView(getMainMenu: getMainMenu);
        },
      ),
    );
  }
}

class MainMenuGridView extends StatelessWidget {
  const MainMenuGridView({
    Key? key,
    required this.getMainMenu,
  }) : super(key: key);

  final MainMenuViewModel getMainMenu;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenHeight * 0.02,
        vertical: context.screenHeight * 0.02,
      ),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.15,
        crossAxisSpacing: 16,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      itemCount: getMainMenu.getMainMenuList.length,
      itemBuilder: (context, index) {
        return MenuCardWidget(
          imagePath: getMainMenu.getMainMenuList[index].image,
          title: getMainMenu.getMainMenuList[index].name,
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InnerMenuScreen(
                        itemList: getMainMenu.getMainMenuList[index].items,
                      )),
            );
          },
        );
      },
    );
  }
}
