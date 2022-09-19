
import 'package:flutter/material.dart';

class MainLogo extends StatelessWidget {
  const MainLogo({
    Key? key, required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Center(
        child: Image.asset(image),
      ),
    );
  }
}