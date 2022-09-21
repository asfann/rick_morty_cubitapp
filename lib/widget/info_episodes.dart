
import 'package:flutter/material.dart';

class InfoEpisode extends StatelessWidget {
  const InfoEpisode({
    Key? key, required this.title, required this.name, required this.leading,
  }) : super(key: key);
  final String title;
  final String name;
  final String leading;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 24,right: 24),
      child:  Card(
        color: const Color(0xFFFAFAFA),
        child: ListTile(
          leading: Text(leading,
            style: const TextStyle(
              fontSize: 14,
            ),),
          title: Text( title,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),),
          subtitle: Text(name,
            style: const TextStyle(
              fontSize: 14,
            ),),


          trailing: const Icon(Icons.arrow_forward_ios_sharp),
        ),

      ),
    );
  }
}
