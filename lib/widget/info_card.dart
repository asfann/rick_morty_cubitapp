import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.title,
    required this.name,
    this.showArrow = false,  this.onTap,  this.onTapBool=false,
  }) : super(key: key);
  final String title;
  final bool showArrow;
  final String name;
  final Function()? onTap;
  final bool onTapBool;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: GestureDetector(
        onTap: onTapBool ? onTap : null,
        child: Card(
          color: const Color(0xFFFAFAFA),
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              name,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            trailing: showArrow ? const Icon(Icons.arrow_forward_ios_sharp) : null,
          ),
        ),
      ),
    );
  }
}
