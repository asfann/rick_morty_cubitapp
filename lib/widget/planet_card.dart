
import 'package:flutter/material.dart';

class PlanetCard extends StatelessWidget {
  const PlanetCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  Padding(
      padding:  EdgeInsets.only(top: 36),
      child: Card(
        color: Color(0xFFFAFAFB),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 38.0),
          child: ListTile(
            title: Center(
              child: Text('Earth (C-137)',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),
            ),
            subtitle: Center(
              child: Text('Planet',style: TextStyle(
                  fontSize: 14
              ),),
            ),
          ),
        ),
      ),
    );
  }
}
