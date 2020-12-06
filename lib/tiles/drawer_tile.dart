import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController controller;
  final int page;
  const DrawerTile(this.icon, this.text, this.controller, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          controller.jumpToPage(page);
        },
        child: Container(
          child: Row(
            children: [
              Icon(
                icon,
                size: 32.0,
                color: controller.page.round() == page
                    ? Theme.of(context).primaryColor
                    : Colors.grey[300],
              ),
              SizedBox(width: 32.0),
              Text(
                text,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
