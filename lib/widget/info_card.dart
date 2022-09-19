
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 24,right: 24),
      child:  Card(
        color: Color(0xFFFAFAFA),
        child: ListTile(
          title: Text("Gender",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),),
          subtitle: Text('Male',
            style: TextStyle(
              fontSize: 14,
            ),),
        ),
      ),
    );
  }
}
