
import 'package:flutter/material.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({
    Key? key, required this.onTap,
  }) : super(key: key);
final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 8,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'images/_image_.png',
                fit: BoxFit.fill,
              ),
              const ListTile(
                title: Text('Rick Sanchez'),
                subtitle: Text("Human"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
