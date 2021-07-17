import 'package:flutter/material.dart';

class PageHeader {
  static AppBar getAppBar(String title, BuildContext context,
      [final void Function(int)? action, int? index]) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
      leading: GestureDetector(
        onTap: () =>
            action != null ? action(index!) : Navigator.of(context).pop(),
        child: Icon(
          Icons.arrow_back_ios_sharp,
          color: Theme.of(context).primaryColor,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
