import 'package:flutter/material.dart';
import 'package:xico/core/resources/styles/custom_colors.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String description;
  final void Function() onTap;

  const MenuItem({Key key, @required this.title, @required this.description, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: primaryColor,
            width: 2,
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: [
              Text(title),
              Text(description),
            ],
          ),
        ),
      ),
    );
  }
}
