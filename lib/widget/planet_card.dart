
import 'package:flutter/material.dart';

import '../domain/models/location/location_model.dart';

class PlanetCard extends StatelessWidget {
  const PlanetCard({
    Key? key, required this.onTap, required this.location,
  }) : super(key: key);
final Function() onTap;
final Location location;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const  EdgeInsets.only(top: 36),
      child: GestureDetector(
        onTap: onTap,
        child:   Card(
          color: const Color(0xFFFAFAFB),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: ListTile(
              title: Center(
                child: Text(location.name,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
              ),
              subtitle: Center(
                child: Text(location.type,style: const TextStyle(
                    fontSize: 14
                ),),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
