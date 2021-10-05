import 'package:cboard_mobile/widgets/text_locale.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final AppBar appBar;
  final List<Widget> widgets;

  const BaseAppBar({Key key, this.title, this.appBar, this.widgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      actions: widgets,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
