import 'package:flutter/material.dart';
import 'package:testgorevi/core/extension/context_extension.dart';
import 'package:testgorevi/core/widgets/dialog_widget.dart';
import 'package:testgorevi/core/widgets/menu_card_widget.dart';
import 'package:testgorevi/model/main_menu_model/item.dart';

class InnerMenuScreen extends StatefulWidget {
  const InnerMenuScreen({Key? key, this.itemList}) : super(key: key);
  final List<Item>? itemList;
  @override
  _InnerMenuScreenState createState() => _InnerMenuScreenState();
}

class _InnerMenuScreenState extends State<InnerMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu içi"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenHeight * 0.02,
          vertical: context.screenHeight * 0.02,
        ),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.94,
          crossAxisSpacing: 16,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        itemCount: widget.itemList?.length,
        itemBuilder: (context, index) {
          return MenuCardWidget(
            imagePath: widget.itemList![index].image,
            title: widget.itemList![index].name,
            subtitle: widget.itemList![index].price.toString(),
            onTap: () {
              if (widget.itemList![index].subMenus!.isNotEmpty) {
                subMenuDialog(
                  context: context,
                  list: widget.itemList![index].subMenus!,
                );
              }
            },
          );
        },
      ),
    );
  }
}
